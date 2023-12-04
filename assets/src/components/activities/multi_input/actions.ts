import { Descendant, Editor, Element, Operation } from 'slate';
import { MCActions } from 'components/activities/common/authoring/actions/multipleChoiceActions';
import { StemActions } from 'components/activities/common/authoring/actions/stemActions';
import {
  Dropdown,
  MultiInput,
  MultiInputSchema,
  MultiInputSize,
  MultiInputType,
} from 'components/activities/multi_input/schema';
import {
  Choice,
  ChoiceId,
  HasParts,
  Part,
  PostUndoable,
  ResponseId,
  Stem,
  Transform,
  makeChoice,
  makeHint,
  makePart,
  makeTransformation,
  makeUndoable,
} from 'components/activities/types';
import { elementsAdded, elementsOfType, elementsRemoved } from 'components/editing/slateUtils';
import { Choices } from 'data/activities/model/choices';
import { List } from 'data/activities/model/list';
import { getCorrectResponse, getResponseBy } from 'data/activities/model/responses';
import { matchRule } from 'data/activities/model/rules';
import { getByUnsafe, getPartById, getParts } from 'data/activities/model/utils';
import { InputRef } from 'data/content/model/elements/types';
import { clone } from 'utils/common';
import { Operations } from 'utils/pathOperations';
import { MultiInputResponses, replaceWithInputRef } from './utils';

