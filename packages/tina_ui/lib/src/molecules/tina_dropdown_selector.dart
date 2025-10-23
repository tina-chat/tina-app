import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:tina_ui/src/atoms/tina_dropdown_option.dart';
import 'package:tina_ui/src/atoms/tina_field_wrapper.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
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
    this.isRequired = false,
    this.isEnabled = true,
    this.isSearchable = false,
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

  /// Whether the field is required.
  final bool isRequired;

  /// Whether the dropdown is enabled.
  final bool isEnabled;

  /// Whether the dropdown is searchable.
  final bool isSearchable;

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
  final TextEditingController _searchController = TextEditingController();
  List<TinaDropdownOption<T>> _filteredOptions = [];
  bool _isDisposed = false;
  bool _isInternalFocusNode = false;

  @override
  void initState() {
    super.initState();
    _filteredOptions = widget.options;
    _isInternalFocusNode = widget.focusNode == null;
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _isDisposed = true;
    if (_isInternalFocusNode) {
      _focusNode.dispose();
    }
    _searchController.dispose();
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

  Widget _menuWidget() {
    return _DropdownMenu<T>(
      options: _filteredOptions,
      selectedValue: widget.value,
      onOptionSelected: (option) {
        _unfocus();
        if (mounted && !_isDisposed) {
          widget.onChanged?.call(option);
        }
      },
      isSearchable: widget.isSearchable,
      searchController: _searchController,
      onSearchChanged: (query) {
        if (mounted && !_isDisposed) {
          setState(() {
            _filteredOptions = widget.options.where((option) {
              final optionText = option.value.toString().toLowerCase();
              return optionText.contains(query.toLowerCase());
            }).toList();
          });
        }
      },
      optionBuilder: widget.optionBuilder,
    );
  }

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

    return PortalTarget(
      visible: _focusNode.hasFocus,
      anchor: const Aligned(
        follower: Alignment.topCenter,
        target: Alignment.bottomCenter,
        widthFactor: 1,
      ),
      portalFollower: _menuWidget(),
      child: TinaFieldWrapper(
        label: widget.label,
        hint: widget.hint,
        error: widget.error,
        isRequired: widget.isRequired,
        state: state,
        isEnabled: widget.isEnabled,
        isFocused: _focusNode.hasFocus,
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
                _focusNode.hasFocus
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: tinaColors.onSurfaceVariant,
                size: TinaIconSize.small,
              ),
            ],
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
    required this.isSearchable,
    required this.searchController,
    required this.onSearchChanged,
    this.optionBuilder,
  });

  final List<TinaDropdownOption<T>> options;
  final T? selectedValue;
  final void Function(T) onOptionSelected;
  final bool isSearchable;
  final TextEditingController searchController;
  final void Function(String) onSearchChanged;
  final Widget Function(BuildContext, TinaDropdownOption<T>)? optionBuilder;

  @override
  State<_DropdownMenu<T>> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<_DropdownMenu<T>> {
  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;

    return Material(
      elevation: DesignElevation.lg,
      borderRadius: BorderRadius.circular(DesignBorderRadius.xl),
      color: tinaColors.surface,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300),
        decoration: BoxDecoration(
          border: Border.all(color: tinaColors.outline),
          borderRadius: BorderRadius.circular(DesignBorderRadius.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isSearchable)
              Padding(
                padding: const EdgeInsets.all(DesignSpacing.sm),
                child: TextField(
                  controller: widget.searchController,
                  onChanged: widget.onSearchChanged,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        DesignBorderRadius.sm,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: DesignSpacing.sm,
                      vertical: DesignSpacing.xs,
                    ),
                  ),
                ),
              ),
            if (widget.options.isEmpty)
              const Padding(
                padding: EdgeInsets.all(DesignSpacing.md),
                child: TinaText(
                  style: TinaTextStyle.bodySmall,
                  color: TinaTextColor.onSurfaceVariant,
                  child: Text('No options found'),
                ),
              )
            else
              ...widget.options.map((option) {
                final isSelected = option.value == widget.selectedValue;
                return widget.optionBuilder?.call(context, option) ??
                    InkWell(
                      onTap: () {
                        widget.onOptionSelected(option.value);
                      },
                      borderRadius: BorderRadius.circular(
                        DesignBorderRadius.sm,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignSpacing.md,
                          vertical: DesignSpacing.sm,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? tinaColors.primary.withValues(alpha: 0.08)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            DesignBorderRadius.sm,
                          ),
                        ),
                        child: Row(
                          children: [
                            if (option.leading != null) ...[
                              option.leading!,
                              const SizedBox(width: DesignSpacing.sm),
                            ],
                            Expanded(
                              child: TinaText(
                                child: Text(
                                  option.value.toString(),
                                  style: TextStyle(
                                    color: option.isEnabled
                                        ? tinaColors.onSurface
                                        : tinaColors.onSurface.withValues(
                                            alpha: 0.6,
                                          ),
                                  ),
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
              }),
          ],
        ),
      ),
    );
  }
}
