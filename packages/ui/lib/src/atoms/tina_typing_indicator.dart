import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A typing indicator component that shows animated dots.
///
/// This component displays an animated typing indicator typically used to show
/// that the AI is processing or typing a response.
class TinaTypingIndicator extends StatefulWidget {
  /// Creates a Tina typing indicator.
  const TinaTypingIndicator({
    super.key,
    this.size = TinaTypingIndicatorSize.medium,
    this.color,
    this.showContainer = true,
    this.animationDuration = const Duration(milliseconds: 600),
  });

  /// The size of the typing indicator.
  final TinaTypingIndicatorSize size;

  /// The color of the dots. If null, uses the theme's primary color.
  final Color? color;

  /// Whether to show the container background.
  final bool showContainer;

  /// The duration of the animation cycle.
  final Duration animationDuration;

  @override
  State<TinaTypingIndicator> createState() => _TinaTypingIndicatorState();
}

class _TinaTypingIndicatorState extends State<TinaTypingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<double>> _dotAnimations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    // Create staggered animations for each dot
    _dotAnimations = List.generate(3, (index) {
      final begin = index * 0.2; // Stagger by 20% of the animation
      final end = begin + 0.4; // Each dot animates for 40% of the cycle

      return Tween<double>(
        begin: 0.4,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            begin,
            end,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final dotColor = widget.color ?? tinaColors.onSurfaceVariant;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _dotAnimations[index],
          builder: (context, child) {
            return Opacity(
              opacity: _dotAnimations[index].value,
              child: Container(
                width: _getDotSize(),
                height: _getDotSize(),
                margin: EdgeInsets.symmetric(
                  horizontal: _getDotSpacing() / 2,
                ),
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      }),
    );

    if (!widget.showContainer) {
      return Semantics(
        label: 'AI is typing',
        child: content,
      );
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: _getContainerPadding(),
        margin: const EdgeInsets.only(
          left: DesignSpacing.md,
          right: DesignSpacing.xl,
          bottom: DesignSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: tinaColors.surfaceVariant,
          borderRadius: BorderRadius.circular(DesignBorderRadius.lg).copyWith(
            bottomLeft: const Radius.circular(DesignBorderRadius.sm),
          ),
          boxShadow: const [DesignShadows.sm],
        ),
        child: Semantics(
          label: 'AI is typing',
          child: content,
        ),
      ),
    );
  }

  double _getDotSize() {
    return switch (widget.size) {
      TinaTypingIndicatorSize.small => 4.0,
      TinaTypingIndicatorSize.medium => 6.0,
      TinaTypingIndicatorSize.large => 8.0,
    };
  }

  double _getDotSpacing() {
    return switch (widget.size) {
      TinaTypingIndicatorSize.small => 4.0,
      TinaTypingIndicatorSize.medium => 6.0,
      TinaTypingIndicatorSize.large => 8.0,
    };
  }

  EdgeInsets _getContainerPadding() {
    return switch (widget.size) {
      TinaTypingIndicatorSize.small => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.sm,
        vertical: DesignSpacing.xs,
      ),
      TinaTypingIndicatorSize.medium => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.md,
        vertical: DesignSpacing.sm,
      ),
      TinaTypingIndicatorSize.large => const EdgeInsets.symmetric(
        horizontal: DesignSpacing.lg,
        vertical: DesignSpacing.md,
      ),
    };
  }
}

/// The size of a [TinaTypingIndicator].
enum TinaTypingIndicatorSize {
  /// A small typing indicator.
  small,

  /// A medium typing indicator (default).
  medium,

  /// A large typing indicator.
  large,
}
