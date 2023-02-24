import React from 'react';
import { Button } from '../../../../components/misc/Button';

interface FlowchartTopToolbarProps {
  onSwitchToAdvancedMode: () => void;
}
export const FlowchartTopToolbar: React.FC<FlowchartTopToolbarProps> = ({
  onSwitchToAdvancedMode,
}) => {
  return (
    <div className="flex flex-row justify-between items-center bg-delivery-body p-2 h-40 border-b-2 dark:text-black">
      Toolbar Content Goes here.
      <Button variant="primary" onClick={onSwitchToAdvancedMode}>
        Debug Advanced mode
      </Button>
    </div>
  );
};
