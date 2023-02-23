import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { selectAllActivities } from '../../../delivery/store/features/activities/slice';

import { selectSequence } from '../../../delivery/store/features/groups/selectors/deck';
import { addFlowchartScreen } from './flowchart-actions';
import { buildEdges, sequenceToNodes } from './flowchart-utils';

import { FlowchartComponent } from './FlowchartComponent';

/*
  Flowchart editor deals with translating data to/from the format that the FlowchartComponent requires.
  ex: Converting sequences, activities and rules into nodes and edges and back again.
  The FlowchartComponent deals in flowchart related data.
*/

export const FlowchartEditor = () => {
  const dispatch = useDispatch();
  const sequence = useSelector(selectSequence);
  const activities = useSelector(selectAllActivities);
  const edges = buildEdges(sequence, activities);
  const nodes = sequenceToNodes(sequence);

  const onCreateNode = (fromId: string, toId?: string) => {
    console.log('onCreateNode', fromId, toId);
    dispatch(addFlowchartScreen({ fromScreenId: fromId, toScreenId: toId }));
  };

  return (
    <div className="fixed bottom-0 right-0 top-[66px] left-[66px]  z-[1] bg-delivery-body ">
      <FlowchartComponent nodes={nodes} edges={edges} onCreateNode={onCreateNode} />
    </div>
  );
};
