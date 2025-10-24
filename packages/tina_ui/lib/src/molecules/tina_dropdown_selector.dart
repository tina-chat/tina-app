import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:tina_ui/src/atoms/tina_dropdown_option.dart';
import 'package:tina_ui/src/atoms/tina_field_wrapper.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/internal/tina_pressable.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable dropdown selector component following the Tina design system.
///
/// This selector provides a dropdown interface with consistent styling,
/// search functionality, and keyboard navigation.
class TinaDropdownSelector<T> extends StatefulWidget {
  /// Creates a Tina dropdown selector.
  const TinaDropdownSelector({
    required this.options,
    super.key,
    this.value,
    this.onChanged,
    this.placeholder,
    this.label,
    this.hint,
    this.error,
    this.header,
    this.footer,
    this.isRequired = false,
    this.isEnabled = true,
    this.focusNode,
    this.semanticLabel,
    this.optionBuilder,
  });

  /// The list of options to display in the dropdown.
  final List<TinaDropdownOption<T>> options;

  /// The currently selected value.
  final T? value;

  /// Callback when the selection changes.
  final ValueChanged<T?>? onChanged;

  /// Placeholder text to display when no value is selected.
  final Widget? placeholder;

  /// Optional label text to display above the field.
  final Widget? label;

  /// Optional hint text to display below the field.
  final Widget? hint;

  /// Optional error text to display below the field.
  final Widget? error;

  /// optional header for dropdown
  final Widget? header;

  /// optional footer for dropdown
  final Widget? footer;

  /// Whether the field is required.
  final bool isRequired;

  /// Whether the dropdown is enabled.
  final bool isEnabled;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// A semantic label for accessibility.
  final String? semanticLabel;

  /// Optional custom builder for dropdown options.
  final Widget Function(BuildContext, TinaDropdownOption<T>)? optionBuilder;

  @override
  State<TinaDropdownSelector<T>> createState() =>
      _TinaDropdownSelectorState<T>();
}

class _TinaDropdownSelectorState<T> extends State<TinaDropdownSelector<T>> {
  late FocusNode _focusNode;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    // Ensure overlay is removed before widget is disposed
    super.dispose();
  }

  void _toggleDropdown() {
    if (_focusNode.hasFocus) {
      _unfocus();
    } else {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  void _unfocus() => _focusNode.unfocus();

  Widget _getDisplayText() {
    if (widget.value == null) {
      if (widget.placeholder != null) {
        return TinaText(
          color: TinaTextColor.onSurfaceVariant,
          child: widget.placeholder!,
        );
      }
      return const Text('');
    }

    final selectedOption = widget.options.firstWhere(
      (option) => option.value == widget.value,
      orElse: () => TinaDropdownOption<T>(
        value: widget.value as T,
        child: const Text(''),
      ),
    );

    return selectedOption.child ?? const Text('');
  }

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final hasError = widget.error != null;
    final state = hasError ? TinaFieldState.error : TinaFieldState.normal;

    return FocusScope(
      onKey: (node, event) {
        // Handle ESC key to close dropdown
        if (event.logicalKey == LogicalKeyboardKey.escape && _isDropdownOpen) {
          _unfocus();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Focus(
        focusNode: _focusNode,
        descendantsAreFocusable: true,
        onFocusChange: (hasFocus) {
          setState(() {
            _isDropdownOpen = hasFocus;
          });
        },
        child: PortalTarget(
          visible: _isDropdownOpen,
          anchor: const Aligned(
            follower: Alignment.topCenter,
            target: Alignment.bottomCenter,
            widthFactor: 1,
          ),
          portalFollower: FocusScope(
            child: _DropdownMenu<T>(
              options: widget.options,
              selectedValue: widget.value,
              onOptionSelected: (option) {
                _unfocus();
                if (mounted) {
                  widget.onChanged?.call(option);
                }
              },
              header: widget.header,
              footer: widget.footer,
              optionBuilder: widget.optionBuilder,
            ),
          ),
          child: TinaFieldWrapper(
            label: widget.label,
            hint: widget.hint,
            error: widget.error,
            isRequired: widget.isRequired,
            state: state,
            isEnabled: widget.isEnabled,
            isFocused: _isDropdownOpen,
            onTap: _toggleDropdown,
            semanticLabel: widget.semanticLabel,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: DesignSpacing.sm,
                horizontal: DesignSpacing.md,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TinaText(
                      child: _getDisplayText(),
                    ),
                  ),
                  const SizedBox(width: DesignSpacing.sm),
                  TinaIcon(
                    _isDropdownOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: tinaColors.onSurfaceVariant,
                    size: TinaIconSize.small,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DropdownMenu<T> extends StatefulWidget {
  const _DropdownMenu({
    required this.options,
    required this.selectedValue,
    required this.onOptionSelected,
    required this.header,
    required this.footer,
    this.optionBuilder,
    super.key,
  });

  final List<TinaDropdownOption<T>> options;
  final T? selectedValue;
  final void Function(T) onOptionSelected;
  final Widget? header;
  final Widget? footer;
  final Widget Function(BuildContext, TinaDropdownOption<T>)? optionBuilder;

  @override
  State<_DropdownMenu<T>> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<_DropdownMenu<T>> {
  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;

    return Container(
      constraints: const BoxConstraints(maxHeight: 300),
      decoration: BoxDecoration(
        border: Border.all(color: tinaColors.outline),
        borderRadius: BorderRadius.circular(DesignBorderRadius.md),
        color: tinaColors.surface,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.header != null) widget.header!,
          Expanded(
            // constraints: const BoxConstraints(maxHeight: 300),
            child: ListView.builder(
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                final option = widget.options[index];

                final isSelected = option.value == widget.selectedValue;
                return widget.optionBuilder?.call(context, option) ??
                    TinaPressable(
                      onPressed: () {
                        widget.onOptionSelected(option.value);
                      },
                      color: context.tinaColors.primary,

                      decoration: BoxDecoration(
                        color: isSelected
                            ? tinaColors.primary.withValues(alpha: 0.08)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          DesignBorderRadius.sm,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignSpacing.md,
                          vertical: DesignSpacing.sm,
                        ),
                        child: Row(
                          children: [
                            if (option.leading != null) ...[
                              option.leading!,
                              const SizedBox(width: DesignSpacing.sm),
                            ],
                            Expanded(
                              child: TinaText(
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                    color: option.isEnabled
                                        ? tinaColors.onSurface
                                        : tinaColors.onSurface.withValues(
                                            alpha: 0.6,
                                          ),
                                  ),
                                  child: option.child!,
                                ),
                              ),
                            ),
                            if (option.trailing != null) ...[
                              const SizedBox(width: DesignSpacing.sm),
                              option.trailing!,
                            ] else if (isSelected) ...[
                              const SizedBox(width: DesignSpacing.sm),
                              TinaIcon(
                                Icons.check,
                                color: tinaColors.primary,
                                size: TinaIconSize.small,
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
              },
            ),
          ),

          if (widget.footer != null) widget.footer!,
        ],
      ),
    );
  }
}
