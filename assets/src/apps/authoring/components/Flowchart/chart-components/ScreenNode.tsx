import React from 'react';
import { Handle, Position } from 'reactflow';
import { FlowchartScreenNodeData } from '../flowchart-utils';

interface NodeProps {
  data: FlowchartScreenNodeData;
}

// Note: use className="nodrag" on interactive pieces here.
export const ScreenNode: React.FC<NodeProps> = ({ data }) => {
  return (
    <>
      <Handle type="target" position={Position.Left} style={{ display: 'none' }} />
      <ScreenNodeBody data={data} />
      <Handle type="source" position={Position.Right} id="a" style={{ display: 'none' }} />
    </>
  );
};

// Just the interior of the node, useful to have separate for storybook
export const ScreenNodeBody: React.FC<NodeProps> = ({ data }) => (
  <div className="p-4 text-center border-2 w-32 h-28 bg-white text-delivery-body-dark">
    {data.custom.sequenceName}
    <br />
    {data.resourceId}
  </div>
);
