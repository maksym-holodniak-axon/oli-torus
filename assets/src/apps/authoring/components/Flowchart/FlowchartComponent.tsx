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
  onCreateNode?: (fromId: string, toId?: string) => void;
}

const NodeTypes = {
  screen: ScreenNode,
  placeholder: PlaceholderNode,
};

const EdgeTypes = {
  floating: FloatingEdge,
  placeholder: PlaceholderEdge,
};

export const FlowchartComponent: React.FC<FlowchartComponentProps> = ({
  onCreateNode,
  ...props
}) => {
  const onNodeClick = useCallback(
    (event: React.MouseEvent, node: FlowchartNode) => {
      // When you click on a placeholder node, we'll signal up to the parent to create a new node at that location
      node.type === 'placeholder' && onCreateNode && onCreateNode(node.data.fromScreenId);
    },
    [onCreateNode],
  );

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
      onNodeClick={onNodeClick}
      proOptions={{ hideAttribution: true }}
    >
      {/* <MiniMap /> */}
      <Controls />
      <Background />
    </ReactFlow>
  );
};
