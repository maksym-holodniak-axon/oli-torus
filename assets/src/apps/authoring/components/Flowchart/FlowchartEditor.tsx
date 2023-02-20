import React from 'react';
import { useSelector } from 'react-redux';

import { selectSequence } from '../../../delivery/store/features/groups/selectors/deck';

import { FlowchartComponent } from './FlowchartComponent';

export const FlowchartEditor = () => {
  const sequence = useSelector(selectSequence);

  return (
    <div className="fixed bottom-0 right-0 top-[66px] left-[66px]  z-[1] bg-delivery-body ">
      <FlowchartComponent sequence={sequence} />
    </div>
  );
};
