import { DateWithoutTime, Week } from 'epoq';
import { HierarchyItem } from './scheduler-slice';

export const resetScheduleItem = (
  root: HierarchyItem,
  start: DateWithoutTime,
  end: DateWithoutTime,
) => {
  const count = root.children.length;
  if (count === 0) return;
  // Week based calculations...
  // const startWeek = new Week(start.utcMidnightDateObj);
  // //startWeek.weekSinceEpoch += 1;
  // const endWeek = new Week(end.utcMidnightDateObj);
  // const weekCount = endWeek.weekSinceEpoch - startWeek.weekSinceEpoch + 1;
  // const itemSpacing = Math.floor(weekCount / count);
  // const itemLength = Math.ceil(weekCount / count);
  // for (const child of root.children) {
  //   child.start_date = new DateWithoutTime(startWeek.weekSinceEpoch * 7);
  //   child.end_date = new DateWithoutTime((startWeek.weekSinceEpoch + itemLength) * 7);
  //   startWeek.weekSinceEpoch += itemSpacing;
  // }
  // Day based calculations...
  let startDay = start.getDaysSinceEpoch();
  const endDay = end.getDaysSinceEpoch();
  const dayCount = endDay - startDay - 1;
  const itemSpacing = dayCount / count;
  const itemLength = Math.ceil(dayCount / count);
  for (const child of root.children) {
    child.start_date = new DateWithoutTime(Math.floor(startDay));
    child.end_date = new DateWithoutTime(Math.min(startDay + itemLength, end.getDaysSinceEpoch()));
    startDay += itemSpacing;
    resetScheduleItem(child, child.start_date, child.end_date);
  }
};
