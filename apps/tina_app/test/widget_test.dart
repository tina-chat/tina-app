import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tina_app/main.dart';

void main() {
  testWidgets('Tina sidebar smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app loads with TINA branding
    expect(find.text('TINA'), findsWidgets);

    // Verify navigation items are present
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Chats'), findsOneWidget);
    expect(find.text('Tools'), findsOneWidget);
    expect(find.text('Models'), findsOneWidget);
    expect(find.text('Agents'), findsOneWidget);
    expect(find.text('Prompts'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('Tina sidebar responsive test', (WidgetTester tester) async {
    // Test mobile layout by setting small screen size first
    await tester.binding.setSurfaceSize(const Size(400, 800));

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Should find TINA text somewhere in the app
    expect(find.text('TINA'), findsWidgets);

    // Test desktop layout by setting large screen size
    await tester.binding.setSurfaceSize(const Size(1200, 800));
    await tester.pump();
    await tester.pumpAndSettle();

    // Should still find TINA text in sidebar
    expect(find.text('TINA'), findsWidgets);
  });
}
