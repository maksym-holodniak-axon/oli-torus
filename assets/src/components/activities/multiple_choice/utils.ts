import { MCSchema } from 'components/activities/multiple_choice/schema';
import {
  Choice,
  HasParts,
  makeChoice,
  makeHint,
  makePart,
  makeStem,
  makeResponse,
  makeTransformation,
  Transform,
} from 'components/activities/types';
import { Choices } from 'data/activities/model/choices';

import { containsRule, eqRule, equalsRule, matchRule } from 'data/activities/model/rules';
import { getCorrectResponse, Responses } from 'data/activities/model/responses';
import { Maybe } from 'tsmonad';

export const defaultMCModel: () => MCSchema = () => {
  const choiceA: Choice = makeChoice('Choice A');
  const choiceB: Choice = makeChoice('Choice B');

  return {
    stem: makeStem(''),
    choices: [choiceA, choiceB],
    authoring: {
      version: 2,
      parts: [
        makePart(
          Responses.forMultipleChoice(choiceA.id),
          [makeHint(''), makeHint(''), makeHint('')],
          '1',
        ),
      ],
      targeted: [],
      transformations: [makeTransformation('choices', Transform.shuffle, true)],
      previewText: '',
    },
  };
};

export function build(q: any):  MCSchema {

  const choices = q.options.map((o: any) => {
    if (o.text !== undefined) {
      return makeChoice(o.text);
    }
    return makeChoice(o.option);
  });

  let i = 0;
  while (i < q.options.length) {
    if (q.options[i].isCorrect || q.options[i].correct) break;
    i++;
  }

  return {
    stem: makeStem(q.question),
    choices,
    authoring: {
      version: 2,
      parts: [
        makePart(
          [
            makeResponse(matchRule(choices[i].id), 1, 'Correct.'),
            makeResponse(matchRule('.*'), 0, 'Incorrect.'),
          ],
          [makeHint(''), makeHint(''), makeHint('')],
          '1',
        ),
      ],
      targeted: [],
      transformations: [makeTransformation('choices', Transform.shuffle, true)],
      previewText: '',
    },
  };
};

export const getCorrectChoice = (model: HasParts, partId: string) => {
  const correct = getCorrectResponse(model, partId);

  if (correct === null) {
    return Maybe.nothing<Choice>();
  }

  let value = correct.rule.substring(correct.rule.indexOf('{') + 1);
  value = value.substring(0, value.indexOf('}'));

  const choice = Choices.getOne(model, value);
  if (choice === null || choice === undefined) {
    return Maybe.nothing<Choice>();
  }

  return Maybe.just(choice);
};
