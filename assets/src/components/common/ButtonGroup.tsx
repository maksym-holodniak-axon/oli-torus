import React, {
  ComponentProps,
  PropsWithChildren,
  Children,
  FC,
  ReactElement,
  useMemo,
  useCallback,
  useRef,
  cloneElement,
  forwardRef,
  createElement,
  ElementType,
  useState,
} from 'react';
import { Popover } from 'react-tiny-popover';
import { classNames, WithClassName } from 'utils/classNames';

export interface ButtonGroupProps extends ComponentProps<'div'> {
  size?: ButtonSizes;
}

const ButtonGroupComponent: FC<WithClassName<PropsWithChildren<ButtonGroupProps>>> = ({
  children,
  className,
  size = 'md',
  ...props
}: ButtonGroupProps) => {
  const items = useMemo(
    () =>
      Children.map(children as ReactElement<ButtonProps>[], (child, index) =>
        cloneElement(child, {
          size,
          positionInGroup:
            index === 0
              ? 'start'
              : index === (children as ReactElement<ButtonProps>[]).length - 1
              ? 'end'
              : 'middle',
        }),
      ),
    [children],
  );

  return (
    <div className={classNames('', className)} role="group" {...props}>
      {items}
    </div>
  );
};

export interface ButtonBaseProps extends Omit<ComponentProps<'button'>, 'color' | 'ref'> {
  as?: ElementType;
  href?: string;
}

interface Props extends ButtonBaseProps, Record<string, unknown> {}

export const ButtonBase = forwardRef<HTMLButtonElement | HTMLAnchorElement, Props>(
  ({ children, as: Component = 'button', href, ...props }, ref) => {
    const BaseComponent = href ? 'a' : Component ?? 'button';
    const type = Component === 'button' ? 'button' : undefined;

    return createElement(BaseComponent, { ref, href, type, ...props }, children);
  },
);
ButtonBase.displayName = 'Button';

export type ButtonSizes = 'xs' | 'sm' | 'md' | 'lg' | 'xl';

function sizeClasses(size: ButtonSizes) {
  switch (size) {
    case 'xs':
      return 'px-2.5 py-1.5 text-xs';
    case 'sm':
      return 'px-3 py-2 text-sm';
    case 'lg':
      return 'px-4 py-2 text-base';
    case 'xl':
      return 'px-6 py-3 text-base';
    default:
      return 'px-4 py-2 text-sm';
  }
}

type PositionInButtonGroup = 'start' | 'middle' | 'end';

export interface ButtonProps extends ButtonBaseProps {
  positionInGroup?: PositionInButtonGroup;
  size?: ButtonSizes;
}

interface ButtonComponentProps extends ButtonProps, Record<string, unknown> {}

const ButtonComponent = forwardRef<HTMLButtonElement | HTMLAnchorElement, ButtonComponentProps>(
  (
    {
      children,
      className,
      disabled = false,
      label,
      positionInGroup = 'none',
      size = 'md',
      ...props
    },
    ref,
  ) => {
    return (
      <ButtonBase
        disabled={disabled}
        ref={ref as never}
        className={classNames(
          'font-medium text-gray-900 border bg-white border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-blue-500 dark:focus:text-white',
          sizeClasses(size),
          positionInGroup === 'start'
            ? 'rounded-l'
            : positionInGroup === 'end'
            ? 'rounded-r'
            : 'rounded-none',
          className,
        )}
        {...props}
      >
        {children}
      </ButtonBase>
    );
  },
);
ButtonComponent.displayName = 'ButtonComponent';

interface DropdownComponentProps extends ButtonProps, Record<string, unknown> {}

const DropdownComponent = forwardRef<HTMLButtonElement | HTMLAnchorElement, DropdownComponentProps>(
  (
    {
      children,
      className,
      variant,
      disabled = false,
      label,
      positionInGroup = 'none',
      size = 'md',
      ...props
    },
    ref,
  ) => {
    const dropdownRef = useRef<HTMLButtonElement | null>(null);
    const [isOpen, setIsOpen] = useState(false);

    const onClick = useCallback(
      (e) => {
        setIsOpen(!isOpen);
        e.stopPropagation();
      },
      [isOpen],
    );

    return (
      <Popover
        ref={dropdownRef}
        onClickOutside={() => setIsOpen(false)}
        isOpen={isOpen}
        positions={['bottom']}
        reposition={true}
        align={'end'}
        containerStyle={{ zIndex: '100000' }}
        content={<div className={`${className} flex flex-col `}>{children}</div>}
      >
        <ButtonComponent size={size} onClick={onClick} positionInGroup={positionInGroup}>
          <i className="fa-solid fa-angle-down"></i>
        </ButtonComponent>
      </Popover>
    );
  },
);
DropdownComponent.displayName = 'DropdownComponent';

interface DropdownItemComponentProps extends ButtonProps, Record<string, unknown> {}

const DropdownItemComponent = forwardRef<
  HTMLButtonElement | HTMLAnchorElement,
  DropdownItemComponentProps
>((props, ref) => {
  return <ButtonComponent {...props} />;
});
DropdownItemComponent.displayName = 'DropdownItemComponent';

export const ButtonGroup = Object.assign(ButtonGroupComponent, {
  Button: ButtonComponent,
  Dropdown: DropdownComponent,
  DropdownItem: DropdownItemComponent,
});
