import React, { useContext } from 'react';
import { Handle, Position } from 'reactflow';
import { Icon } from '../../../../../components/misc/Icon';
import { FlowchartScreenNodeData } from '../flowchart-utils';
import { FlowchartEventContext } from '../FlowchartEventContext';
import { ScreenButton } from './ScreenButton';

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

const dontDoNothing = () => {
  console.warn("This don't do nuthin yet");
};
// Just the interior of the node, useful to have separate for storybook
export const ScreenNodeBody: React.FC<NodeProps> = ({ data }) => {
  const { onAddScreen, onDeleteScreen } = useContext(FlowchartEventContext);
  return (
    <div className="flowchart-node">
      <div className="inline text-center">{data.custom.sequenceName}</div>
      <div className="node-box">
        <div className="button-bar">
          <ScreenButton onClick={() => onAddScreen({ prevNodeId: data.resourceId })}>
            <Icon icon="plus" />
          </ScreenButton>
          <ScreenButton onClick={dontDoNothing}>
            <Icon icon="clone" />
          </ScreenButton>
          <ScreenButton onClick={() => onDeleteScreen(data.resourceId)}>
            <Icon icon="trash" />
          </ScreenButton>
        </div>
      </div>
      <small className="text-gray-400">{data.resourceId}</small>
    </div>
  );
};
