import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';

/// A customizable field hint component following the Tina design system.
///
/// This hint provides helper text and error messages with consistent
/// typography and styling for field descriptions.
class TinaFieldHint extends StatelessWidget {
  /// Creates a Tina field hint.
  const TinaFieldHint({
    super.key,
    this.text,
    this.error,
    this.style,
    this.errorStyle,
    this.semanticLabel,
  });

  /// The hint text to display (shown when there's no error).
  final Widget? text;

  /// The error text to display (takes precedence over hint text).
  final Widget? error;

  /// Optional text style to override the default hint style.
  final TinaTextStyle? style;

  /// Optional text style to override the default error style.
  final TinaTextStyle? errorStyle;

  /// A semantic label for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    // final tinaColors = context.tinaColors;
    final displayText = error ?? text;

    if (displayText == null) return const SizedBox.shrink();

    final isError = error != null;
    final color = isError
        ? TinaTextColor.error
        : TinaTextColor.onSurfaceVariant;
    final textStyle = isError
        ? (errorStyle ?? TinaTextStyle.caption)
        : (style ?? TinaTextStyle.caption);

    return TinaText(
      style: textStyle,
      color: color,
      child: Semantics(
        label: semanticLabel,
        child: displayText,
      ),
    );
  }
}
