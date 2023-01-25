import { useCallbackRef, useResizeObserver } from '@restart/hooks';
import { DateWithoutTime, Week } from 'epoq';
import React from 'react';
import { useSelector } from 'react-redux';
import { getScheduleBounds } from './schedule-selectors';
import { HierarchyItem } from './scheduler-slice';

interface ScheduleHeaderRowProps {
  labels: boolean;
}

const headerGeometry = (
  startDate: DateWithoutTime | null,
  endDate: DateWithoutTime | null,
  availableWidth: number,
) => {
  if (!startDate || !endDate) {
    return { count: 1, width: 1 };
  }
  const startWeek = new Week(startDate.utcMidnightDateObj);
  const endWeek = new Week(endDate.utcMidnightDateObj);
  return {
    count: endWeek.weekSinceEpoch - startWeek.weekSinceEpoch + 1,
    width: availableWidth / (endWeek.weekSinceEpoch - startWeek.weekSinceEpoch + 1),
  };
};

export const ScheduleHeaderRow: React.FC<ScheduleHeaderRowProps> = ({ labels = false }) => {
  const [barContainer, attachBarContainer] = useCallbackRef<HTMLElement>();
  const rect = useResizeObserver(barContainer || null); // TODO - it'd be nice to move this up a level and only have a single one for all rows.

  return (
    <tr className="h-8">
      <th className="w-1 border-r-0"></th>
      <th className="w-48"></th>
      <th className="p-0 relative" ref={attachBarContainer}>
        <ScheduleHeader labels={labels} availableWidth={rect?.width} />
      </th>
    </tr>
  );
};

interface ScheduleHeaderProps {
  labels: boolean;
  availableWidth?: number;
}

export const ScheduleHeader: React.FC<ScheduleHeaderProps> = ({ labels, availableWidth }) => {
  const { startDate, endDate } = useSelector(getScheduleBounds);
  const { count, width } = React.useMemo(
    () => headerGeometry(startDate, endDate, availableWidth || 0),
    [endDate, startDate, availableWidth],
  );
  const arr = Array.from(new Array(count), () => 0);
  const barStyles = {
    width: width,
  };

  return (
    <div className="absolute top-0 left-0 right-0 h-full">
      {arr.map((_, i) => (
        <div key={i} className="p-1 inline-block border-l  h-full" style={barStyles}>
          {labels && `Wk ${i + 1}`}
        </div>
      ))}
    </div>
  );
};
