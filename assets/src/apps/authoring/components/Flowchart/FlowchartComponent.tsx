import React, { useCallback } from 'react';
import ReactFlow, { Controls, Background, MarkerType } from 'reactflow';
// import 'reactflow/dist/style.css';
import './chart-components/flowchart.css';
import { layoutFlowchart } from './flowchart-layout';

import { addPlaceholders, FlowchartEdge, FlowchartNode } from './flowchart-utils';
import { ScreenNode } from './chart-components/ScreenNode';
import { FloatingEdge } from './chart-components/FloatingEdge';
import FloatingConnectionLine from './chart-components/FloatingConnectionLine';
import { PlaceholderNode } from './chart-components/PlaceholderNode';
import { PlaceholderEdge } from './chart-components/PlaceholderEdge';

interface FlowchartComponentProps {
  nodes: FlowchartNode[];
  edges: FlowchartEdge[];
}

const NodeTypes = {
  screen: ScreenNode,
  placeholder: PlaceholderNode,
};

const EdgeTypes = {
  floating: FloatingEdge,
  placeholder: PlaceholderEdge,
};

export const FlowchartComponent: React.FC<FlowchartComponentProps> = (props) => {
  const [nodes, edges] = addPlaceholders(props.nodes, props.edges);

  const layout = layoutFlowchart(nodes, edges);
  // TODO - we're currently ignoring the dagre edges from layout. I think we could avoid some overlaps by using them.

  return (
    <ReactFlow
      nodeTypes={NodeTypes}
      edgeTypes={EdgeTypes}
      nodes={layout.nodes}
      edges={edges}
      connectionLineComponent={FloatingConnectionLine}
      proOptions={{ hideAttribution: true }}
    >
      {/* <MiniMap /> */}
      <Controls />
      <Background />
    </ReactFlow>
  );
};
