import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_field_hint.dart';
import 'package:tina_ui/src/atoms/tina_field_label.dart';
import 'package:tina_ui/src/internal/tina_pressable.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable field wrapper component following the Tina design system.
///
/// This wrapper provides consistent visual styling for all input components
/// with borders, background colors, focus states, and error handling.
class TinaFieldWrapper extends StatefulWidget {
  /// Creates a Tina field wrapper.
  const TinaFieldWrapper({
    required this.child,
    super.key,
    this.label,
    this.hint,
    this.error,
    this.isRequired = false,
    this.state = TinaFieldState.normal,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.isFocused = false,
    this.onTap,
    this.semanticLabel,
    this.semanticDescription,
  });

  /// The child widget to be wrapped (typically an input component).
  final Widget child;

  /// Optional label text to display above the field.
  final Widget? label;

  /// Optional hint text to display below the field.
  final Widget? hint;

  /// Optional error text to display below the field.
  final Widget? error;

  /// Whether the field is required.
  final bool isRequired;

  /// The visual state of the field.
  final TinaFieldState state;

  /// Whether the field is enabled.
  final bool isEnabled;

  /// Whether the field is read-only.
  final bool isReadOnly;

  /// Whether the field is currently focused.
  final bool isFocused;

  /// Callback when the field is tapped.
  final VoidCallback? onTap;

  /// A semantic label for the field for accessibility.
  final String? semanticLabel;

  /// A semantic description for the field for accessibility.
  final String? semanticDescription;

  @override
  State<TinaFieldWrapper> createState() => _TinaFieldWrapperState();
}

class _TinaFieldWrapperState extends State<TinaFieldWrapper> {
  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;

    return Semantics(
      label: widget.semanticLabel,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null)
            TinaFieldLabel(
              isRequired: widget.isRequired,
              child: widget.label!,
            ),
          if (widget.label != null) const SizedBox(height: DesignSpacing.xs),
          _buildFieldContainer(tinaColors),
          if (widget.hint != null || widget.error != null)
            const SizedBox(
              height: DesignSpacing.xs,
            ),
          if (widget.hint != null || widget.error != null)
            TinaFieldHint(
              text: widget.hint,
              error: widget.error,
            ),
        ],
      ),
    );
  }

  Widget _buildFieldContainer(TinaColorScheme tinaColors) {
    return TinaPressable(
      color: tinaColors.primary,
      onPressed: widget.isEnabled ? widget.onTap : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DesignBorderRadius.xl),
        color: _getBackgroundColor(tinaColors),
        // color: tinaColors.primary,
      ),
      child: AnimatedContainer(
        duration: DesignDuration.normal,
        decoration: BoxDecoration(
          // color: _getBackgroundColor(tinaColors),
          border: Border.all(
            color: _getBorderColor(tinaColors),
          ),
          borderRadius: BorderRadius.circular(DesignBorderRadius.xl),
          boxShadow: _getBoxShadow(tinaColors),
        ),
        child: widget.child,
      ),
    );
  }

  Color _getBackgroundColor(TinaColorScheme colors) {
    if (!widget.isEnabled) return colors.surfaceVariant.withValues(alpha: 0.5);
    if (widget.isReadOnly) return colors.surfaceVariant;
    return colors.surface;
  }

  Color _getBorderColor(TinaColorScheme colors) {
    if (!widget.isEnabled) return colors.outlineVariant;

    return switch (widget.state) {
      TinaFieldState.normal =>
        widget.isFocused ? colors.primary : colors.outline,
      TinaFieldState.success => colors.success,
      TinaFieldState.warning => colors.warning,
      TinaFieldState.error => colors.error,
    };
  }

  List<BoxShadow>? _getBoxShadow(TinaColorScheme colors) {
    if (!widget.isEnabled || widget.isReadOnly) return null;

    if (widget.isFocused && widget.state != TinaFieldState.error) {
      return [
        BoxShadow(
          color: colors.primary.withValues(alpha: 0.1),
          blurRadius: 4,
          spreadRadius: 2,
        ),
      ];
    }

    if (widget.state == TinaFieldState.error) {
      return [
        BoxShadow(
          color: colors.error.withValues(alpha: 0.1),
          blurRadius: 4,
          spreadRadius: 2,
        ),
      ];
    }

    return null;
  }
}

/// The visual state of a [TinaFieldWrapper].
enum TinaFieldState {
  /// Normal state.
  normal,

  /// Success state (green border).
  success,

  /// Warning state (yellow border).
  warning,

  /// Error state (red border).
  error,
}
