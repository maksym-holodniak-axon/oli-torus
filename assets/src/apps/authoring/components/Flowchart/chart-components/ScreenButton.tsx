import React from 'react';

interface ScreenButtonProps {
  children?: React.ReactNode;
  onClick?: () => void;
}

export const ScreenButton: React.FC<ScreenButtonProps> = ({ children, onClick }) => {
  return (
    <button
      className="bg-delivery-primary-50 hover:bg-delivery-primary text-delivery-body active:bg-delivery-primary-600 px-2 rounded-md"
      onClick={onClick}
    >
      {children}
    </button>
  );
};
