import 'package:auravibes_ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_workspace/knobs/selector.dart';

extension AuraPaddingKnobBuilder on KnobsBuilder {
  AuraEdgeInsetsGeometry padding({
    String label = 'Padding',
    AuraEdgeInsetsGeometry? initialValue,
  }) => selector<AuraEdgeInsetsGeometry>(
    label: label,
    selectors: [
      const .new(value: .none, label: 'none'),
      const .new(value: .small, label: 'Small'),
      const .new(value: .medium, label: 'Medium'),
      const .new(value: .large, label: 'Large'),
    ],
    initialValue: initialValue,
  );
}
