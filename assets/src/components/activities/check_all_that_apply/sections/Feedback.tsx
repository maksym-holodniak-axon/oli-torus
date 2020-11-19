import React from 'react';
import { Heading } from 'components/misc/Heading';
import { RichTextEditor } from 'components/content/RichTextEditor';
import { ModelEditorProps } from '../schema';
import { RichText } from '../../types';
import { Description } from 'components/misc/Description';
import { IconCorrect, IconIncorrect } from 'components/misc/Icons';
import { ProjectSlug } from 'data/types';
import { classNames } from 'utils/classNames';

interface FeedbackProps extends ModelEditorProps {
  onEditCorrectFeedback: (content: RichText) => void;
  onEditIncorrectFeedback: (content: RichText) => void;
  projectSlug: ProjectSlug;
}
export const Feedback = (props: FeedbackProps) => {
  const { onEditCorrectFeedback, onEditIncorrectFeedback, model, editMode, projectSlug } = props;
  const { authoring: { parts } } = model;

  const correctResponse = parts[0].responses.find(r => r.score === 1);
  if (!correctResponse) {
    throw new Error('Correct response could not be found:' + JSON.stringify(parts));
  }
  const firstIncorrectResponse = parts[0].responses
    .filter(r => r.id !== correctResponse.id)[0];

  return (
    <div className={'my-5 ' + classNames(['feedback'])}>
      <Heading title="Answer Choice Feedback" subtitle="Providing feedback when a student answers a
        question is one of the best ways to reinforce their understanding." id="feedback" />
      <div className="mb-3" key={'correct feedback'}>
        <Description>
          <IconCorrect /> Feedback for Correct Answer
        </Description>
        <RichTextEditor projectSlug={projectSlug}
          editMode={editMode} text={correctResponse.feedback.content}
          onEdit={content => onEditCorrectFeedback(content)}
        />
      </div>
      <div className="mb-3" key={'incorrect feedback'}></div>
        <Description>
          <IconIncorrect /> Feedback for Incorrect Answer
        </Description>
        <RichTextEditor projectSlug={projectSlug}
          editMode={editMode} text={firstIncorrectResponse.feedback.content}
          onEdit={content => onEditIncorrectFeedback(content)}
        />
      </div>
  );
};
