import 'package:flutter/material.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';
import 'package:tina_ui/src/tokens/tina_theme.dart';

/// A customizable loading spinner component following the Tina design system.
///
/// This spinner widget provides consistent loading indicators with different
/// sizes and styles across the application.
class TinaSpinner extends StatelessWidget {
  /// Creates a Tina spinner.
  const TinaSpinner({
    super.key,
    this.size = TinaSpinnerSize.medium,
    this.color,
    this.strokeWidth,
    this.semanticLabel,
  });

  /// The size of the spinner.
  final TinaSpinnerSize size;

  /// The color of the spinner. If null, uses the primary color.
  final Color? color;

  /// The width of the spinner stroke. If null, uses a default based on size.
  final double? strokeWidth;

  /// A semantic label for the spinner for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final spinnerSize = _getSpinnerSize();
    final spinnerColor = color ?? tinaColors.primary;
    final spinnerStrokeWidth = strokeWidth ?? _getDefaultStrokeWidth();

    final Widget spinner = SizedBox(
      width: spinnerSize,
      height: spinnerSize,
      child: CircularProgressIndicator(
        color: spinnerColor,
        strokeWidth: spinnerStrokeWidth,
        semanticsLabel: semanticLabel ?? 'Loading',
      ),
    );

    return spinner;
  }

  double _getSpinnerSize() {
    return switch (size) {
      TinaSpinnerSize.extraSmall => 12.0,
      TinaSpinnerSize.small => 16.0,
      TinaSpinnerSize.medium => 24.0,
      TinaSpinnerSize.large => 32.0,
      TinaSpinnerSize.extraLarge => 48.0,
    };
  }

  double _getDefaultStrokeWidth() {
    return switch (size) {
      TinaSpinnerSize.extraSmall => 1.5,
      TinaSpinnerSize.small => 2.0,
      TinaSpinnerSize.medium => 2.5,
      TinaSpinnerSize.large => 3.0,
      TinaSpinnerSize.extraLarge => 4.0,
    };
  }
}

/// A specialized spinner component with a label.
///
/// This provides a consistent way to show loading states with descriptive text.
class TinaSpinnerWithLabel extends StatelessWidget {
  /// Creates a Tina spinner with label.
  const TinaSpinnerWithLabel({
    required this.label,
    super.key,
    this.size = TinaSpinnerSize.medium,
    this.color,
    this.strokeWidth,
    this.spacing = DesignSpacing.sm,
    this.direction = Axis.vertical,
    this.semanticLabel,
  });

  /// The label text to display with the spinner.
  final String label;

  /// The size of the spinner.
  final TinaSpinnerSize size;

  /// The color of the spinner. If null, uses the primary color.
  final Color? color;

  /// The width of the spinner stroke. If null, uses a default based on size.
  final double? strokeWidth;

  /// The spacing between the spinner and label.
  final double spacing;

  /// The direction to layout the spinner and label.
  final Axis direction;

  /// A semantic label for the spinner for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tinaColors = context.tinaColors;
    final spinner = TinaSpinner(
      size: size,
      color: color,
      strokeWidth: strokeWidth,
      semanticLabel: semanticLabel,
    );

    final labelWidget = Text(
      label,
      style: TextStyle(
        fontFamily: DesignTypography.bodyFontFamily,
        fontSize: _getLabelFontSize(),
        fontWeight: DesignTypography.fontWeightRegular,
        color: tinaColors.onSurfaceVariant,
      ),
      textAlign: TextAlign.center,
    );

    if (direction == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          spinner,
          SizedBox(width: spacing),
          labelWidget,
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        spinner,
        SizedBox(height: spacing),
        labelWidget,
      ],
    );
  }

  double _getLabelFontSize() {
    return switch (size) {
      TinaSpinnerSize.extraSmall => DesignTypography.fontSizeXs,
      TinaSpinnerSize.small => DesignTypography.fontSizeSm,
      TinaSpinnerSize.medium => DesignTypography.fontSizeBase,
      TinaSpinnerSize.large => DesignTypography.fontSizeLg,
      TinaSpinnerSize.extraLarge => DesignTypography.fontSizeXl,
    };
  }
}

/// A specialized full-screen loading overlay component.
///
/// This provides a consistent way to show loading states that cover the entire
/// screen.
class TinaLoadingOverlay extends StatelessWidget {
  /// Creates a Tina loading overlay.
  const TinaLoadingOverlay({
    super.key,
    this.isLoading = true,
    this.child,
    this.message,
    this.backgroundColor,
    this.spinnerSize = TinaSpinnerSize.large,
    this.spinnerColor,
  });

