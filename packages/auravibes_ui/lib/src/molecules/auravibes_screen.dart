import 'dart:ui';

import 'package:auravibes_ui/ui.dart';
import 'package:flutter/material.dart';

class _AuraScreenScope extends InheritedWidget {
  const _AuraScreenScope({
    required this.hasAppBar,
    required super.child,
  });
  final bool hasAppBar;

  static _AuraScreenScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_AuraScreenScope>();

  @override
  bool updateShouldNotify(_AuraScreenScope oldWidget) =>
      hasAppBar != oldWidget.hasAppBar;
}

/// screen manager
class AuraScreen extends StatelessWidget {
  /// Screan manager
  const AuraScreen({
    required this.child,
    this.allowOverride = false,
    this.appBar,
    this.variant = AuraScreenVariation.aurora,
    this.padding,
    super.key,
  });

  /// chilg
  final Widget child;

  /// app bar
  final Widget? appBar;

  final AuraEdgeInsetsGeometry? padding;

  final AuraScreenVariation variant;

  /// allow override
  final bool allowOverride;
  @override
  Widget build(BuildContext context) {
    final ancestorHasAppBar =
        _AuraScreenScope.maybeOf(context)?.hasAppBar ?? false;

    final showOwnAppBar =
        appBar != null && (!ancestorHasAppBar || allowOverride);

    // If we override, we effectively “become”
    // the app bar owner and hide old ones.
    final scopeHasAppBar = showOwnAppBar || ancestorHasAppBar;

    var container = child;
    if (padding != null) {
      container = AuraPadding(
        padding: padding!,
        child: container,
      );
    }

    final content = Column(
      children: [
        if (scopeHasAppBar) appBar!,
        Expanded(child: container),
      ],
    );

    if (variant == AuraScreenVariation.aurora) {
      return Portal(
        child: _AuraScreenScope(
          hasAppBar: scopeHasAppBar,
          child: Stack(
            children: [
              const _AuroraBackground(),
              content,
            ],
          ),
        ),
      );
    }

    return Portal(
      child: _AuraScreenScope(
        hasAppBar: scopeHasAppBar,
        child: ColoredBox(
          color: context.auraColors.background,
          child: content,
        ),
      ),
    );
  }
}

/// App Barr
class AuraAppBar extends StatelessWidget {
  /// constructor
  const AuraAppBar({super.key, this.title, this.actions, this.footer});

  /// title
  final Widget? title;

  /// acions
  final List<Widget>? actions;

  /// footer of bar
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return Padding(
      padding: const EdgeInsetsGeometry.all(DesignSpacing.sm),
      child: AuraColumn(
        children: [
          AuraRow(
            children: [
              if (canPop)
                AuraPressable(
                  color: context.auraColors.primary,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      DesignBorderRadius.full,
                    ),
                  ),
                  child: const Icon(
                    Icons.chevron_left_rounded,
                    size: 40,
                  ),
                ),
              AuraText(
                style: AuraTextStyle.heading3,
                child: Expanded(
                  child: Center(child: title ?? Container()),
                ),
              ),
              if (actions != null && actions!.isNotEmpty) ...actions!,
            ],
          ),
          ?footer,
        ],
      ),
    );
  }
}

/// screen variation
enum AuraScreenVariation {
  /// standard
  standard,

  /// aurora
  aurora,
}

class _AuroraBackground extends StatelessWidget {
  const _AuroraBackground();

  @override
  Widget build(BuildContext context) {
    final colors = context.auraColors;
    return Stack(
      children: [
        // Base color
        Container(color: colors.background),
        // Blob 1 (Top Left - Primary)
        Positioned(
          top: -100,
          left: -100,
          child: _Blob(
            color: colors.primary.withAlpha(102),
            size: 400,
          ),
        ),
        // Blob 2 (Center Right - Secondary)
        Positioned(
          top: 200,
          right: -100,
          child: _Blob(
            color: colors.secondary.withAlpha(102),
            size: 300,
          ),
        ),
        // Blob 3 (Bottom Left - Primary/Accent)
        Positioned(
          bottom: -50,
          left: -50,
          child: _Blob(
            color: colors.primary.withAlpha(76),
            size: 350,
          ),
        ),
        // Blur Mesh
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withAlpha(0)],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }
}
