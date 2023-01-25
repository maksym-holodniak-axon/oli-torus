import { useCallbackRef, useResizeObserver } from '@restart/hooks';
import { DateWithoutTime } from 'epoq';
import React, { useCallback } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useToggle } from '../../components/hooks/useToggle';
import { DragBar } from './DragBar';
import { getScheduleBounds, getSelectedId } from './schedule-selectors';
import { ScheduleHeader } from './ScheduleHeader';
// import { SchedulePlaceholder } from './SchedulePlaceholder';
import { HierarchyItem, moveScheduleItem, selectItem } from './scheduler-slice';

interface ScheduleLineProps {
  item: HierarchyItem;
  indent: number;
}

export const barGeometry = (
  barStartDate: DateWithoutTime | null,
  barEndDate: DateWithoutTime | null,
  startDate: DateWithoutTime | null,
  endDate: DateWithoutTime | null,
  availableWidth: number,
) => {
  if (!barStartDate || !barEndDate || !startDate || !endDate) {
    return { width: 50, left: 1 };
  }
  const totalDays = endDate.getDaysSinceEpoch() - startDate.getDaysSinceEpoch();
  const barDays = barEndDate.getDaysSinceEpoch() - barStartDate.getDaysSinceEpoch() + 1;
  const ratio = barDays / totalDays;
  const barStartDay = barStartDate.getDaysSinceEpoch();
  const startDay = startDate.getDaysSinceEpoch();
  const left = ((barStartDay - startDay) / Math.max(1, totalDays)) * availableWidth;
  const width = Math.round(availableWidth * ratio);

  return {
    width,
    left,
  };
};

// Turn a left offset of one of the bars to a date that corresponds.
const leftToDate = (
  left: number,
  startDate: DateWithoutTime | null,
  endDate: DateWithoutTime | null,
  availableWidth: number,
) => {
  if (!startDate || !endDate) {
    return null;
  }
  const totalDays = endDate.getDaysSinceEpoch() - startDate.getDaysSinceEpoch();
  const day = Math.round((left / availableWidth) * totalDays);
  const newDate = new DateWithoutTime(startDate.getDaysSinceEpoch());
  newDate.addDays(day);
  return newDate;
};

export const ScheduleLine: React.FC<ScheduleLineProps> = ({ item, indent }) => {
  const { startDate, endDate } = useSelector(getScheduleBounds);
  const [barContainer, attachBarContainer] = useCallbackRef<HTMLElement>();
  const [expanded, toggleExpanded] = useToggle(false);
  const rect = useResizeObserver(barContainer || null);
  const dispatch = useDispatch();
  const isSelected = useSelector(getSelectedId) === item.id;

  const onStartDrag = useCallback(() => {
    dispatch(selectItem(item.id));
  }, [dispatch, item.id]);

  const onSelect = useCallback(() => {
    if (isSelected) {
      dispatch(selectItem(null));
    } else {
      dispatch(selectItem(item.id));
    }
  }, [dispatch, item.id, isSelected]);

  const onChange = useCallback(
    (left: number, width: number) => {
      const newStart = leftToDate(left, startDate, endDate, rect?.width || 0);
      if (!newStart) {
        return;
      }
      console.info('onChange', item.index, left, width, newStart);
      dispatch(moveScheduleItem({ itemId: item.id, startDate: newStart }));
    },
    [dispatch, endDate, item.id, item.index, rect?.width, startDate],
  );

  const { width, left } = barGeometry(
    item.start_date,
    item.end_date,
    startDate,
    endDate,
    rect?.width || 0,
  );

  const containerChildren = item.children.filter((item) => item.type !== 'page');
  const expansionIcon = containerChildren.length === 0 ? null : expanded ? '-' : '+';

  const rowClass = isSelected ? 'bg-green-50' : '';

  return (
    <>
      <tr className={rowClass}>
        <td className="w-1 border-r-0" onClick={toggleExpanded}>
          {expansionIcon}
        </td>
        <td className="w-48" style={{ paddingLeft: (1 + indent) * 10 }} onClick={onSelect}>
          {item.title} {item.index}
        </td>
        <td className="relative p-0" ref={attachBarContainer}>
          <ScheduleHeader labels={false} availableWidth={rect?.width || 0} />
          <DragBar
            onStartDrag={onStartDrag}
            onChange={onChange}
            left={left}
            width={width}
            maxValue={rect?.width || 0}
            isContainer={expanded && containerChildren.length > 0}
          />
        </td>
      </tr>
      {expanded &&
        containerChildren.map((child) => (
          <ScheduleLine key={child.id} item={child} indent={indent + 1} />
        ))}

      {/* {expanded || containerChildren.map((_, i) => <SchedulePlaceholder key={i} />)} */}
    </>
  );
};
