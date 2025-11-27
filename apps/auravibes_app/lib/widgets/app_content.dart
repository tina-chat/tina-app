import 'package:auravibes_ui/ui.dart';
import 'package:flutter/widgets.dart';

class AppContent extends StatelessWidget {
  const AppContent({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: DesignBreakpoints.sm),
      child: child,
    );
  }
}
