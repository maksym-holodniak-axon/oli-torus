import React, { useCallback } from 'react';
import { useDocumentMouseEvents } from '../../components/hooks/useDocumentMouseEvents';
import { useToggle } from '../../components/hooks/useToggle';

interface DragBarProps {
  left: number;
  width: number;
  maxValue: number;
  isContainer: boolean;
  onChange?: (left: number, width: number) => void;
  onStartDrag?: () => void;
}

const clamp = (num: number, min: number, max: number) => Math.min(Math.max(num, min), max);

export const DragBar: React.FC<DragBarProps> = ({
  left,
  width,
  maxValue,
  onChange,
  isContainer,
  onStartDrag,
}) => {
  const [isDragging, _, enableDrag, disableDrag] = useToggle();
  const [workingLeft, setWorkingLeft] = React.useState(left);
  const [workingWidth, setWorkingWidth] = React.useState(width);
  const [mouseDownX, setMouseDownX] = React.useState(0);

  const onMouseMove = (e: MouseEvent) => {
    const delta = e.clientX - mouseDownX;
    setWorkingLeft(clamp(left + delta, 0, maxValue - workingWidth));
  };

  const startDrag = useCallback(
    (e: React.MouseEvent) => {
      enableDrag();
      setMouseDownX(e.clientX);
      setWorkingLeft(left);
      setWorkingWidth(width);
      onStartDrag && onStartDrag();
    },
    [enableDrag, left, width, onStartDrag],
  );

  const stopDrag = useCallback(
    (_e: React.MouseEvent | MouseEvent) => {
      disableDrag();
      onChange && onChange(workingLeft, workingWidth);
    },
    [disableDrag, onChange, workingLeft, workingWidth],
  );

  useDocumentMouseEvents(isDragging, undefined, stopDrag, onMouseMove);

  const effectiveLeft = isDragging ? workingLeft : left;
  const effectiveWidth = isDragging ? workingWidth : width;

  const barStyles = {
    left: effectiveLeft,
    width: effectiveWidth,
  };

  return isContainer ? (
    <div
      onMouseDown={startDrag}
      className=" absolute border-x-4 border-t-4 border-black h-3 top-3"
      style={barStyles}
    ></div>
  ) : (
    <div
      onMouseDown={startDrag}
      className="rounded absolute bg-sky-500 h-7 top-1.5"
      style={barStyles}
    ></div>
  );
};
