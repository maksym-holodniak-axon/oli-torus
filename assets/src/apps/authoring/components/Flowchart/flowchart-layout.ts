import { FlowchartEdge, FlowchartNode } from './flowchart-utils';
import dagre from 'dagre';

export const BOX_WIDTH = 128;
export const BOX_HEIGHT = 112;

export const layoutFlowchart = (nodes: FlowchartNode[], edges: FlowchartEdge[]) => {
  const g = new dagre.graphlib.Graph<FlowchartNode>();

  // Set an object for the graph label
  g.setGraph({ rankdir: 'LR', marginx: 50, marginy: 50 });

  // Default to assigning a new object as a label for each new edge.
  g.setDefaultEdgeLabel(function () {
    return {};
  });

  // Add nodes to the graph. The first argument is the node id. The second is
  // metadata about the node. In this case we're going to add labels to each of
  // our nodes.
  nodes.forEach((node) => {
    g.setNode(node.id, {
      ...node,
      width: BOX_WIDTH,
      height: BOX_HEIGHT,
    });
  });

  edges.forEach((edge) => {
    g.setEdge(edge.source, edge.target);
  });

  dagre.layout(g);

  return {
    nodes: g.nodes().map((id) => {
      const node = g.node(id);
      return {
        id: node.id,
        position: { x: node.x, y: node.y * 3 },
        data: node.data,
        type: node.type,
      };
    }),

    edges: g.edges().map((edge) => g.edge(edge)),
  };
};
