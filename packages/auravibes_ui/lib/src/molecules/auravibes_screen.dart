import 'package:auravibes_ui/src/atoms/auravibes_pressable.dart';
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
    super.key,
  });

  /// chilg
  final Widget child;

  /// app bar
  final Widget? appBar;

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

    return Portal(
      child: _AuraScreenScope(
        hasAppBar: scopeHasAppBar,
        child: ColoredBox(
          color: context.auraColors.background,
          child: Column(
            children: [
              if (scopeHasAppBar) appBar!,
              Expanded(child: child),
            ],
          ),
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
