import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_icon.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/internal/tina_pressable.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable dropdown option component following the Tina design system.
///
/// This option provides consistent styling for dropdown items with support
/// for custom content, icons, and selection states.
class TinaDropdownOption<T> extends StatelessWidget {
  /// Creates a Tina dropdown option.
  const TinaDropdownOption({
    required this.value,
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.isEnabled = true,
    this.isSelected = false,
    this.onTap,
    this.semanticLabel,
  });

  /// The value associated with this option.
  final T value;

  /// The label widget to display.
  final Widget? child;

  /// A widget to display before the label.
  final Widget? leading;

  /// A widget to display after the label.
  final Widget? trailing;

  /// Whether the option is enabled.
  final bool isEnabled;

  /// Whether the option is currently selected.
  final bool isSelected;

  /// Callback when the option is tapped.
  final VoidCallback? onTap;

  /// A semantic label for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;

    return TinaPressable(
      color: Colors.blue,
      onPressed: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DesignSpacing.md,
          vertical: DesignSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: _getBackgroundColor(tinaColors),
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: DesignSpacing.sm),
            ],
            Expanded(
              child: child ?? _buildDefaultLabel(context),
            ),
            if (trailing != null) ...[
              const SizedBox(width: DesignSpacing.sm),
              trailing!,
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
  }

  Widget _buildDefaultLabel(BuildContext context) {
    final tinaColors = context.tinaColors;

    return TinaText(
      child: Text(
        value.toString(),
        // TODO(style): check color
        style: TextStyle(
          color: isEnabled
              ? tinaColors.onSurface
              : tinaColors.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }

  Color _getBackgroundColor(TinaColorScheme colors) {
    if (!isEnabled) return Colors.transparent;
    if (isSelected) return colors.primary.withValues(alpha: 0.08);
    return Colors.transparent;
  }
}
