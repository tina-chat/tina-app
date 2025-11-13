import 'package:flutter/material.dart';
import 'package:tina_ui/src/internal/tina_pressable.dart';
import 'package:tina_ui/ui.dart';

class _TinaScreenScope extends InheritedWidget {
  const _TinaScreenScope({
    required this.hasAppBar,
    required super.child,
  });
  final bool hasAppBar;

  static _TinaScreenScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_TinaScreenScope>();

  @override
  bool updateShouldNotify(_TinaScreenScope oldWidget) =>
      hasAppBar != oldWidget.hasAppBar;
}

/// screen manager
class TinaScreen extends StatelessWidget {
  /// Screan manager
  const TinaScreen({
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
        _TinaScreenScope.maybeOf(context)?.hasAppBar ?? false;

    final showOwnAppBar =
        appBar != null && (!ancestorHasAppBar || allowOverride);

    // If we override, we effectively “become”
    // the app bar owner and hide old ones.
    final scopeHasAppBar = showOwnAppBar || ancestorHasAppBar;

    return Portal(
      child: _TinaScreenScope(
        hasAppBar: scopeHasAppBar,
        child: ColoredBox(
          color: context.tinaColors.background,
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
class TinaAppBar extends StatelessWidget {
  /// constructor
  const TinaAppBar({super.key, this.title, this.actions, this.footer});

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
      child: TinaColumn(
        children: [
          TinaRow(
            children: [
              if (canPop)
                TinaPressable(
                  color: context.tinaColors.primary,
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
              TinaText(
                style: TinaTextStyle.heading3,
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
