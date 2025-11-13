import 'dart:async';

import 'package:auravibes_ui/src/tokens/auravibes_theme.dart';
import 'package:auravibes_ui/src/tokens/design_tokens.dart';
import 'package:flutter/material.dart';

/// A customizable loading spinner component following the Aura design system.
///
/// This spinner widget provides consistent loading indicators with different
/// sizes and styles across the application.
class AuraSpinner extends StatelessWidget {
  /// Creates a Aura spinner.
  const AuraSpinner({
    super.key,
    this.size = AuraSpinnerSize.medium,
    this.color,
    this.strokeWidth,
    this.semanticLabel,
  });

  /// The size of the spinner.
  final AuraSpinnerSize size;

  /// The color of the spinner. If null, uses the primary color.
  final Color? color;

  /// The width of the spinner stroke. If null, uses a default based on size.
  final double? strokeWidth;

  /// A semantic label for the spinner for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final auraColors = context.auraColors;
    final spinnerSize = _getSpinnerSize();
    final spinnerColor = color ?? auraColors.primary;
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
      AuraSpinnerSize.extraSmall => 12.0,
      AuraSpinnerSize.small => 16.0,
      AuraSpinnerSize.medium => 24.0,
      AuraSpinnerSize.large => 32.0,
      AuraSpinnerSize.extraLarge => 48.0,
    };
  }

  double _getDefaultStrokeWidth() {
    return switch (size) {
      AuraSpinnerSize.extraSmall => 1.5,
      AuraSpinnerSize.small => 2.0,
      AuraSpinnerSize.medium => 2.5,
      AuraSpinnerSize.large => 3.0,
      AuraSpinnerSize.extraLarge => 4.0,
    };
  }
}

/// A specialized spinner component with a label.
///
/// This provides a consistent way to show loading states with descriptive text.
class AuraSpinnerWithLabel extends StatelessWidget {
  /// Creates a Aura spinner with label.
  const AuraSpinnerWithLabel({
    required this.label,
    super.key,
    this.size = AuraSpinnerSize.medium,
    this.color,
    this.strokeWidth,
    this.spacing = DesignSpacing.sm,
    this.direction = Axis.vertical,
    this.semanticLabel,
  });

  /// The label text to display with the spinner.
  final String label;

  /// The size of the spinner.
  final AuraSpinnerSize size;

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
    final auraColors = context.auraColors;
    final spinner = AuraSpinner(
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
        color: auraColors.onSurfaceVariant,
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
      AuraSpinnerSize.extraSmall => DesignTypography.fontSizeXs,
      AuraSpinnerSize.small => DesignTypography.fontSizeSm,
      AuraSpinnerSize.medium => DesignTypography.fontSizeBase,
      AuraSpinnerSize.large => DesignTypography.fontSizeLg,
      AuraSpinnerSize.extraLarge => DesignTypography.fontSizeXl,
    };
  }
}

/// A specialized full-screen loading overlay component.
///
/// This provides a consistent way to show loading states that cover the entire
/// screen.
class AuraLoadingOverlay extends StatelessWidget {
  /// Creates a Aura loading overlay.
  const AuraLoadingOverlay({
    super.key,
    this.isLoading = true,
    this.child,
    this.message,
    this.backgroundColor,
    this.spinnerSize = AuraSpinnerSize.large,
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
  final AuraSpinnerSize spinnerSize;

  /// The color of the loading spinner.
  final Color? spinnerColor;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child ?? const SizedBox.shrink();
    }

    final auraColors = context.auraColors;
    final overlay = ColoredBox(
      color: backgroundColor ?? auraColors.scrim,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(DesignSpacing.xl),
          decoration: BoxDecoration(
            color: auraColors.surface,
            borderRadius: BorderRadius.circular(DesignBorderRadius.lg),
            boxShadow: const [DesignShadows.lg],
          ),
          child: message != null
              ? AuraSpinnerWithLabel(
                  label: message!,
                  size: spinnerSize,
                  color: spinnerColor,
                  spacing: DesignSpacing.md,
                )
              : AuraSpinner(
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
class AuraInlineSpinner extends StatelessWidget {
  /// Creates a Aura inline spinner.
  const AuraInlineSpinner({
    super.key,
    this.size = AuraSpinnerSize.small,
    this.color,
    this.strokeWidth,
    this.semanticLabel,
  });

  /// The size of the spinner.
  final AuraSpinnerSize size;

  /// The color of the spinner. If null, uses the current text color.
  final Color? color;

  /// The width of the spinner stroke. If null, uses a default based on size.
  final double? strokeWidth;

  /// A semantic label for the spinner for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return AuraSpinner(
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
class AuraDotsSpinner extends StatefulWidget {
  /// Creates a Aura dots spinner.
  const AuraDotsSpinner({
    super.key,
    this.size = AuraSpinnerSize.medium,
    this.color,
    this.dotCount = 3,
    this.semanticLabel,
  });

  /// The size of the dots.
  final AuraSpinnerSize size;

  /// The color of the dots. If null, uses the primary color.
  final Color? color;

  /// The number of dots to display.
  final int dotCount;

  /// A semantic label for the spinner for accessibility.
  final String? semanticLabel;

  @override
  State<AuraDotsSpinner> createState() => _AuraDotsSpinnerState();
}

class _AuraDotsSpinnerState extends State<AuraDotsSpinner>
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
          unawaited(_controllers[i].repeat(reverse: true));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dotSize = _getDotSize();
    final auraColors = context.auraColors;
    final dotColor = widget.color ?? auraColors.primary;

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
      AuraSpinnerSize.extraSmall => 4.0,
      AuraSpinnerSize.small => 6.0,
      AuraSpinnerSize.medium => 8.0,
      AuraSpinnerSize.large => 12.0,
      AuraSpinnerSize.extraLarge => 16.0,
    };
  }
}

/// The size of a [AuraSpinner].
enum AuraSpinnerSize {
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
