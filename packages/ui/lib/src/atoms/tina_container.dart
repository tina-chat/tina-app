import 'package:flutter/material.dart';

import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable layout container component following the Tina design system.
///
/// This container provides consistent padding, margin, background colors,
/// border radius, and shadow options for layout organization.
class TinaContainer extends StatelessWidget {
  /// Creates a Tina container.
  const TinaContainer({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.shadow = TinaContainerShadow.none,
    this.border,
    this.width,
    this.height,
    this.alignment,
    this.semanticLabel,
  });

  /// Creates a Tina container with content padding.
  const TinaContainer.content({
    required this.child,
    super.key,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.shadow = TinaContainerShadow.none,
    this.border,
    this.width,
    this.height,
    this.alignment,
    this.semanticLabel,
  }) : padding = const EdgeInsets.all(DesignSpacing.contentPadding);

  /// Creates a Tina container with component spacing.
  const TinaContainer.component({
    required this.child,
    super.key,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.shadow = TinaContainerShadow.none,
    this.border,
    this.width,
    this.height,
    this.alignment,
    this.semanticLabel,
  }) : padding = const EdgeInsets.all(DesignSpacing.componentSpacing);

  /// Creates a Tina container with section spacing.
  const TinaContainer.section({
    required this.child,
    super.key,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.shadow = TinaContainerShadow.none,
    this.border,
    this.width,
    this.height,
    this.alignment,
    this.semanticLabel,
  }) : padding = const EdgeInsets.all(DesignSpacing.sectionSpacing);

  /// Creates a Tina container with rounded corners.
  const TinaContainer.rounded({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.shadow = TinaContainerShadow.none,
    this.border,
    this.width,
    this.height,
    this.alignment,
    this.semanticLabel,
  }) : borderRadius = DesignBorderRadius.lg;

  /// Creates a Tina container with full rounded corners.
  const TinaContainer.pill({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.shadow = TinaContainerShadow.none,
    this.border,
    this.width,
    this.height,
    this.alignment,
    this.semanticLabel,
  }) : borderRadius = DesignBorderRadius.full;

  /// The widget to display inside the container.
  final Widget child;

  /// The padding inside the container.
  final EdgeInsetsGeometry? padding;

  /// The margin outside the container.
  final EdgeInsetsGeometry? margin;

  /// The background color of the container.
  final Color? backgroundColor;

  /// The border radius of the container.
  final double? borderRadius;

  /// The shadow variant of the container.
  final TinaContainerShadow shadow;

  /// The border of the container.
  final Border? border;

  /// The width of the container.
  final double? width;

  /// The height of the container.
  final double? height;

  /// The alignment of the child within the container.
  final AlignmentGeometry? alignment;

  /// A semantic label for the container for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tinaTheme = context.tinaTheme;

    Widget container = Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor ?? tinaTheme.colors.surface,
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius!)
            : null,
        border: border,
        boxShadow: _getBoxShadow(),
      ),
      child: child,
    );

    if (semanticLabel != null) {
      container = Semantics(
        label: semanticLabel,
        container: true,
        child: container,
      );
    }

    return container;
  }

  List<BoxShadow> _getBoxShadow() {
    return switch (shadow) {
      TinaContainerShadow.none => [],
      TinaContainerShadow.sm => [DesignShadows.sm],
      TinaContainerShadow.md => [DesignShadows.md],
      TinaContainerShadow.lg => [DesignShadows.lg],
      TinaContainerShadow.xl => [DesignShadows.xl],
      TinaContainerShadow.inner => [DesignShadows.inner],
      TinaContainerShadow.glass => [DesignShadows.glass],
    };
  }
}

/// Predefined padding options for [TinaContainer].
class TinaContainerPadding {
  TinaContainerPadding._();

  /// Extra small padding.
  static const EdgeInsets xs = EdgeInsets.all(DesignSpacing.xs);

  /// Small padding.
  static const EdgeInsets sm = EdgeInsets.all(DesignSpacing.sm);

