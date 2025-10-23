import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// Pessable implementation of tina
class TinaPressable extends StatefulWidget {
  /// constructor
  const TinaPressable({
    required this.child,
    required this.color,
    super.key,
    this.decoration,
    this.onPressed,
    this.onLongPress,
    this.padding,
    this.clipBehavior = Clip.hardEdge,
  });

  /// child
  final Widget child;

  /// color
  final Color color;

  /// decoration
  final Decoration? decoration;

  /// onPressed
  final void Function()? onPressed;

  /// onLongPress
  final void Function()? onLongPress;

  /// padding
  final EdgeInsetsGeometry? padding;

  /// clipBehavior
  final Clip? clipBehavior;

  @override
  TinaPressableState createState() => TinaPressableState();
}

/// TinaPressableState
class TinaPressableState extends State<TinaPressable> {
  // Our state
  bool _hovering = false;
  final bool _pressed = false;
  bool _pressDown = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onPressed() {
    setState(() => _pressDown = true);
  }

  void _onExitPressed() {
    setState(() => _pressDown = false);
  }

  void _onHover() {
    setState(() => _hovering = true);
  }

  void _onExitHover() {
    setState(() => _hovering = false);
  }

  @override
  Widget build(BuildContext context) {
    final tinaTheme = context.tinaTheme;
    final selectedColor = widget.color;
    final canChangeColor = (widget.onPressed != null);
    final pressed = (_pressDown || _pressed) && canChangeColor;
    final hovered = _hovering && canChangeColor;

    final alphaHover = selectedColor.a / 2;
    final alphaNorPressed = hovered ? alphaHover : 0.0;

    final alpha = pressed ? (selectedColor.a) : alphaNorPressed;
    if (widget.onPressed == null) {
      return Container(
        padding: widget.padding ?? EdgeInsets.zero,
        decoration: widget.decoration,
        clipBehavior: widget.decoration == null
            ? Clip.none
            : widget.clipBehavior ?? Clip.none,
        child: widget.child,
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onPressed,
      onLongPress: widget.onLongPress,
      onTapDown: (_) => _onPressed(),
      onTapUp: (_) {
        _timer?.cancel();
        _timer = Timer(
          tinaTheme.animation.normal,
          _onExitPressed,
        );
      },
      onTapCancel: _onExitPressed,
      child: Container(
        decoration: widget.decoration,
        clipBehavior: widget.decoration == null
            ? Clip.none
            : widget.clipBehavior ?? Clip.none,
        child: AnimatedContainer(
          duration: tinaTheme.animation.normal,
          color: selectedColor.withValues(alpha: alpha),
          child: MouseRegion(
            onEnter: (details) => _onHover(),
            onExit: (details) => _onExitHover(),
            cursor: canChangeColor
                ? SystemMouseCursors.click
                : MouseCursor.defer,
            child: Listener(
              child: Padding(
                padding: widget.padding ?? EdgeInsets.zero,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
