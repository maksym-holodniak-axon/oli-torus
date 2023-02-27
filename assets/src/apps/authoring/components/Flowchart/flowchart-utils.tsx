import { MarkerType } from 'reactflow';
import { IActivity } from '../../../delivery/store/features/activities/slice';
import { IActivityReference } from '../../../delivery/store/features/groups/slice';
import { buildEdgesForActivity } from './flowchart-path-utils';

// TODO - this is not great to be defined here since the data comes from far higher up in the stack
export interface FlowchartScreenNodeData {
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

export interface FlowchartPlaceholderNodeData {
  fromScreenId: number;
}

export interface FlowchartScreenNode {
  id: string;
  resourceId: number;
  position: { x: number; y: number };
  data: FlowchartScreenNodeData;
  type: 'screen';
}

export interface FlowchartPlaceholderNode {
  id: string;
  position: { x: number; y: number };
  data: FlowchartPlaceholderNodeData;
  type: 'placeholder';
}

export type FlowchartNode = FlowchartScreenNode | FlowchartPlaceholderNode;

export interface Point {
  x: number;
  y: number;
}

export interface FlowchartEdge {
  id: string;
  source: string;
  target: string;
  //rule: string;
  type?: string;
  markerEnd?: {
    color?: string;
    type: MarkerType;
  };
  data?: {
    points?: Point[];
  };
}

const onlyActivityReferences = (item: any) => item.type === 'activity-reference';

export const sequenceToNodes = (children: any[]): FlowchartNode[] =>
  children.filter(onlyActivityReferences).map((item, index) => ({
    id: String(item.resourceId),
    resourceId: item.resourceId,
    type: 'screen',
    position: { x: index * 200 + 50, y: 50 },
    data: {
      ...item,
      label: 'TEST ITEM',
    },
  }));

export const buildEdges = (activities: IActivity[]): FlowchartEdge[] => {
  return activities.map(buildEdgesForActivity).flat();
};

export const addPlaceholders = (
  nodes: FlowchartNode[],
  edges: FlowchartEdge[],
): [FlowchartNode[], FlowchartEdge[]] => {
  if (nodes.length === 0) {
    return [
      [
        {
          id: 'start-placeholder',
          position: { x: 0, y: 0 },
          data: { fromScreenId: -1 },
          type: 'placeholder',
        },
      ],
      [],
    ];
  }

  const nodesWithPlaceholder: FlowchartNode[] = [
    ...nodes,
    {
      id: 'end-placeholder',
      position: { x: 0, y: 0 },
      data: { fromScreenId: (nodes[nodes.length - 1] as FlowchartScreenNode).resourceId },
      type: 'placeholder',
    },
  ];

  const edgesWithPlaceholder: FlowchartEdge[] = [
    ...edges,
    {
      id: 'placeholder-edge',
      source: nodes[nodes.length - 1].id,
      target: 'end-placeholder',
      type: 'placeholder',
      markerEnd: {
        type: MarkerType.Arrow,
        color: '#b3b4b7',
      },
    },
  ];

  return [nodesWithPlaceholder, edgesWithPlaceholder];
};
