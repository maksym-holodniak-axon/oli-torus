import { FlowchartEdge, FlowchartNode } from './flowchart-utils';
import dagre from 'dagre';

export const BOX_WIDTH = 128;
export const BOX_HEIGHT = 112;

// export const layoutFlowchart = (nodes: FlowchartNode[], edges: FlowchartEdge[]) => {
//   for (const node of nodes) {
//   }

//   return {
//     nodes,
//     edges,
//   };
// };

const dagreEdgeToFlowchartEdge = (edge: FlowchartEdge & dagre.GraphEdge): FlowchartEdge => {
  const { points, ...rest } = edge;
  return {
    ...rest,
    data: {
      points,
    },
  };
};

// type WeightedEdge = FlowchartEdge & { weight: number; width: number; height: number };

// const weightCycles = (edges: FlowchartEdge[], visitedNodes: string[] = []): WeightedEdge[] => {
//   if (edges.length === 0) {
//     return [];
//   }
//   return edges.map((e) => ({
//     ...e,
//     weight: e.source === '16806' && e.target === '2742' ? 1 : 500,
//     width: 0,
//     height: 0,
//   }));

//   const [edge, ...rest] = edges;
//   const targetNodeId = edge.target;
//   const targetNodeExits = edges.filter(
//     (e) => e.source === targetNodeId && !visitedNodes.includes(e.target),
//   );
//   const validEdges = [edge, ...targetNodeExits];

//   console.info('removeCycles', edges, validEdges, visitedNodes);

//   return [
//     ...validEdges,
//     ...weightCycles(rest, [...visitedNodes, ...validEdges.map((e) => e.target)]),
//   ];
// };

export const layoutFlowchart = (nodes: FlowchartNode[], edges: FlowchartEdge[]) => {
  const g = new dagre.graphlib.Graph<FlowchartNode>();

  // const nonCycleEdges = weightCycles(edges);

  // Set an object for the graph label
  g.setGraph({
    rankdir: 'LR',
    // align: 'UL',
    marginx: 50,
    marginy: 50,
    ranker: 'tight-tree',
    nodesep: BOX_HEIGHT,
    // acyclicer: 'greedy',
    ranksep: BOX_HEIGHT,
  });

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
      label: node.data.label,
      width: BOX_WIDTH,
      height: BOX_HEIGHT,
    });
  });

  edges.forEach((edge) => {
    g.setEdge(edge.source, edge.target, edge);
  });

  dagre.layout(g);

  return {
    nodes: g.nodes().map((id) => {
      const node = g.node(id);
      return {
        id: node.id,
        position: { x: node.x, y: node.y },
        data: node.data,
        type: node.type,
      };
    }),

    edges: g
      .edges()
      .map((edge) => g.edge(edge))
      .map(dagreEdgeToFlowchartEdge),
  };
};