export const MultiInputActions = {
  editStemAndPreviewText(content: Descendant[], editor: Editor, operations: Operation[]) {
    return (model: MultiInputSchema, post: PostUndoable) => {
      console.log('-----editStemAndPreviewText');
    //   try {
    //     // Code throwing an exception
    //     throw new Error();
    // } catch(e) {
    //     console.log(e.stack);
    // }
      const removedInputRefs = elementsRemoved<InputRef>(operations, 'input_ref');

      // Handle error condition - removing an extra input ref that is not present in the model
      if (
        removedInputRefs.length > 0 &&
        removedInputRefs.every((ref) => !model.inputs.find((input) => input.id === ref.id))
      ) {
        console.log('-----editStemAndPreviewText 1');
        StemActions.editStemAndPreviewText(content)(model);
        return;
      }

      if (getParts(model).length - removedInputRefs.length < 1) {
        console.log('-----editStemAndPreviewText 2');
        return;
      }
      if (
        operations.find(
          (op) =>
            op.type === 'insert_node' &&
            Element.isElement(op.node) &&
            op.node.type === 'input_ref' &&
            model.inputs.find((input) => input.id === (op.node as InputRef).id),
        )
      ) {
        console.log('-----editStemAndPreviewText 3');
        // duplicate input id, do nothing
        return;
      }

      console.log('-----editStemAndPreviewText 4');
      // if (!model.multInputsPerPart) {
      //   console.log('-----editStemAndPreviewText 5');
      MultiInputActions.addMissingParts(operations)(model);
      MultiInputActions.removeExtraParts(operations)(model, post);
      // }
      StemActions.editStemAndPreviewText(content)(model);

      // Reorder parts and inputs by new editor model
      const inputRefIds = elementsOfType<InputRef>(editor, 'input_ref').map(({ id }) => id);
      MultiInputActions.reorderInputs(inputRefIds)(model);
      MultiInputActions.reorderPartsByInputs()(model);
    };
  },

  addMissingParts(operations: Operation[]) {
    return (model: MultiInputSchema) => {
      elementsAdded<InputRef>(operations, 'input_ref').forEach((inputRef) =>
        MultiInputActions.addPart(inputRef.id)(model),
      );
    };
  },

  removeExtraParts(operations: Operation[]) {
    return (model: MultiInputSchema, post: PostUndoable) => {
      const removedInputRefs = elementsRemoved<InputRef>(operations, 'input_ref');
      const clonedStem = clone(model.stem);
      const clonedPreviewText = clone(model.authoring.previewText);
      removedInputRefs.forEach((inputRef) =>
        MultiInputActions.removePart(inputRef.id, clonedStem, clonedPreviewText)(model, post),
      );
    };
  },

  moveInputToPart(inputId: string, partId: string) {
    return (model: MultiInputSchema, post: PostUndoable) => {
      if (getParts(model).length < 2 || !model.multInputsPerPart) {
        return;
      }

      const undoables = makeUndoable('Removed a part', [
        Operations.replace('$.inputs', clone(model.inputs)),
        Operations.replace('$.choices', clone(model.choices)),
        Operations.replace('$.authoring', clone(model.authoring)),
      ]);

      const input = getByUnsafe(model.inputs, (input) => input.id === inputId);
      const part = getPartById(model, input.partId);
      const partTo = getPartById(model, partId);
      const rule = part.responses[0].rule;
      // const r: string | undefined = rule.match(new RegExp('input_ref_' + input.id + '\\s=\\s' + '.*\\}'))?.pop();

      const targets = part.targets?.filter((value) => value !== input.id);
      if (!targets || targets.length < 1) {
        Operations.applyAll(model, [
          Operations.filter('$..parts', `[?(@.id!=${part.id})]`),
        ]);
      } else {
        part.targets = targets;
      }

      partTo.targets ? partTo.targets.push(input.id) : partTo.targets = [input.id];
      input.partId = partTo.id;
      partTo.responses[0].rule = partTo.responses[0].rule + ' && ' + rule;
      const response = partTo.responses.find((r) => r.rule.endsWith('{.*}'));
      if (response) {
        response.rule = response?.rule + ' && input_ref_' + input.id + ' like {.*}';
      }

      post(undoables);
    };
  },

  editRule(id: ResponseId, inputId: string, rule: string) {
    return (draftState: HasParts) => {
      getResponseBy(draftState, (r) => r.id === id).rule = replaceWithInputRef(inputId, rule);
    };
  },

  toggleChoiceCorrectness(id: string, partId: string, inputId: string,) {
    return (model: HasParts, _post: PostUndoable) => {
      getCorrectResponse(model, partId).rule = replaceWithInputRef(inputId, matchRule(id));
    };
  },

  addChoice(inputId: string, choice: Choice) {
    return (model: MultiInputSchema) => {
      const input = model.inputs.find((input) => input.id === inputId);
      if (!input || input.inputType !== 'dropdown') return;
      Choices.addOne(choice)(model);
      input.choiceIds.push(choice.id);
    };
  },

  reorderChoices(inputId: string, dropdownChoices: Choice[]) {
    return (model: MultiInputSchema) => {
      const input = model.inputs.find((input) => input.id === inputId);
      if (!input || input.inputType !== 'dropdown') return;

      model.choices = model.choices.filter(
        (choice) => !dropdownChoices.map(({ id }) => id).includes(choice.id),
      );
      model.choices.push(...dropdownChoices);
    };
  },

  reorderPartsByInputs() {
    return (model: MultiInputSchema) => {
      const { getOne, setAll } = List<Part>('$..parts');
      const orderedPartIds = model.inputs.map((input) => input.partId);
      // safety filter in case somehow there's a missing input
      setAll(orderedPartIds.map((id) => getOne(model, id)).filter((x) => !!x))(model);
    };
  },

  reorderInputs(reorderedIds: string[]) {
    return (model: MultiInputSchema) => {
      const { getOne, setAll } = List<MultiInput>('$.inputs');
      // safety filter in case somehow there's a missing input
      setAll(reorderedIds.map((id) => getOne(model, id)).filter((x) => !!x))(model);
    };
  },

  removeChoice(inputId: string, choiceId: ChoiceId) {
    return (model: MultiInputSchema, post: PostUndoable) => {
      const input = getByUnsafe(model.inputs, (input) => input.id === inputId) as Dropdown;
      const inputIndex = input.choiceIds.findIndex((id) => id === choiceId);
      if (input.choiceIds.length < 2) return;

      const choice = Choices.getOne(model, choiceId);
      const choiceIndex = Choices.getAll(model).findIndex((c) => c.id === choiceId);

      // Remove the choice id from the input and the choice from the model
      Choices.removeOne(choiceId)(model);
      input.choiceIds = input.choiceIds.filter((id) => id !== choiceId);

      // if the choice being removed is the correct choice, a new correct choice
      // must be set
      const authoringClone = clone(model.authoring);
      if (getCorrectResponse(model, input.partId).rule === matchRule(choiceId)) {
        MCActions.toggleChoiceCorrectness(input.choiceIds[0], input.partId)(model, post);
      }

      post(
        makeUndoable('Removed a choice', [
          Operations.replace('$.authoring', authoringClone),
          Operations.insert(`$.inputs[?(@.id==${input.id})].choiceIds`, choiceId, inputIndex),
          Operations.insert(Choices.path, clone(choice), choiceIndex),
        ]),
      );
    };
  },

  setInputType(id: string, type: MultiInputType) {
    return (model: MultiInputSchema) => {
      const input = getByUnsafe(model.inputs, (x) => x.id === id);

      const inputTypeChanged = input.inputType !== type;
      if (!inputTypeChanged) return;

      const choices = [makeChoice('Choice A'), makeChoice('Choice B')];
      const part = getPartById(model, input.partId);

      if (input.inputType === 'dropdown') {
        MultiInputActions.removeTargetedMappingsForPart(part)(model);
        MultiInputActions.removeChoicesForInput(input)(model);
        MultiInputActions.removeShuffleTransformationForInput(input)(model);
      }

      if (type === 'dropdown') {
        model.choices.push(...choices);
        (input as Dropdown).choiceIds = choices.map(({ id }) => id);

        // shuffle the choices by default
        model.authoring.transformations.push(
          makeTransformation('choices', Transform.shuffle, true, input.partId),
        );
      }

      part.responses = {
        dropdown: MultiInputResponses.forMultipleChoice(input.id, choices[0].id),
        text: MultiInputResponses.forTextInput(input.id),
        numeric: MultiInputResponses.forNumericInput(input.id),
        math: MultiInputResponses.forMathInput(input.id),
      }[type];

      input.inputType = type;
    };
  },

  setInputSize(inputId: string, size: MultiInputSize) {
    return (model: MultiInputSchema) => {
      const input = getByUnsafe(model.inputs, (x) => x.id === inputId);
      if (!input) return;

      const inputSizeChanged = input.size !== size;
      if (!inputSizeChanged) return;

      input.size = size;
    };
  },

  addPart(inputId: string) {
    console.log('------ Adding part not wanted 1');
    return (model: MultiInputSchema) => {
      console.log('------ Adding part not wanted');
      try {
        // Code throwing an exception
        throw new Error();
    } catch(e) {
        console.log(e.stack);
    }
      const part = makePart(MultiInputResponses.forTextInput(inputId), [makeHint('')]);
      part.targets?.push(inputId);
      model.inputs.push({ inputType: 'text', partId: part.id, id: inputId });
      model.authoring.parts.push(part);
    };
  },

  removeTargetedMappingsForPart(part: Part) {
    return (model: MultiInputSchema) => {
      model.authoring.targeted = model.authoring.targeted.filter(
        ([, responseId]) => !part.responses.find(({ id }) => id === responseId),
      );
    };
  },

  removeChoicesForInput(dropdown: Dropdown) {
    return (model: MultiInputSchema) => {
      model.choices = model.choices.filter((c) => !dropdown.choiceIds.includes(c.id));
    };
  },

  removeShuffleTransformationForInput(dropdown: Dropdown) {
    return (model: MultiInputSchema) => {
      model.authoring.transformations = model.authoring.transformations.filter(
        (t) => t.partId !== dropdown.partId,
      );
    };
  },

  removePart(inputId: string, stem: Stem, previewText: string) {
    return (model: MultiInputSchema, post: PostUndoable) => {
      if (getParts(model).length < 2) {
        return;
      }

      const undoables = makeUndoable('Removed a part', [
        Operations.replace('$.stem', stem),
        Operations.replace('$..previewText', previewText),
        Operations.replace('$.inputs', clone(model.inputs)),
        Operations.replace('$.choices', clone(model.choices)),
        Operations.replace('$.authoring', clone(model.authoring)),
      ]);

      const input = getByUnsafe(model.inputs, (input) => input.id === inputId);
      const part = getPartById(model, input.partId);

      if (input.inputType === 'dropdown') {
        MultiInputActions.removeTargetedMappingsForPart(part)(model);
        MultiInputActions.removeChoicesForInput(input)(model);
      }

      const targets = part.targets?.filter((v) => v != input.id);
      if (!targets || targets.length < 1) {
        Operations.applyAll(model, [
          Operations.filter('$..parts', `[?(@.id!=${part.id})]`),
          Operations.filter('$.inputs', `[?(@.id!=${inputId})]`),
        ]);
      } else {
        Operations.applyAll(model, [
          Operations.filter('$.inputs', `[?(@.id!=${inputId})]`),
        ]);
      }

      post(undoables);
    };
  },
};
