import { ProjectSlug, SectionSlug } from 'data/types';
import { makeRequest } from './common';

export type VizDataSource = ByProject | BySection | ByProjectFamily | ByInstitution;

export type VizRecord = {
  correct: boolean;
  pNum: number;
  aNum: number;
  rNum: number;
  input: any;
  hints: number;
  score: number;
  outOf: number;
  revId: number;
  secId: number;
};

export interface ByProject {
  type: 'ByProject';
  projectSlug: ProjectSlug;
}
export interface BySection {
  type: 'BySection';
  sectionSlug: SectionSlug;
}
export interface ByProjectFamily {
  type: 'ByProjectFamily';
  projectFamilyId: string;
}
export interface ByInstitution {
  type: 'ByInstitution';
  projectSlug: ProjectSlug;
  institutionId: number;
}

export interface VizDataRetrieval {
  result: 'success';
  results: VizRecord[];
}

export function retrieve(activityId: number, dataSource: VizDataSource) {
  const params = {
    method: 'POST',
    body: JSON.stringify({ activityId, dataSource }),
    url: `/viz`,
  };

  return makeRequest<VizDataRetrieval>(params);
}
