import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Item } from '../../components/activities/image_coding/sections/Feedback';
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
  const dispatch = useDispatch();
  const schedule = useSelector(getTopLevelSchedule);

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
          <ScheduleHeaderRow labels={true} />
        </thead>
        <tbody>
          {schedule
            .filter((item) => item.type !== 'page')
            .map((item) => (
              <ScheduleLine key={item.id} indent={0} item={item} />
            ))}
        </tbody>
      </table>
    </div>
  );
};
