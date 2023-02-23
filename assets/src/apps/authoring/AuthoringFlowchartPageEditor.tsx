import React from 'react';
import { BottomPanel } from './BottomPanel';
import { AdaptivityEditor } from './components/AdaptivityEditor/AdaptivityEditor';
import { InitStateEditor } from './components/AdaptivityEditor/InitStateEditor';
import EditingCanvas from './components/EditingCanvas/EditingCanvas';
import HeaderNav from './components/HeaderNav';
import LeftMenu from './components/LeftMenu/LeftMenu';
import RightMenu from './components/RightMenu/RightMenu';
import { SimplifiedRightMenu } from './components/RightMenu/SimplifiedRightMenu';
import SequenceEditor from './components/SequenceEditor/SequenceEditor';
import { SidePanel } from './components/SidePanel';

interface PanelState {
  left: boolean;
  right: boolean;
  top: boolean;
  bottom: boolean;
}

interface AuthoringPageEditorProps {
  panelState: PanelState;
  handlePanelStateChange: (p: Partial<PanelState>) => void;
}

export const AuthoringFlowchartPageEditor: React.FC<AuthoringPageEditorProps> = ({
  panelState,
  handlePanelStateChange,
}) => (
  <div id="advanced-authoring" className={`advanced-authoring d-none`}>
    <HeaderNav panelState={panelState} isVisible={panelState.top} />
    <SidePanel
      position="left"
      panelState={panelState}
      onToggle={() => handlePanelStateChange({ left: !panelState.left })}
    >
      <SequenceEditor />
    </SidePanel>
    <EditingCanvas />

    <SidePanel
      position="right"
      panelState={panelState}
      onToggle={() => handlePanelStateChange({ right: !panelState.right })}
    >
      <SimplifiedRightMenu />
    </SidePanel>
  </div>
);