  /// Medium padding.
  static const EdgeInsets md = EdgeInsets.all(DesignSpacing.md);

  /// Large padding.
  static const EdgeInsets lg = EdgeInsets.all(DesignSpacing.lg);

  /// Extra large padding.
  static const EdgeInsets xl = EdgeInsets.all(DesignSpacing.xl);

  /// 2x extra large padding.
  static const EdgeInsets xl2 = EdgeInsets.all(DesignSpacing.xl2);

  /// 3x extra large padding.
  static const EdgeInsets xl3 = EdgeInsets.all(DesignSpacing.xl3);

  /// Horizontal extra small padding.
  static const EdgeInsets horizontalXs = EdgeInsets.symmetric(
    horizontal: DesignSpacing.xs,
  );

  /// Horizontal small padding.
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(
    horizontal: DesignSpacing.sm,
  );

  /// Horizontal medium padding.
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(
    horizontal: DesignSpacing.md,
  );

  /// Horizontal large padding.
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(
    horizontal: DesignSpacing.lg,
  );

  /// Horizontal extra large padding.
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(
    horizontal: DesignSpacing.xl,
  );

  /// Vertical extra small padding.
  static const EdgeInsets verticalXs = EdgeInsets.symmetric(
    vertical: DesignSpacing.xs,
  );

  /// Vertical small padding.
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(
    vertical: DesignSpacing.sm,
  );

  /// Vertical medium padding.
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(
    vertical: DesignSpacing.md,
  );

  /// Vertical large padding.
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(
    vertical: DesignSpacing.lg,
  );

  /// Vertical extra large padding.
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(
    vertical: DesignSpacing.xl,
  );
}

/// Predefined margin options for [TinaContainer].
class TinaContainerMargin {
  TinaContainerMargin._();

  /// Extra small margin.
  static const EdgeInsets xs = EdgeInsets.all(DesignSpacing.xs);

  /// Small margin.
  static const EdgeInsets sm = EdgeInsets.all(DesignSpacing.sm);

  /// Medium margin.
  static const EdgeInsets md = EdgeInsets.all(DesignSpacing.md);

  /// Large margin.
  static const EdgeInsets lg = EdgeInsets.all(DesignSpacing.lg);

  /// Extra large margin.
  static const EdgeInsets xl = EdgeInsets.all(DesignSpacing.xl);

  /// 2x extra large margin.
  static const EdgeInsets xl2 = EdgeInsets.all(DesignSpacing.xl2);

  /// 3x extra large margin.
  static const EdgeInsets xl3 = EdgeInsets.all(DesignSpacing.xl3);

  /// Horizontal extra small margin.
  static const EdgeInsets horizontalXs = EdgeInsets.symmetric(
    horizontal: DesignSpacing.xs,
  );

  /// Horizontal small margin.
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(
    horizontal: DesignSpacing.sm,
  );

  /// Horizontal medium margin.
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(
    horizontal: DesignSpacing.md,
  );

  /// Horizontal large margin.
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(
    horizontal: DesignSpacing.lg,
  );

  /// Horizontal extra large margin.
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(
    horizontal: DesignSpacing.xl,
  );

  /// Vertical extra small margin.
  static const EdgeInsets verticalXs = EdgeInsets.symmetric(
    vertical: DesignSpacing.xs,
  );

  /// Vertical small margin.
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(
    vertical: DesignSpacing.sm,
  );

  /// Vertical medium margin.
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(
    vertical: DesignSpacing.md,
  );

  /// Vertical large margin.
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(
    vertical: DesignSpacing.lg,
  );

  /// Vertical extra large margin.
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(
    vertical: DesignSpacing.xl,
  );
}

/// The shadow variant of a [TinaContainer].
enum TinaContainerShadow {
  /// No shadow.
  none,

  /// Small shadow.
  sm,

  /// Medium shadow.
  md,

  /// Large shadow.
  lg,

  /// Extra large shadow.
  xl,

  /// Inner shadow.
  inner,

  /// Glass morphism shadow.
  glass,
}
