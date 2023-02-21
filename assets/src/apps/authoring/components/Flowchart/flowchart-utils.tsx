import { MarkerType } from 'reactflow';
import {
  IAction,
  IActivity,
  IEvent,
  IRule,
} from '../../../delivery/store/features/activities/slice';
import { IActivityReference } from '../../../delivery/store/features/groups/slice';

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

const markerEnd = {
  color: '#2563eb',
  type: MarkerType.Arrow,
};
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
  //rule: string;
  type?: string;
  markerEnd?: {
    color?: string;
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

const isNavigationRule = (rule: IRule): boolean => isNavigationEvent(rule.event);
const isNavigationEvent = (event: IEvent): boolean =>
  !!event.params.actions.find((action: IAction) => action.type === 'navigation');

const sequenceIdToResourceId = (sequenceId: string, activities: IActivityReference[]) => {
  const act = activities.find((activity) => activity.custom.sequenceId === sequenceId)?.resourceId;
  return act ? String(act) : '';
};

const generateEdgesFromRules = (
  rules: IRule[],
  source: string,
  activityRefs: IActivityReference[],
): FlowchartEdge[] => {
  const edges: FlowchartEdge[] = [];
  rules.filter(isNavigationRule).forEach((rule: IRule) => {
    rule.event.params.actions.forEach((action: IAction) => {
      const targetSequenceId = action.params.target;
      const target = sequenceIdToResourceId(targetSequenceId, activityRefs);
      if (source && target) {
        edges.push({
          id: rule.id,
          source: String(source),
          target,
          type: 'floating',
          markerEnd,
        });
      }
    });
  });

  return edges;
};

export const buildEdges = (sequence: any[], activities: IActivity[]): FlowchartEdge[] => {
  const activityRefs = sequence.filter(onlyActivityReferences) as IActivityReference[];
  const edges: FlowchartEdge[] = [];
  activityRefs.forEach((activityRef, index) => {
    const activity = activities.find((act) => act.resourceId === activityRef.resourceId);
    if (!activity) return;
    const source = String(activity.resourceId);
    const definedEdges = generateEdgesFromRules(
      activity.authoring?.rules || [],
      source,
      activityRefs,
    );
    if (definedEdges.length === 0) {
      // When there are now rules, we default to the next activity in the sequence
      const nextActivityRef = activityRefs[index + 1];
      if (!nextActivityRef) return;
      const nextActivityId = sequenceIdToResourceId(
        nextActivityRef.custom.sequenceId,
        activityRefs,
      );
      edges.push({
        id: `${source}-${nextActivityId}-${index}`,
        source: String(source),
        target: nextActivityId,
        type: 'floating',
        markerEnd,
      });
    } else {
      edges.push(...definedEdges);
    }
  });
  return edges;
};

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
