import React from 'react';
import ReactFlow, { Controls, Background } from 'reactflow';
// import 'reactflow/dist/style.css';
import './chart-components/flowchart.css';
import { layoutFlowchart } from './flowchart-layout';

import { FlowchartEdge, FlowchartNode } from './flowchart-utils';
import { ScreenNode } from './chart-components/ScreenNode';
import FloatingEdge from './chart-components/FloatingEdge';
import FloatingConnectionLine from './chart-components/FloatingConnectionLine';

interface FlowchartComponentProps {
  nodes: FlowchartNode[];
  edges: FlowchartEdge[];
}

const NodeTypes = {
  screen: ScreenNode,
};

const EdgeTypes = {
  floating: FloatingEdge,
};

export const FlowchartComponent: React.FC<FlowchartComponentProps> = ({ edges, nodes }) => {
  const layout = layoutFlowchart(nodes, edges);
  console.info('Edge layout', layout.edges);
  return (
    <ReactFlow
      nodeTypes={NodeTypes}
      edgeTypes={EdgeTypes}
      nodes={layout.nodes}
      edges={edges}
      connectionLineComponent={FloatingConnectionLine}

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
