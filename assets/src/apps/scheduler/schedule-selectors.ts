import { SchedulerAppState } from './scheduler-reducer';

export const getTopLevelSchedule = (state: SchedulerAppState) =>
  state.scheduler.schedule?.children ?? [];

export const getScheduleBounds = (state: SchedulerAppState) => {
  return {
    startDate: state.scheduler.start_date,
    endDate: state.scheduler.end_date,
  };
};

export const getSelectedId = (state: SchedulerAppState) => state.scheduler.selectedId;
