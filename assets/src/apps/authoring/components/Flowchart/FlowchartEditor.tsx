import React, { useCallback, useMemo } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { selectAllActivities } from '../../../delivery/store/features/activities/slice';

import { selectSequence } from '../../../delivery/store/features/groups/selectors/deck';

import { debugAppMode } from '../../store/app/slice';
import { addFlowchartScreen, deleteFlowchartScreen } from './flowchart-actions';
import { buildEdges, sequenceToNodes } from './flowchart-utils';

import { FlowchartComponent } from './FlowchartComponent';
import {
  FlowchartAddScreenParams,
  FlowchartEventContext,
  FlowchartEventContextProps,
} from './FlowchartEventContext';
import { FlowchartSidebar } from './FlowchartSidebar';
import { FlowchartTopToolbar } from './FlowchartTopToolbar';

/*
  Flowchart editor deals with translating data to/from the format that the FlowchartComponent requires.
  ex: Converting sequences, activities and rules into nodes and edges and back again.
  The FlowchartComponent deals in flowchart related data.
*/

export const FlowchartEditor = () => {
  const dispatch = useDispatch();
  const sequence = useSelector(selectSequence);
  const activities = useSelector(selectAllActivities);
  const edges = buildEdges(activities);
  const nodes = sequenceToNodes(sequence);

  const onAddScreen = useCallback(
    (params: FlowchartAddScreenParams) => {
      const { prevNodeId, nextNodeId } = params;
      dispatch(addFlowchartScreen({ fromScreenId: prevNodeId, toScreenId: nextNodeId }));
    },
    [dispatch],
  );

  const onDeleteScreen = useCallback(
    (screenResourceId: number) => {
      dispatch(deleteFlowchartScreen({ screenId: screenResourceId }));
    },
    [dispatch],
  );

  const onAdvanced = () => {
    dispatch(debugAppMode({ mode: 'expert' }));
  };

  const events: FlowchartEventContextProps = useMemo(
    () => ({
      onAddScreen,
      onDeleteScreen,
    }),
    [onAddScreen, onDeleteScreen],
  );

  return (
    <FlowchartEventContext.Provider value={events}>
      <div className="fixed bottom-0 right-0 top-[66px] left-[66px] z-[1] bg-delivery-body flex flex-row">
        <FlowchartSidebar />
        <div className="flex flex-col w-full h-full">
          <FlowchartTopToolbar onSwitchToAdvancedMode={onAdvanced} />
          <FlowchartComponent nodes={nodes} edges={edges} />
        </div>
      </div>
    </FlowchartEventContext.Provider>
  );
};
