import 'package:flutter/material.dart';
import '../tokens/design_tokens.dart';
import 'tina_text.dart';

/// A customizable divider component following the Tina design system.
///
/// This divider widget provides consistent visual separation between
/// content sections with support for labels and different orientations.
class TinaDivider extends StatelessWidget {
  /// Creates a horizontal Tina divider.
  const TinaDivider({
    super.key,
    this.height,
    this.thickness,
    this.color,
    this.indent = 0,
    this.endIndent = 0,
  })  : orientation = TinaDividerOrientation.horizontal,
        width = null,
        label = null;

  /// Creates a vertical Tina divider.
  const TinaDivider.vertical({
    super.key,
    this.width,
    this.thickness,
    this.color,
    this.indent = 0,
    this.endIndent = 0,
  })  : orientation = TinaDividerOrientation.vertical,
        height = null,
        label = null;

  /// Creates a horizontal Tina divider with a label.
  const TinaDivider.withLabel({
    required this.label,
    super.key,
    this.height,
    this.thickness,
    this.color,
    this.indent = 0,
    this.endIndent = 0,
  })  : orientation = TinaDividerOrientation.horizontal,
        width = null;

  /// The orientation of the divider.
  final TinaDividerOrientation orientation;

  /// The height of a horizontal divider or the width of a vertical divider.
  final double? height;

  /// The width of a vertical divider or the height of a horizontal divider.
  final double? width;

  /// The thickness of the divider line.
  final double? thickness;

  /// The color of the divider line.
  final Color? color;

  /// The amount of empty space to the leading edge of the divider.
  final double indent;

  /// The amount of empty space to the trailing edge of the divider.
  final double endIndent;

  /// Optional label to display in the center of the divider.
  final String? label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = color ?? _getDefaultColor(theme);
    final dividerThickness = thickness ?? DesignBorderWidth.thin;

    if (label != null) {
      return _buildLabeledDivider(dividerColor, dividerThickness);
    }

    if (orientation == TinaDividerOrientation.vertical) {
      return _buildVerticalDivider(dividerColor, dividerThickness);
    }

    return _buildHorizontalDivider(dividerColor, dividerThickness);
  }

  Widget _buildHorizontalDivider(Color dividerColor, double dividerThickness) {
    return Container(
      height: height ?? DesignSpacing.md,
      margin: EdgeInsets.only(
        left: indent,
        right: endIndent,
      ),
      child: Center(
        child: Container(
          height: dividerThickness,
          color: dividerColor,
        ),
      ),
    );
  }

  Widget _buildVerticalDivider(Color dividerColor, double dividerThickness) {
    return Container(
      width: width ?? DesignSpacing.md,
      margin: EdgeInsets.only(
        top: indent,
        bottom: endIndent,
      ),
      child: Center(
        child: Container(
          width: dividerThickness,
          color: dividerColor,
        ),
      ),
    );
  }

  Widget _buildLabeledDivider(Color dividerColor, double dividerThickness) {
    return Container(
      height: height ?? DesignSpacing.xl,
      margin: EdgeInsets.only(
        left: indent,
        right: endIndent,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: dividerThickness,
              color: dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSpacing.md,
            ),
            child: TinaText(
              label!,
              style: TinaTextStyle.caption,
              color: DesignColors.neutral500,
            ),
          ),
          Expanded(
            child: Container(
              height: dividerThickness,
              color: dividerColor,
            ),
          ),
        ],
      ),
    );
  }

  Color _getDefaultColor(ThemeData theme) {
    return theme.brightness == Brightness.dark
        ? DesignColors.neutral700
        : DesignColors.neutral200;
  }
}

/// A specialized divider component for use in lists.
///
/// This provides consistent spacing and styling for list item separators.
class TinaListDivider extends StatelessWidget {
  /// Creates a Tina list divider.
  const TinaListDivider({
    super.key,
    this.thickness,
    this.color,
    this.indent = DesignSpacing.md,
    this.endIndent = DesignSpacing.md,
  });

  /// The thickness of the divider line.
  final double? thickness;

  /// The color of the divider line.
  final Color? color;

  /// The amount of empty space to the leading edge of the divider.
  final double indent;

  /// The amount of empty space to the trailing edge of the divider.
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return TinaDivider(
      height: 1,
      thickness: thickness ?? 0.5,
      color: color,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

/// A specialized divider component for sections.
///
/// This provides more prominent visual separation for major content sections.
class TinaSectionDivider extends StatelessWidget {
  /// Creates a Tina section divider.
  const TinaSectionDivider({
    super.key,
    this.label,
    this.thickness,
    this.color,
    this.spacing = DesignSpacing.xl,
  });

  /// Optional label to display in the center of the divider.
  final String? label;

  /// The thickness of the divider line.
  final double? thickness;

  /// The color of the divider line.
  final Color? color;

  /// The vertical spacing around the divider.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    Widget divider = label != null
        ? TinaDivider.withLabel(
            label: label!,
            height: spacing,
            thickness: thickness ?? DesignBorderWidth.medium,
            color: color,
          )
        : TinaDivider(
            height: spacing,
            thickness: thickness ?? DesignBorderWidth.medium,
            color: color,
          );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing / 2),
      child: divider,
    );
  }
}

/// The orientation of a [TinaDivider].
enum TinaDividerOrientation {
  /// Horizontal divider.
  horizontal,

  /// Vertical divider.
  vertical,
}