import 'package:flutter/widgets.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

/// Contextual Column management
class TinaColumn extends StatelessWidget {
  /// creates tina column
  const TinaColumn({
    required this.children,
    this.spacing = TinaSpacing.base,
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
  final TinaSpacing spacing;
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
class TinaRow extends StatelessWidget {
  /// creates tina row
  const TinaRow({
    required this.children,
    this.spacing = TinaSpacing.base,
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
  final TinaSpacing spacing;

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

double _getSpacing(TinaSpacing spacing) {
  return switch (spacing) {
    TinaSpacing.none => 0,
    TinaSpacing.base => DesignSpacing.base,
    TinaSpacing.xs => DesignSpacing.xs,
    TinaSpacing.sm => DesignSpacing.sm,
    TinaSpacing.md => DesignSpacing.md,
    TinaSpacing.lg => DesignSpacing.lg,
    TinaSpacing.xl => DesignSpacing.xl,
    TinaSpacing.xl2 => DesignSpacing.xl2,
    TinaSpacing.xl3 => DesignSpacing.xl3,
  };
}

/// define spacing on components
enum TinaSpacing {
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
