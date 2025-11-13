import 'package:auravibes_ui/src/tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// Contextual Column management
class AuraColumn extends StatelessWidget {
  /// creates auravibes column
  const AuraColumn({
    required this.children,
    this.spacing = AuraSpacing.base,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  /// Flex children
  final List<Widget> children;

  /// crossAxisAlignment
  final CrossAxisAlignment crossAxisAlignment;

  /// mainAxisSize
  final MainAxisSize mainAxisSize;

  /// mainAxisAlignment
  final MainAxisAlignment mainAxisAlignment;

  /// Enum representing different spacing options for layout components
  final AuraSpacing spacing;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      spacing: _getSpacing(spacing),
      children: children,
    );
  }
}

/// Contextual Row management
class AuraRow extends StatelessWidget {
  /// creates auravibes row
  const AuraRow({
    required this.children,
    this.spacing = AuraSpacing.base,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  /// Flex children
  final List<Widget> children;

  /// crossAxisAlignment
  final CrossAxisAlignment crossAxisAlignment;

  /// mainAxisSize
  final MainAxisSize mainAxisSize;

  /// mainAxisAlignment
  final MainAxisAlignment mainAxisAlignment;

  /// Enum representing different spacing options for layout components
  final AuraSpacing spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      spacing: _getSpacing(spacing),
      children: children,
    );
  }
}

double _getSpacing(AuraSpacing spacing) {
  return switch (spacing) {
    AuraSpacing.none => 0,
    AuraSpacing.base => DesignSpacing.base,
    AuraSpacing.xs => DesignSpacing.xs,
    AuraSpacing.sm => DesignSpacing.sm,
    AuraSpacing.md => DesignSpacing.md,
    AuraSpacing.lg => DesignSpacing.lg,
    AuraSpacing.xl => DesignSpacing.xl,
    AuraSpacing.xl2 => DesignSpacing.xl2,
    AuraSpacing.xl3 => DesignSpacing.xl3,
  };
}

/// define spacing on components
enum AuraSpacing {
  /// no spacing
  none,

  /// common spacing
  base,

  /// extra small spacing
  xs,

  /// small spacing
  sm,

  /// medium spacing
  md,

  /// large spacing
  lg,

  /// extra large spacing
  xl,

  /// 2x extra large spacing
  xl2,

  /// 3x extra large spacing
  xl3,
}