  /// Whether the loading overlay is visible.
  final bool isLoading;

  /// The widget to display behind the loading overlay.
  final Widget? child;

  /// Optional message to display with the spinner.
  final String? message;

  /// The background color of the overlay.
  final Color? backgroundColor;

  /// The size of the loading spinner.
  final TinaSpinnerSize spinnerSize;

  /// The color of the loading spinner.
  final Color? spinnerColor;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child ?? const SizedBox.shrink();
    }

    final tinaColors = context.tinaColors;
    final overlay = ColoredBox(
      color: backgroundColor ?? tinaColors.scrim,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(DesignSpacing.xl),
          decoration: BoxDecoration(
            color: tinaColors.surface,
            borderRadius: BorderRadius.circular(DesignBorderRadius.lg),
            boxShadow: const [DesignShadows.lg],
          ),
          child: message != null
              ? TinaSpinnerWithLabel(
                  label: message!,
                  size: spinnerSize,
                  color: spinnerColor,
                  spacing: DesignSpacing.md,
                )
              : TinaSpinner(
                  size: spinnerSize,
                  color: spinnerColor,
                ),
        ),
      ),
    );

    if (child != null) {
      return Stack(
        children: [
          child!,
          if (isLoading) overlay,
        ],
      );
    }

    return overlay;
  }
}

/// A specialized inline loading component for buttons and small spaces.
///
/// This provides a consistent way to show loading states within other
/// components.
class TinaInlineSpinner extends StatelessWidget {
  /// Creates a Tina inline spinner.
  const TinaInlineSpinner({
    super.key,
    this.size = TinaSpinnerSize.small,
    this.color,
    this.strokeWidth,
    this.semanticLabel,
  });

  /// The size of the spinner.
  final TinaSpinnerSize size;

  /// The color of the spinner. If null, uses the current text color.
  final Color? color;

  /// The width of the spinner stroke. If null, uses a default based on size.
  final double? strokeWidth;

  /// A semantic label for the spinner for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return TinaSpinner(
      size: size,
      color: color ?? DefaultTextStyle.of(context).style.color,
      strokeWidth: strokeWidth,
      semanticLabel: semanticLabel,
    );
  }
}

/// A specialized dots loading animation component.
///
/// This provides an alternative loading indicator using animated dots.
class TinaDotsSpinner extends StatefulWidget {
  /// Creates a Tina dots spinner.
  const TinaDotsSpinner({
    super.key,
    this.size = TinaSpinnerSize.medium,
    this.color,
    this.dotCount = 3,
    this.semanticLabel,
  });

  /// The size of the dots.
  final TinaSpinnerSize size;

  /// The color of the dots. If null, uses the primary color.
  final Color? color;

  /// The number of dots to display.
  final int dotCount;

  /// A semantic label for the spinner for accessibility.
  final String? semanticLabel;

  @override
  State<TinaDotsSpinner> createState() => _TinaDotsSpinnerState();
}

class _TinaDotsSpinnerState extends State<TinaDotsSpinner>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.dotCount,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0.4, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    _startAnimations();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startAnimations() {
    for (var i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          _controllers[i].repeat(reverse: true);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dotSize = _getDotSize();
    final tinaColors = context.tinaColors;
    final dotColor = widget.color ?? tinaColors.primary;

    return Semantics(
      label: widget.semanticLabel ?? 'Loading',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.dotCount, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return Container(
                width: dotSize,
                height: dotSize,
                margin: EdgeInsets.symmetric(
                  horizontal: dotSize * 0.2,
                ),
                decoration: BoxDecoration(
                  color: dotColor.withValues(alpha: _animations[index].value),
                  shape: BoxShape.circle,
                ),
              );
            },
          );
        }),
      ),
    );
  }

  double _getDotSize() {
    return switch (widget.size) {
      TinaSpinnerSize.extraSmall => 4.0,
      TinaSpinnerSize.small => 6.0,
      TinaSpinnerSize.medium => 8.0,
      TinaSpinnerSize.large => 12.0,
      TinaSpinnerSize.extraLarge => 16.0,
    };
  }
}

/// The size of a [TinaSpinner].
enum TinaSpinnerSize {
  /// Extra small spinner (12px).
  extraSmall,

  /// Small spinner (16px).
  small,

  /// Medium spinner (24px) - default.
  medium,

  /// Large spinner (32px).
  large,

  /// Extra large spinner (48px).
  extraLarge,
}
