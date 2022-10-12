import * as React from 'react';
import guid from 'utils/guid';
import { VizDataSource, retrieve, VizRecord } from 'data/persistence/viz';

import { Config, TopLevelSpec, compile } from 'vega-lite';
import embed from 'vega-embed';
import { ActivityModelSchema } from 'components/activities/types';

type renderState = 'uninitialized' | 'requested' | 'rendered';

export interface AnalyticsViewProps {
  model: ActivityModelSchema;
  activetab?: boolean;
  vizDataSource: VizDataSource;
  activityId: number;
  vizzes: TopLevelSpec[];
  transform: (model: ActivityModelSchema, data: VizRecord[]) => any[];
}

export interface AnalyticsViewsState {
  renderState: renderState;
  vizData: VizRecord[];
  selectedVizIndex: number;
}

type VizOptionProps = {
  viz: TopLevelSpec;
  active: boolean;
  onClick: () => void;
};

export const VizOption: React.FC<VizOptionProps> = (props: VizOptionProps) => {
  return (
    <a href="#" className={`dropdown-item ${props.active ? 'active' : ''}`} onClick={props.onClick}>
      {props.viz.title}
    </a>
  );
};

function renderViz(spec: TopLevelSpec, values: Record<string, unknown>[], id: string) {
  const specWithData = Object.assign({}, spec, { data: { values } });
  const vegaSpec = compile(specWithData as TopLevelSpec, {}).spec;

  const el = document.getElementById(id);
  embed(el as any, vegaSpec);
}

export class AnalyticsView extends React.Component<AnalyticsViewProps, AnalyticsViewsState> {
  guid: string;
  constructor(props: AnalyticsViewProps) {
    super(props);
    this.guid = guid();
    this.state = {
      renderState: 'uninitialized',
      vizData: [],
      selectedVizIndex: 0,
    };
  }

  componentDidUpdate(prevProps: AnalyticsViewProps, prevState: AnalyticsViewsState) {
    if (
      !prevProps.activetab &&
      this.props.activetab &&
      this.state.renderState === 'uninitialized'
    ) {
      this.setState({ renderState: 'requested' });
      retrieve(this.props.activityId, this.props.vizDataSource).then((results) => {
        if (results.result === 'success') {
          const data = this.props.transform(this.props.model, results.results);
          this.setState({ vizData: data, renderState: 'rendered' });
          renderViz(this.props.vizzes[0], data, this.guid);
        }
      });
    } else if (prevState.selectedVizIndex !== this.state.selectedVizIndex) {
      renderViz(this.props.vizzes[this.state.selectedVizIndex], this.state.vizData, this.guid);
    }
  }

  render() {
    const vizOptions = this.props.vizzes.map((v, i) => (
      <VizOption
        key={i}
        viz={v}
        active={i === this.state.selectedVizIndex}
        onClick={() => this.setState({ selectedVizIndex: i })}
      />
    ));

    return (
      <div className="d-flex flex-column">
        <div className="d-flex justify-content-end">
          <div className="btn-group">
            <button
              className="btn btn-sm btn-secondary dropdown-toggle"
              type="button"
              data-toggle="dropdown"
              aria-expanded="false"
            >
              {this.props.vizzes[this.state.selectedVizIndex].title}
            </button>

            <div className="dropdown-menu">{vizOptions}</div>
          </div>
        </div>
        <div id={this.guid} style={{ height: 350 }} className="d-flex justify-content-center"></div>
      </div>
    );
  }
}
