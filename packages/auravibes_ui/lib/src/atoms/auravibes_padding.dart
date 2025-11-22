import 'package:auravibes_ui/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';

/// definition of aura paddings
class AuraEdgeInsetsGeometry {
  /// constructor for each side
  const AuraEdgeInsetsGeometry.only({
    this.left = .none,
    this.top = .none,
    this.right = .none,
    this.bottom = .none,
  });

  /// constructor for all same padding
  const AuraEdgeInsetsGeometry.all(AuraSpacing spacing)
    : left = spacing,
      top = spacing,
      right = spacing,
      bottom = spacing;

  /// none spacing
  static const none = AuraEdgeInsetsGeometry.all(.none);

  /// base spacing
  static const base = AuraEdgeInsetsGeometry.all(.base);

  /// left padding
  final AuraSpacing left;

  /// top padding
  final AuraSpacing top;

  /// right padding
  final AuraSpacing right;

  /// bottom padding
  final AuraSpacing bottom;

  EdgeInsetsGeometry _padding(BuildContext context) {
    return EdgeInsetsGeometry.only(
      bottom: context.auraTheme.fromSpacing(bottom),
      left: context.auraTheme.fromSpacing(left),
      top: context.auraTheme.fromSpacing(top),
      right: context.auraTheme.fromSpacing(right),
    );
  }
}

/// Padding for const
class AuraPadding extends StatelessWidget {
  /// default constructor
  const AuraPadding({
    required this.child,
    this.padding = .base,
    super.key,
  });

  /// pading chilg
  final Widget? child;

  /// spacing for padding
  final AuraEdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding._padding(context),
      child: child,
    );
  }
}
