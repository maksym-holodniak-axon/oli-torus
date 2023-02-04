import { makeRequest, Ok, ServerError } from './common';

export type PromptResult = Completion | ServerError;

export type Completion = {
  completion: string;
  result: 'success';
};

export function prompt(prompt: string): Promise<PromptResult> {
  const params = {
    url: '/openai',
    method: 'POST',
    body: JSON.stringify({ prompt })
  };
  return makeRequest<PromptResult>(params);
}
