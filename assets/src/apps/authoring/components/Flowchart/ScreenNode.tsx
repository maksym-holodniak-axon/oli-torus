import React from 'react';
import { Handle, Position } from 'reactflow';
import { FlowchartNodeData } from './flowchart-utils';

interface NodeProps {
  data: FlowchartNodeData;
}

// Note: use className="nodrag" on interactive pieces here.
export const ScreenNode: React.FC<NodeProps> = ({ data }) => {
  return (
    <>
      <Handle type="target" position={Position.Left} />
      <ScreenNodeBody data={data} />
      <Handle type="source" position={Position.Right} id="a" />
    </>
  );
};

// Just the interior of the node, useful to have separate for storybook
export const ScreenNodeBody: React.FC<NodeProps> = ({ data }) => (
  <div className="p-4 text-center border w-32 h-28 bg-white text-delivery-body-dark">
    {data.custom.sequenceName}
    <br />
    {data.resourceId}
  </div>
);
