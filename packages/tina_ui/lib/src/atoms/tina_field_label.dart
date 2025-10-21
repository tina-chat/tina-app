import 'package:flutter/material.dart';
import 'package:tina_ui/src/atoms/tina_text.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

/// A customizable field label component following the Tina design system.
///
/// This label provides consistent typography and styling for field titles
/// with optional required field indicators.
class TinaFieldLabel extends StatelessWidget {
  /// Creates a Tina field label.
  const TinaFieldLabel({
    required this.child,
    super.key,
    this.isRequired = false,
    this.style,
    this.semanticLabel,
  });

  /// The label text to display.
  final Widget child;

  /// Whether the field is required.
  final bool isRequired;

  /// Optional text style to override the default.
  final TinaTextStyle? style;

  /// A semantic label for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: TinaText(
            style: style ?? TinaTextStyle.bodySmall,
            color: TinaTextColor.onSurface,
            child: Semantics(
              label: semanticLabel,
              child: DefaultTextStyle.merge(
                style: const TextStyle(
                  fontWeight: DesignTypography.fontWeightMedium,
                ),
                child: child,
              ),
            ),
          ),
        ),
        if (isRequired) ...[
          const SizedBox(width: DesignSpacing.xs),
          TinaText(
            style: style ?? TinaTextStyle.bodySmall,
            color: TinaTextColor.error,
            child: const Text(
              '*',
              semanticsLabel: 'required',
              style: TextStyle(
                fontWeight: DesignTypography.fontWeightMedium,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
