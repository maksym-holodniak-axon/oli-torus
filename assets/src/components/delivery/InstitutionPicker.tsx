import React from 'react';
import { Typeahead } from 'components/common/Typeahead';

interface InstitutionPickerProps {}

export const InstitutionPicker: React.FC<InstitutionPickerProps> = () => {
  return (
    <Typeahead
      options={[
        { id: 0, label: 'One' },
        { id: 1, label: 'Two' },
        { id: 2, label: 'Three' },
      ]}
      useAutoSuggest
    />
  );
};
