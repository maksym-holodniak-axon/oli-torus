import React from 'react';
import { useSelector } from 'react-redux';
import { selectAllActivities } from '../../../delivery/store/features/activities/slice';

import { selectSequence } from '../../../delivery/store/features/groups/selectors/deck';
import { buildEdges, debugSequenceToEdges, layoutNodes, sequenceToNodes } from './flowchart-utils';

import { FlowchartComponent } from './FlowchartComponent';

/*
  Flowchart editor deals with translating data to/from the format that the FlowchartComponent requires.
  ex: Converting sequences, activities and rules into nodes and edges and back again.
  The FlowchartComponent deals in flowchart related data.
*/

export const FlowchartEditor = () => {
  const sequence = useSelector(selectSequence);
  const activities = useSelector(selectAllActivities);
  const edges = buildEdges(sequence, activities);
  const nodes = layoutNodes(sequenceToNodes(sequence), edges);

  if (edges.length > 0) {
    console.info(edges);
    debugger;
  }

  return (
    <div className="fixed bottom-0 right-0 top-[66px] left-[66px]  z-[1] bg-delivery-body ">
      <FlowchartComponent nodes={nodes} edges={edges} />
    </div>
  );
};
