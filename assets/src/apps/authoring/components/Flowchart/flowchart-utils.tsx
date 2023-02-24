import { MarkerType } from 'reactflow';
import {
  IAction,
  IActivity,
  IEvent,
  IRule,
} from '../../../delivery/store/features/activities/slice';
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
  fromScreenId: string;
}

const markerEnd = {
  color: '#2563eb',
  type: MarkerType.Arrow,
};
export interface FlowchartScreenNode {
  id: string;
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
    type: 'screen',
    position: { x: index * 200 + 50, y: 50 },
    data: {
      ...item,
      label: 'TEST ITEM',
    },
  }));

// const isNavigationRule = (rule: IRule): boolean => isNavigationEvent(rule.event);
// const isNavigationEvent = (event: IEvent): boolean =>
//   !!event.params.actions.find((action: IAction) => action.type === 'navigation');

const sequenceIdToResourceId = (sequenceId: string, activities: IActivityReference[]) => {
  const act = activities.find((activity) => activity.custom.sequenceId === sequenceId)?.resourceId;
  return act ? String(act) : '';
};

// Introduced a new "paths" authorind data structure instead of reading rules directly
// const generateEdgesFromRules = (
//   rules: IRule[],
//   source: string,
//   activityRefs: IActivityReference[],
// ): FlowchartEdge[] => {
//   const edges: FlowchartEdge[] = [];
//   rules.filter(isNavigationRule).forEach((rule: IRule) => {
//     rule.event.params.actions.forEach((action: IAction) => {
//       const targetSequenceId = action.params.target;
//       const target = sequenceIdToResourceId(targetSequenceId, activityRefs);
//       if (source && target) {
//         edges.push({
//           id: rule.id,
//           source: String(source),
//           target,
//           type: 'floating',
//           markerEnd,
//         });
//       }
//     });
//   });
//   return edges;
// };

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
          data: { fromScreenId: '' },
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
      data: { fromScreenId: nodes[nodes.length - 1].id },
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
