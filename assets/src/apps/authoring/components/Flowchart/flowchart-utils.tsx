import { MarkerType } from 'reactflow';

// TODO - this is not great to be defined here since the data comes from far higher up in the stack
export interface FlowchartNodeData {
  activitySlug: string;
  custom: {
    isBank: boolean;
    isLayer: boolean;
    sequenceId: string;
    sequenceName: string;
  };
  type: string;
  resourceId: number;
}
export interface FlowchartNode {
  id: string;
  position: { x: number; y: number };
  data: any;
  type: string;
}

export interface FlowchartEdge {
  id: string;
  source: string;
  target: string;
  rule: string;
  type?: string;
  markerEnd?: {
    type: MarkerType;
  };
}

const onlyActivityReferences = (item: any) => item.type === 'activity-reference';

export const sequenceToNodes = (children: any[]): FlowchartNode[] =>
  children.filter(onlyActivityReferences).map((item, index) => ({
    id: String(item.resourceId),
    type: 'screen',
    position: { x: index * 200 + 50, y: 50 },
    data: {
      ...item,
      label: 'TEST ITEM',
    },
  }));

export const debugSequenceToEdges = (children: any[]): FlowchartEdge[] => {
  return [
    {
      id: '1',
      source: '3245',
      target: '2742',
      type: 'step',
      rule: 'this is a fake rule.',
      markerEnd: {
        type: MarkerType.Arrow,
      },
    },
    {
      id: '2',
      source: '2742',
      target: '2741',
      type: 'step',
      rule: 'this is a fake rule.',
      markerEnd: {
        type: MarkerType.Arrow,
      },
    },
    {
      id: '3',
      source: '2742',
      target: '2559',
      type: 'step',
      rule: 'this is a fake rule.',
      markerEnd: {
        type: MarkerType.Arrow,
      },
    },
    {
      id: '4',
      source: '2559',
      target: '2784',
      type: 'step',
      rule: 'this is a fake rule.',
      markerEnd: {
        type: MarkerType.Arrow,
      },
    },
    {
      id: '5',
      source: '2741',
      target: '2784',
      type: 'step',
      rule: 'this is a fake rule.',
      markerEnd: {
        type: MarkerType.Arrow,
      },
    },
  ];
};

export const sequenceToEdges = (children: any[]): FlowchartEdge[] => {
  const activities = children.filter(onlyActivityReferences);
  return activities.reduce((acc, curr, index) => {
    if (index === activities.length - 1) return acc;
    return [
      ...acc,
      {
        id: `${curr.resourceId}-${index}`,
        source: String(curr.resourceId),
        target: String(activities[index + 1].resourceId),
        type: 'step',
      },
    ];
  }, []);
};

// {
//   "activitySlug": "screen_1",
//   "custom": {
//     "isBank": false,
//     "isLayer": false,
//     "sequenceId": "adaptive_activity_cbf19_4056730374",
//     "sequenceName": "Screen 1"
//   },
//   "type": "activity-reference",
//   "resourceId": 3245
// }

export const layoutNodes = (nodes: FlowchartNode[], edges: FlowchartEdge[]) => {
  if (nodes.length === 0) return [];
  if (edges.length === 0) return [];
  const nodeMap: Record<string, FlowchartNode> = nodes.reduce(
    (acc, curr) => ({ ...acc, [curr.id]: curr }),
    {},
  );

  const layout = (nodeId: string, x: number, y: number, visited: string[] = []) => {
    const node = nodeMap[nodeId];
    if (!node) return;
    node.position = { x, y };
    const connected = edges.filter((e) => e.source === node.id);
    connected
      .filter((e) => -1 === visited.indexOf(e.target))
      .forEach((edge, index) => {
        if (!edge) return;
        layout(edge.target, x + 200, y + index * 150, [...visited, nodeId]);
      });
  };

  layout(nodes[0].id, 50, 50);
  return nodes;
};
