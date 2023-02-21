import React from 'react';
import ReactFlow, { Controls, Background } from 'reactflow';
import 'reactflow/dist/style.css';

import { FlowchartEdge, FlowchartNode } from './flowchart-utils';
import { ScreenNode } from './ScreenNode';

interface FlowchartComponentProps {
  nodes: FlowchartNode[];
  edges: FlowchartEdge[];
}

const NodeTypes = {
  screen: ScreenNode,
};

export const FlowchartComponent: React.FC<FlowchartComponentProps> = ({ edges, nodes }) => {
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
