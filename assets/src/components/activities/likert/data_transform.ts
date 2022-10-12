import { VizRecord } from 'data/persistence/viz';
import { LikertModelSchema } from './schema';
import { toSimpleText } from 'components/editing/slateUtils';
import { Choice } from '../types';

function shortenLabel(c: Choice, maxLength: number): string {
  const text = toSimpleText(c.content);
  if (text.length > maxLength) {
    return text.substring(0, maxLength) + '...';
  }
  return text;
}

export function transform(model: LikertModelSchema, data: VizRecord[]) {
  let next = 1;
  const choiceMap = model.choices.reduce((m: any, c) => {
    m[c.id] = { value: next++, text: shortenLabel(c, 100) };
    return m;
  }, {});

  return data
    .filter((d: VizRecord) => d.input !== '')
    .map((d: VizRecord) => {
      (d as any).choice = choiceMap[d.input].value + '';
      (d as any).choiceText = choiceMap[d.input].text;
      return d;
    });
}
