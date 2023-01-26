import { createSlice } from '@reduxjs/toolkit';
import type { PayloadAction } from '@reduxjs/toolkit';
import { DateWithoutTime } from 'epoq';
import { Reset } from '../../components/activities/common/Reset';
import { resetScheduleItem } from './schedule-reset';

// Version that comes from torus
export interface HierarchyItemSrc {
  children: HierarchyItemSrc[];
  id: string;
  graded: string;
  index: string;
  next: string;
  prev: string;
  slug: string;
  title: string;
  type: string;
}

export interface HierarchyItem extends HierarchyItemSrc {
  start_date: DateWithoutTime | null;
  end_date: DateWithoutTime | null;
  children: HierarchyItem[];
}

export interface SchedulerState {
  schedule: HierarchyItem | null;
  start_date: DateWithoutTime | null;
  end_date: DateWithoutTime | null;
  selectedId: string | null;
}

export const initSchedulerState = (): SchedulerState => ({
  schedule: null,
  end_date: null,
  start_date: null,
  selectedId: null,
});

const buildHierarchyItem = (item: HierarchyItemSrc, startDate: DateWithoutTime): HierarchyItem => {
  const endDate = new DateWithoutTime(startDate.getDaysSinceEpoch());
  endDate.addDays(3);
  return {
    ...item,
    start_date: startDate,
    end_date: endDate,
    children: item.children.map((i) => buildHierarchyItem(i, startDate)),
  };
};

const initialState = { schedule: null } as SchedulerState;

interface InitPayload {
  hierarchy: HierarchyItemSrc;
  start_date: string;
  end_date: string;
}

interface MovePayload {
  itemId: string;
  startDate: DateWithoutTime;
  endDate: DateWithoutTime;
}

const findItem = (root: HierarchyItem | null, itemId: string): HierarchyItem | null => {
  if (root?.id === itemId) {
    return root;
  }
  for (const child of root?.children || []) {
    const found = findItem(child, itemId);
    if (found) {
      return found;
    }
  }
  return null;
};

const schedulerSlice = createSlice({
  name: 'scheduler',
  initialState,
  reducers: {
    initSchedule(state, action: PayloadAction<InitPayload>) {
      state.start_date = new DateWithoutTime(action.payload.start_date);
      state.end_date = new DateWithoutTime(action.payload.end_date);
      state.schedule = buildHierarchyItem(action.payload.hierarchy, state.start_date);
    },
    moveScheduleItem(state, action: PayloadAction<MovePayload>) {
      const mutableItem = findItem(state.schedule, action.payload.itemId);

      if (mutableItem) {
        mutableItem.start_date = action.payload.startDate;
        mutableItem.end_date = action.payload.endDate;
      }
    },
    resetSchedule(state) {
      if (state.schedule && state.start_date && state.end_date) {
        resetScheduleItem(state.schedule, state.start_date, state.end_date);
      }
    },
    selectItem(state, action: PayloadAction<string | null>) {
      state.selectedId = action.payload;
    },
  },
});

export const { initSchedule, moveScheduleItem, resetSchedule, selectItem } = schedulerSlice.actions;
export const schedulerSliceReducer = schedulerSlice.reducer;
