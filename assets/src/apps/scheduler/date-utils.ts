import { DateWithoutTime } from 'epoq';

/*
  When translating a date to a position along our graphical schedule, there are several points that correlate to each date.
  Each coordinate should correspond to exactly one date.
  The first coordinate is the start of the schedule, the last coordinate is the end of the schedule.

  So if we have 10 days, and 100 pixels, each day is 10 pixels wide with day 0 being 0-9 and day 9 being 90-99

  Rarely with the math work out, so we're going ot have fractional pixels to worry about. Whenever a boundary between
  dates occurs, the rounded pixel before that decimal is the day before and the rounded pixel after is the day after.

  So if we have 10 days, and 105 pixels, each day is 10.5 pixels wide with day 0 being 0-10, day 1 being 11-20 since the boundary was 10.5

  When we draw a bar, we have to draw it from the beginning to the end pixel, and not just blindly use a calculated width (so 11 pixels wide and
  10 pixels wide in the example above).  For very many, very small bars, this may become noticable.
*/

interface SingleDayGeometry {
  left: number;
  width: number;
  date: DateWithoutTime;
}

export interface DayGeometry {
  start: DateWithoutTime;
  end: DateWithoutTime;
  availableWidth: number;
  geometry: SingleDayGeometry[];
}

// Let's generate an array of geometry to use for our dates to use instead of doing it all on the fly every time.
// In the app, this will likely only really be re-calculated when the window is resized.
export const generateDayGeometry = (
  startDate: DateWithoutTime | null,
  endDate: DateWithoutTime | null,
  availableWidth: number,
): DayGeometry => {
  if (!startDate || !endDate) {
    return {
      start: new DateWithoutTime(0),
      end: new DateWithoutTime(0),
      availableWidth,
      geometry: [],
    };
  }
  const totalDays = endDate.getDaysSinceEpoch() - startDate.getDaysSinceEpoch() + 1;
  const geometry = [];
  for (let day = 0; day < totalDays; day++) {
    const left = Math.floor(((day / Math.max(1, totalDays)) * availableWidth) | 0);
    const next = Math.floor((((1 + day) / Math.max(1, totalDays)) * availableWidth) | 0);
    const date = new DateWithoutTime(startDate.getDaysSinceEpoch() + day);
    geometry.push({
      date,
      left: left,
      width: next - left,
    });
  }
  return {
    availableWidth,
    start: startDate,
    end: endDate,
    geometry,
  };
};

const findGeometry = (dayGeometry: DayGeometry, date: DateWithoutTime | null) => {
  if (!date) return null;

  const epoc = date.getDaysSinceEpoch();
  if (epoc < dayGeometry.start.getDaysSinceEpoch()) {
    // Requesting a date before our start date, gets you our start date
    return dayGeometry.geometry[0];
  }

  if (epoc > dayGeometry.end.getDaysSinceEpoch()) {
    // Requesting a date after our start date, gets you our last date
    return dayGeometry.geometry[dayGeometry.geometry.length - 1];
  }

  return dayGeometry.geometry.find((dg) => dg.date.getDaysSinceEpoch() === epoc);
};

export const barGeometry = (
  dayGeometry: DayGeometry,
  startDate: DateWithoutTime | null,
  endDate: DateWithoutTime | null,
) => {
  if (!dayGeometry || !startDate) {
    return { width: 0, left: 0 };
  }

  const firstDate = new DateWithoutTime(
    Math.min(startDate.getDaysSinceEpoch(), (endDate || startDate).getDaysSinceEpoch()),
  );
  const lastDate = new DateWithoutTime(
    Math.max(startDate.getDaysSinceEpoch(), (endDate || startDate).getDaysSinceEpoch()),
  );

  const start = findGeometry(dayGeometry, firstDate);
  const end = findGeometry(dayGeometry, lastDate);
  const endPostion = end ? end.left + end.width : start ? start.left + start.width : 0;
  const width = start ? endPostion - start.left : 0;

  // console.info({
  //   firstDate,
  //   lastDate,
  //   startDate,
  //   endDate,
  //   width,
  //   start,
  //   end,
  //   dayGeometry,
  // });

  return {
    width,
    left: start?.left || 0,
  };
};

// Turn a left offset of one of the bars to a date that corresponds.
export const leftToDate = (
  left: number,
  dayGeometry: DayGeometry,
): SingleDayGeometry | undefined => {
  if (!dayGeometry) {
    return undefined;
  }

  if (left < 0) return dayGeometry.geometry[0]; // Return the first one if we're before it

  return (
    dayGeometry.geometry.find((dg) => dg.left <= left && dg.left + dg.width > left) ||
    dayGeometry.geometry[dayGeometry.geometry.length - 1] // return the last one if we're past it
  );
};

interface WeekGeometry {
  width: number;
  //week: number;
}
export const weekGeometry = (dayGeometry: DayGeometry): WeekGeometry[] => {
  return dayGeometry.geometry.reduce((acc, g, index) => {
    const last = acc[acc.length - 1];

    if (index % 7 === 0) {
      acc.push({
        width: g.width,
      });
    } else {
      last.width += g.width;
    }

    return acc;
  }, [] as WeekGeometry[]);
};
