import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/atoms/tina_divider.dart';
import 'package:ui/src/atoms/tina_text.dart';
import 'package:ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaDivider', () {
    testWidgets('renders horizontal divider correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaDivider(),
          ),
        ),
      );

      expect(find.byType(Container), findsNWidgets(2)); // Outer and inner container
    });

    testWidgets('applies custom height correctly', (tester) async {
      const customHeight = 32.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaDivider(
              height: customHeight,
            ),
          ),
        ),
      );

      final outerContainer = tester.widget<Container>(
        find.byType(Container).first,
      );
      expect(outerContainer.constraints?.maxHeight, customHeight);
    });

    testWidgets('applies custom thickness correctly', (tester) async {
      const customThickness = 4.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaDivider(
              thickness: customThickness,
            ),
          ),
        ),
      );

      final innerContainer = tester.widget<Container>(
        find.byType(Container).last,
      );
      expect(innerContainer.constraints?.maxHeight, customThickness);
    });

    testWidgets('applies custom color correctly', (tester) async {
      const customColor = Colors.red;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaDivider(
              color: customColor,
            ),
          ),
        ),
      );

      final innerContainer = tester.widget<Container>(
        find.byType(Container).last,
      );
      expect(innerContainer.color, customColor);
    });

    testWidgets('applies indent correctly', (tester) async {
      const indent = 16.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaDivider(
              indent: indent,
            ),
          ),
        ),
      );

      final outerContainer = tester.widget<Container>(
        find.byType(Container).first,
      );
      expect(outerContainer.margin, const EdgeInsets.only(left: indent, right: 0));
    });

    testWidgets('applies endIndent correctly', (tester) async {
      const endIndent = 16.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaDivider(
              endIndent: endIndent,
            ),
          ),
        ),
      );

      final outerContainer = tester.widget<Container>(
        find.byType(Container).first,
      );
      expect(outerContainer.margin, const EdgeInsets.only(left: 0, right: endIndent));
    });

    group('TinaDivider.vertical', () {
      testWidgets('renders vertical divider correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaDivider.vertical(),
            ),
          ),
        );

        expect(find.byType(Container), findsNWidgets(2));
      });

      testWidgets('applies custom width correctly', (tester) async {
        const customWidth = 32.0;
        
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaDivider.vertical(
                width: customWidth,
              ),
            ),
          ),
        );

        final outerContainer = tester.widget<Container>(
          find.byType(Container).first,
        );
        expect(outerContainer.constraints?.maxWidth, customWidth);
      });

      testWidgets('applies vertical indent correctly', (tester) async {
        const indent = 16.0;
        
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaDivider.vertical(
                indent: indent,
              ),
            ),
          ),
        );

        final outerContainer = tester.widget<Container>(
          find.byType(Container).first,
        );
        expect(outerContainer.margin, const EdgeInsets.only(top: indent, bottom: 0));
      });
    });

    group('TinaDivider.withLabel', () {
      testWidgets('renders labeled divider correctly', (tester) async {
        const labelText = 'OR';
        
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaDivider.withLabel(
                label: labelText,
              ),
            ),
          ),
        );

        expect(find.text(labelText), findsOneWidget);
        expect(find.byType(TinaText), findsOneWidget);
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(Expanded), findsNWidgets(2)); // Two line segments
      });

      testWidgets('applies custom height to labeled divider', (tester) async {
        const customHeight = 48.0;
        const labelText = 'SECTION';
        
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: TinaDivider.withLabel(
                label: labelText,
                height: customHeight,
              ),
            ),
          ),
        );

        final outerContainer = tester.widget<Container>(
          find.ancestor(
            of: find.byType(Row),
            matching: find.byType(Container),
          ),
        );
        expect(outerContainer.constraints?.maxHeight, customHeight);
      });
    });

    group('TinaDividerOrientation enum', () {
      test('has all expected values', () {
        expect(TinaDividerOrientation.values, hasLength(2));
        expect(TinaDividerOrientation.values, contains(TinaDividerOrientation.horizontal));
        expect(TinaDividerOrientation.values, contains(TinaDividerOrientation.vertical));
      });
    });
  });

  group('TinaListDivider', () {
    testWidgets('renders list divider correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaListDivider(),
          ),
        ),
      );

      expect(find.byType(TinaDivider), findsOneWidget);
    });

    testWidgets('applies default indent and endIndent', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaListDivider(),
          ),
        ),
      );

      final tinaDivider = tester.widget<TinaDivider>(find.byType(TinaDivider));
      expect(tinaDivider.indent, DesignSpacing.md);
      expect(tinaDivider.endIndent, DesignSpacing.md);
    });

    testWidgets('applies custom indent and endIndent', (tester) async {
      const customIndent = 8.0;
      const customEndIndent = 24.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaListDivider(
              indent: customIndent,
              endIndent: customEndIndent,
            ),
          ),
        ),
      );

      final tinaDivider = tester.widget<TinaDivider>(find.byType(TinaDivider));
      expect(tinaDivider.indent, customIndent);
      expect(tinaDivider.endIndent, customEndIndent);
    });

    testWidgets('applies custom thickness', (tester) async {
      const customThickness = 2.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaListDivider(
              thickness: customThickness,
            ),
          ),
        ),
      );

      final tinaDivider = tester.widget<TinaDivider>(find.byType(TinaDivider));
      expect(tinaDivider.thickness, customThickness);
    });
  });

  group('TinaSectionDivider', () {
    testWidgets('renders section divider correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaSectionDivider(),
          ),
        ),
      );

      expect(find.byType(TinaDivider), findsOneWidget);
      // TinaSectionDivider wraps its content in Padding
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
    });

    testWidgets('renders section divider with label correctly', (tester) async {
      const labelText = 'Section Title';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaSectionDivider(
              label: labelText,
            ),
          ),
        ),
      );

      expect(find.text(labelText), findsOneWidget);
      expect(find.byType(TinaDivider), findsOneWidget);
    });

    testWidgets('applies custom spacing', (tester) async {
      const customSpacing = 32.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaSectionDivider(
              spacing: customSpacing,
            ),
          ),
        ),
      );

      // Find the outermost Padding widget from TinaSectionDivider
      final outerPadding = tester.widget<Padding>(
        find.ancestor(
          of: find.byType(TinaDivider),
          matching: find.byType(Padding),
        ).first,
      );
      expect(outerPadding.padding, EdgeInsets.symmetric(vertical: customSpacing / 2));
    });

    testWidgets('applies custom thickness', (tester) async {
      const customThickness = 3.0;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaSectionDivider(
              thickness: customThickness,
            ),
          ),
        ),
      );

      final tinaDivider = tester.widget<TinaDivider>(find.byType(TinaDivider));
      expect(tinaDivider.thickness, customThickness);
    });

    testWidgets('applies custom color', (tester) async {
      const customColor = Colors.blue;
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaSectionDivider(
              color: customColor,
            ),
          ),
        ),
      );

      final tinaDivider = tester.widget<TinaDivider>(find.byType(TinaDivider));
      expect(tinaDivider.color, customColor);
    });
  });
}