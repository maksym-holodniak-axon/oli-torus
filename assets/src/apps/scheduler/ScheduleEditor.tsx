import { useCallbackRef, useResizeObserver } from '@restart/hooks';
import { DateWithoutTime } from 'epoq';
import React, { useEffect, useMemo } from 'react';
import { useDispatch, useSelector } from 'react-redux';

import { generateDayGeometry } from './date-utils';
import { getTopLevelSchedule } from './schedule-selectors';
import { ScheduleHeaderRow } from './ScheduleHeader';
import { ScheduleLine } from './ScheduleLine';
import { HierarchyItemSrc, initSchedule, resetSchedule } from './scheduler-slice';

export interface SchedulerProps {
  title: string;
  hierarchy: HierarchyItemSrc;
  start_date: string;
  end_date: string;
}

export const ScheduleEditor: React.FC<SchedulerProps> = ({
  title,
  hierarchy,
  start_date,
  end_date,
}) => {
  const [barContainer, attachBarContainer] = useCallbackRef<HTMLElement>();
  const rect = useResizeObserver(barContainer || null);
  const dispatch = useDispatch();
  const schedule = useSelector(getTopLevelSchedule);

  const dayGeometry = useMemo(
    () =>
      generateDayGeometry(
        new DateWithoutTime(start_date),
        new DateWithoutTime(end_date),
        rect?.width || 0,
      ),
    [rect?.width, start_date, end_date],
  );

  const onReset = () => {
    dispatch(resetSchedule());
  };

  useEffect(() => {
    dispatch(initSchedule({ hierarchy, start_date, end_date }));
  }, [dispatch, end_date, hierarchy, start_date]);

  return (
    <div>
      <button className="float-right" onClick={onReset}>
        Reset Schedule
      </button>

      <h1>{title}</h1>
      <table className="select-none">
        <thead>
          <ScheduleHeaderRow
            labels={true}
            attachBarContainer={attachBarContainer}
            dayGeometry={dayGeometry}
          />
        </thead>
        <tbody>
          {schedule
            .filter((item) => item.type !== 'page')
            .map((item) => (
              <ScheduleLine key={item.id} indent={0} item={item} dayGeometry={dayGeometry} />
            ))}
        </tbody>
      </table>
    </div>
  );
};
