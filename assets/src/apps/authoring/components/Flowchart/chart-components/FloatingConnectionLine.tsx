import React from 'react';
import { ConnectionLineComponent, getBezierPath, Position } from 'reactflow';

import { getEdgeParams } from './utils';

// connectionLineStyle?: CSSProperties;
//     connectionLineType: ConnectionLineType;
//     fromNode?: Node;
//     fromHandle?: HandleElement;
//     fromX: number;
//     fromY: number;
//     toX: number;
//     toY: number;
//     fromPosition: Position;
//     toPosition: Position;
//     connectionStatus: ConnectionStatus | null;
const FloatingConnectionLine: ConnectionLineComponent = ({
  fromNode,
  toX,
  toY,
  fromPosition,
  toPosition,
}) => {
  if (!fromNode) {
    return null;
  }

  const targetNode = {
    id: 'connection-target',
    width: 1,
    height: 1,
    position: { x: toX, y: toY },
  };

  const { sx, sy } = getEdgeParams(fromNode, targetNode);
  const [edgePath] = getBezierPath({
    sourceX: sx,
    sourceY: sy,
    sourcePosition: fromPosition,
    targetPosition: toPosition,
    targetX: toX,
    targetY: toY,
  });

  return (
    <g>
      <path fill="none" stroke="#22f" strokeWidth={3} className="animated" d={edgePath} />
      <circle cx={toX} cy={toY} fill="#fff" r={3} stroke="#222" strokeWidth={1.5} />
    </g>
  );
};

export default FloatingConnectionLine;
