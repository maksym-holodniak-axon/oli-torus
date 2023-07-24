import React from 'react';
import { classNames } from 'utils/classNames';

export interface TypeaheadOption {
  id: string | number;
  label: string;
}

export interface TypeaheadProps {
  options: TypeaheadOption[];
  useAutoSuggest?: boolean;
  onSelect?: (option: TypeaheadOption) => void;
}

export interface TypeaheadState {
  query: string;
  selection?: TypeaheadOption;
}

type Action =
  | { type: 'SET_QUERY'; payload: string }
  | { type: 'SET_SELECTED'; payload: TypeaheadOption | null };

const reducer = (state: TypeaheadState, action: Action) => {
  switch (action.type) {
    case 'SET_QUERY':
      return {
        ...state,
        query: action.payload,
      };
    case 'SET_SELECTED':
      return {
        ...state,
        selected: action.payload,
      };
    default:
      return state;
  }
};

const initial = (): TypeaheadState => ({
  query: '',
});

export const Typeahead = ({ options, useAutoSuggest, onSelect }: TypeaheadProps) => {
  const [{ query, selection }, dispatch] = React.useReducer(reducer, initial());

  const filteredOptions = options.filter((option) =>
    option.label.toLowerCase().includes(query.toLowerCase()),
  );

  return (
    <div>
      <input
        type="text"
        className="rounded border border-gray-200 dark:border-gray-600 px-4 py-2"
        placeholder="Search"
        value={query}
        onChange={({ target: { value } }) => dispatch({ type: 'SET_QUERY', payload: value })}
      />
      {query.length > 0 && (
        <div className="relative">
          <ul className="absolute top-0 left-0 right-0 z-50 w-96 rounded-lg border border-gray-200 dark:border-gray-600">
            {filteredOptions.map((option, i) => (
              <TypeaheadOption
                key={option.id}
                option={option}
                positionInList={getPositionInList(i)}
                onClick={() => {
                  if (useAutoSuggest) dispatch({ type: 'SET_QUERY', payload: option.label });
                  onSelect && onSelect(option);
                }}
                isSelected={selection && selection.id === option.id}
              />
            ))}
          </ul>
        </div>
      )}
    </div>
  );
};

interface TypeaheadOptionProps {
  option: TypeaheadOption;
  positionInList?: 'start' | 'middle' | 'end';
  onClick?: () => void;
  isSelected?: boolean;
}

const TypeaheadOption = ({ option, positionInList, isSelected, onClick }: TypeaheadOptionProps) => (
  <li
    className={classNames(
      'w-full px-4 py-2 dark:bg-black border-b border-gray-200 dark:border-gray-600 cursor-pointer hover:bg-blue-500 hover:text-white',
      positionInList === 'start'
        ? 'rounded-t'
        : positionInList === 'end'
        ? 'rounded-b'
        : 'rounded-none',
      isSelected && 'bg-blue-500 text-white',
      !isSelected && 'bg-white text-gray-900',
    )}
    onClick={onClick}
  >
    {option.label}
  </li>
);

const getPositionInList = (index: number): 'start' | 'middle' | 'end' => {
  switch (index) {
    case 0:
      return 'start';
    case 1:
      return 'middle';
    default:
      return 'end';
  }
};
