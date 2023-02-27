import React, { useContext } from 'react';
import { Handle, Position } from 'reactflow';
import { FlowchartPlaceholderNodeData } from '../flowchart-utils';
import { FlowchartEventContext } from '../FlowchartEventContext';

/**
 * This is the empty node on the flowchart that allows you to add new screens to the graph.
 * Eventually it'll be drag and drop, for now it's a button.
 *
 */

interface NodeProps {
  data: FlowchartPlaceholderNodeData;
}

// Note: use className="nodrag" on interactive pieces here.
export const PlaceholderNode: React.FC<NodeProps> = ({ data }) => {
  return (
    <>
      <Handle type="target" position={Position.Left} style={{ display: 'none' }} />
      <PlaceholderNodeBody data={data} />
      <Handle type="source" position={Position.Right} id="a" style={{ display: 'none' }} />
    </>
  );
};

// Just the interior of the node, useful to have separate for storybook
export const PlaceholderNodeBody: React.FC<NodeProps> = ({ data }) => {
  const { onAddScreen } = useContext(FlowchartEventContext);
  return (
    <div className="align-middle justify-center flex h-[156px] flex-col">
      <div className="cursor-pointer text-center border-2 border-dashed w-32 h-28 bg-gray-50 text-delivery-body-dark nodrag inline-block">
        <div className="opacity-0 hover:opacity-100 w-full h-full flex justify-center align-middle">
          <button onClick={() => onAddScreen({ prevNodeId: data.fromScreenId })}>Add Screen</button>
        </div>
      </div>
    </div>
  );
};
