import { ActivityModelSchema, invokeCreationFunc } from 'components/activities';
import { AddCallback } from 'components/content/add_resource_content/AddResourceContent';
import { ActivityEditorMap, EditorDesc } from 'data/content/editors';
import { ActivityReference, ResourceContext, ResourceContent } from 'data/content/resource';
import React from 'react';
import guid from 'utils/guid';
import * as Persistence from 'data/persistence/activity';
import { ResourceChoice } from './ResourceChoice';
import { MCSchema } from 'components/activities/multiple_choice/schema';
import { build } from 'components/activities/multiple_choice/utils';
import * as OpenAI from 'data/persistence/openai';

interface Props {
  onSetTip: (tip: string) => void;
  onResetTip: () => void;
  resourceContext: ResourceContext;
  previousContent: ResourceContent;
  onAddItem: AddCallback;
  editorMap: ActivityEditorMap;
  index: number[];
}
export const AddActivity: React.FC<Props> = ({
  onSetTip,
  onResetTip,
  resourceContext,
  onAddItem,
  editorMap,
  index,
  previousContent
}) => {
  const activityEntries = Object.keys(editorMap)
    .map((k: string) => {
      const editorDesc: EditorDesc = editorMap[k];
      const enabled = editorDesc.globallyAvailable || editorDesc.enabledForProject;

      return enabled ? (
        <ResourceChoice
          key={editorDesc.id}
          onClick={() => {
            addActivity(editorDesc, resourceContext, onAddItem, editorMap, index);
            document.body.click();
          }}
          onHoverStart={() => onSetTip(editorDesc.description)}
          onHoverEnd={() => onResetTip()}
          disabled={false}
          icon={editorDesc.icon}
          label={editorDesc.petiteLabel}
        />
      ) : null;
    })
    .filter((e) => e !== null);

  return (
    <div className="d-flex flex-column">
      <div className="resource-choice-header ml-3">Question types</div>
      <div className="resource-choices activities">
        {activityEntries}
        <ResourceChoice
          key={"openai"}
          onClick={() => {
            const text = toText(previousContent);
            console.log(text);
            chatGPT(editorMap['oli_multiple_choice'], resourceContext, onAddItem, editorMap, index, text);
            document.body.click();
          }}
          onHoverStart={() => onSetTip("OpenAI ChatGPT3 Generated MCQ")}
          onHoverEnd={() => onResetTip()}
          disabled={false}
          icon={"microchip-ai"}
          label={"OpenAI"}
        />
      </div>
    </div>
  );
};

function toText(content: ResourceContent) {
  console.log(content);
  if (content.type === 'content') {
    return content.children.reduce(
      (str, e) => {
        console.log(str);
        return str + toTextHelper(e);
      }, '');
  }
  return '';
}

function toTextHelper(e: any) {
  if (e.text !== undefined) {
    return e.text;
  }
  if (e.children !== undefined) {
    return e.children.reduce(
      (str: any, e: any) => {
        return str + toTextHelper(e);
      }, '');
  }
  return '';
}

function parse(q: any) {
  console.log(q);
  return build(q);
}

function customizeMCQ(model: MCSchema, text: string) {
  return new Promise((resolve, reject) => {
    OpenAI.prompt("Create a multiple choice question in a JSON format like {question: string, options: [{option: string, isCorrect: boolean}]} from the following text: " + text)
    .then(result => {
      if (result.result === 'success') {
        const customized = parse(result.completion);
        resolve(customized);
      } else {
        reject(result);
      }
    })
  });
}


const chatGPT = (
  editorDesc: EditorDesc,
  resourceContext: ResourceContext,
  onAddItem: AddCallback,
  editorMap: ActivityEditorMap,
  index: number[],
  text: string
) => {
  let model: MCSchema;

  invokeCreationFunc(editorDesc.slug, resourceContext)
    .then((createdModel) => {
      return customizeMCQ(model as MCSchema, text);
    }).then((customizedModel: MCSchema) => {
      model = customizedModel;
      return Persistence.create(resourceContext.projectSlug, editorDesc.slug, model, []);
    })
    .then((result: Persistence.Created) => {
      const resourceContent: ActivityReference = {
        type: 'activity-reference',
        id: guid(),
        activitySlug: result.revisionSlug,
        children: [],
      };

      // For every part that we find in the model, we attach the selected
      // objectives to it
      const objectives = model.authoring.parts
        .map((p: any) => p.id)
        .reduce((p: any, id: string) => {
          p[id] = [];
          return p;
        }, {});

      const editor = editorMap[editorDesc.slug];

      onAddItem(resourceContent, index, {
        authoringElement: editor.authoringElement as string,
        description: editor.description,
        friendlyName: editor.friendlyName,
        activitySlug: result.revisionSlug,
        typeSlug: editorDesc.slug,
        activityId: result.resourceId,
        title: editor.friendlyName,
        model,
        objectives,
        tags: [],
      });
    })
    .catch((err) => {
      // tslint:disable-next-line
      console.error(err);
    });
};


const addActivity = (
  editorDesc: EditorDesc,
  resourceContext: ResourceContext,
  onAddItem: AddCallback,
  editorMap: ActivityEditorMap,
  index: number[],
) => {
  let model: ActivityModelSchema;

  invokeCreationFunc(editorDesc.slug, resourceContext)
    .then((createdModel) => {
      model = createdModel;

      return Persistence.create(resourceContext.projectSlug, editorDesc.slug, model, []);
    })
    .then((result: Persistence.Created) => {
      const resourceContent: ActivityReference = {
        type: 'activity-reference',
        id: guid(),
        activitySlug: result.revisionSlug,
        children: [],
      };

      // For every part that we find in the model, we attach the selected
      // objectives to it
      const objectives = model.authoring.parts
        .map((p: any) => p.id)
        .reduce((p: any, id: string) => {
          p[id] = [];
          return p;
        }, {});

      const editor = editorMap[editorDesc.slug];

      onAddItem(resourceContent, index, {
        authoringElement: editor.authoringElement as string,
        description: editor.description,
        friendlyName: editor.friendlyName,
        activitySlug: result.revisionSlug,
        typeSlug: editorDesc.slug,
        activityId: result.resourceId,
        title: editor.friendlyName,
        model,
        objectives,
        tags: [],
      });
    })
    .catch((err) => {
      // tslint:disable-next-line
      console.error(err);
    });
};
