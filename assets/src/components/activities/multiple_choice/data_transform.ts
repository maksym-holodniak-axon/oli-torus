import { VizRecord } from 'data/persistence/viz';
import { MCSchema } from './schema';
import { toSimpleText } from 'components/editing/slateUtils';
import { Choice } from '../types';

function shortenLabel(c: Choice, maxLength: number): string {
  const text = toSimpleText(c.content);
  if (text.length > maxLength) {
    return text.substring(0, maxLength) + '...';
  }
  return text;
}

export function transform(model: MCSchema, data: VizRecord[]) {
  let next = 65;
  const choiceMap = model.choices.reduce((m: any, c) => {
    m[c.id] = { label: String.fromCharCode(next++), text: shortenLabel(c, 100) };
    return m;
  }, {});

  return data.map((d: VizRecord) => {
    (d as any).choice = choiceMap[d.input].label;
    (d as any).choiceText = choiceMap[d.input].text;
    console.log(d);
    return d;
  });
}
