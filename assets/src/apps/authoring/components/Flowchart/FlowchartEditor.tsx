import React from 'react';
import { useSelector } from 'react-redux';
import { selectSequence } from '../../../delivery/store/features/groups/selectors/deck';

export const FlowchartEditor = () => {
  const sequence = useSelector(selectSequence);
  return (
    <div>
      Flowchart Editor
      <pre>{JSON.stringify(sequence, null, 2)}</pre>
    </div>
  );
};
