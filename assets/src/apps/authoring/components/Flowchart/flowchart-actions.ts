import { createAsyncThunk } from '@reduxjs/toolkit';
import { create, Created } from 'data/persistence/activity';
import guid from '../../../../utils/guid';
import ActivitiesSlice from '../../../delivery/store/features/activities/name';
import { upsertActivity } from '../../../delivery/store/features/activities/slice';
import { selectSequence } from '../../../delivery/store/features/groups/selectors/deck';
import { selectAllGroups } from '../../../delivery/store/features/groups/slice';
import { createCorrectRule } from '../../store/activities/actions/rules';
import { saveActivity } from '../../store/activities/actions/saveActivity';
import { createActivityTemplate } from '../../store/activities/templates/activity';
import { selectActivityTypes, selectProjectSlug, selectAppMode } from '../../store/app/slice';
import { addSequenceItem } from '../../store/groups/layouts/deck/actions/addSequenceItem';
import { setCurrentActivityFromSequence } from '../../store/groups/layouts/deck/actions/setCurrentActivityFromSequence';
import { savePage } from '../../store/page/actions/savePage';
import { selectState as selectPageState } from '../../store/page/slice';

interface AddFlowchartScreenPayload {
  fromScreenId?: string;
  toScreenId?: string;
  title?: string;
}

/**
 * Logic for adding a screen to the flowchart view of a lesson. This only works on appState.applicationMode === 'flowchart'
 *
 *  Assumptions:
 *      - Only a single group
 *      - No layers / parent screens
 */
export const addFlowchartScreen = createAsyncThunk(
  `${ActivitiesSlice}/addFlowchartScreen`,
  async (payload: AddFlowchartScreenPayload, { dispatch, getState }) => {
    const rootState = getState() as any;
    const appMode = selectAppMode(rootState);
    if (appMode !== 'flowchart') {
      throw new Error('addFlowchartScreen can only be called when appMode is flowchart');
    }
    const projectSlug = selectProjectSlug(rootState);
    const activityTypes = selectActivityTypes(rootState);
    const currentLesson = selectPageState(rootState);
    const sequence = selectSequence(rootState);

    const group = selectAllGroups(rootState)[0];

    const { title = 'New Screen' } = payload;

    const activity: any = {
      ...createActivityTemplate(),
      title,
      width: currentLesson.custom.defaultScreenWidth,
      height: currentLesson.custom.defaultScreenHeight,
    };

    const { payload: defaultRule } = await dispatch(
      createCorrectRule({ isDefault: true, label: 'default' }),
    );

    activity.model.authoring.rules.push(defaultRule);

    let createResults: any = {
      resourceId: `readonly_${Date.now()}`,
      revisionSlug: `readonly_${Date.now()}`,
    };

    createResults = await create(
      projectSlug,
      activity.typeSlug,
      activity.model,
      activity.objectives.attached,
    );

    // Copied this logic from createNew.ts, this absurdity needs to be understood and fixed
    activity.activity_id = (createResults as Created).resourceId;
    activity.activityId = activity.activity_id;
    activity.resourceId = activity.activity_id;
    activity.activitySlug = (createResults as Created).revisionSlug;

    activity.activityType = activityTypes.find((type: any) => type.slug === activity.typeSlug);

    const sequenceEntry: any = {
      type: 'activity-reference',
      resourceId: activity.resourceId,
      activitySlug: activity.activitySlug,
      custom: {
        isLayer: false,
        isBank: false,
        layerRef: null,
        sequenceId: `${activity.activitySlug}_${guid()}`,
        sequenceName: title,
      },
    };

    const reduxActivity = {
      id: activity.resourceId,
      resourceId: activity.resourceId,
      activitySlug: activity.activitySlug,
      activityType: activity.activityType,
      content: { ...activity.model, authoring: undefined },
      authoring: activity.model.authoring,
      title,
      tags: [],
    };
    dispatch(saveActivity({ activity: reduxActivity, undoable: false, immediate: true }));
    await dispatch(upsertActivity({ activity: reduxActivity }));

    await dispatch(
      addSequenceItem({
        sequence: sequence,
        item: sequenceEntry,
        group,
      }),
    );

    dispatch(setCurrentActivityFromSequence(sequenceEntry.custom.sequenceId));

    // will write the current groups
    await dispatch(savePage({ undoable: false }));

    return activity;
  },
);
