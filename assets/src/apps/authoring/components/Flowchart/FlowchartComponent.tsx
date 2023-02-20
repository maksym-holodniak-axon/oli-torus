import React from 'react';
import ReactFlow, { Controls, Background } from 'reactflow';
import 'reactflow/dist/style.css';

import {
  debugSequenceToEdges,
  layoutNodes,
  sequenceToEdges,
  sequenceToNodes,
} from './flowchart-utils';
import { ScreenNode } from './ScreenNode';

interface FlowchartComponentProps {
  sequence: any[];
  edgeDefinition: EdgeDefinition;
}

interface EdgeDefinition {}

const NodeTypes = {
  screen: ScreenNode,
};

export const FlowchartComponent: React.FC<FlowchartComponentProps> = ({
  sequence,
  edgeDefinition,
}) => {
  // const edges = sequenceToEdges(sequence);
  const edges = debugSequenceToEdges(sequence);
  const nodes = layoutNodes(sequenceToNodes(sequence), edges);

  return (
    <ReactFlow
      nodeTypes={NodeTypes}
      nodes={nodes}
      edges={edges}

      // onNodesChange={onNodesChange}
      // onEdgesChange={onEdgesChange}
      // onConnect={onConnect}
    >
      {/* <MiniMap /> */}
      <Controls />
      <Background />
    </ReactFlow>
  );
};
