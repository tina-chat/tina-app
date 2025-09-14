import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_container.dart';
import 'package:tina_ui/src/tokens/design_tokens.dart';

void main() {
  group('TinaContainer', () {
    testWidgets('renders container with child correctly', (tester) async {
      const testText = 'Container Content';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              child: Text(testText),
            ),
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('applies custom padding correctly', (tester) async {
      const customPadding = EdgeInsets.all(20);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              padding: customPadding,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, customPadding);
    });

    testWidgets('applies custom margin correctly', (tester) async {
      const customMargin = EdgeInsets.all(15);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              margin: customMargin,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.margin, customMargin);
    });

    testWidgets('applies custom background color correctly', (tester) async {
      const customColor = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              backgroundColor: customColor,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, customColor);
    });

    testWidgets('applies custom border radius correctly', (tester) async {
      const customRadius = 12.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              borderRadius: customRadius,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(customRadius));
    });

    testWidgets('applies custom border correctly', (tester) async {
      const customBorder = Border.fromBorderSide(
        BorderSide(color: Colors.blue, width: 2),
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              border: customBorder,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border, customBorder);
    });

    testWidgets('applies custom width and height correctly', (tester) async {
      const customWidth = 200.0;
      const customHeight = 100.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              width: customWidth,
              height: customHeight,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxWidth, customWidth);
      expect(container.constraints?.maxHeight, customHeight);
    });

    testWidgets('applies custom alignment correctly', (tester) async {
      const customAlignment = Alignment.topRight;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              alignment: customAlignment,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(container.alignment, customAlignment);
    });

    testWidgets('applies content padding constructor correctly', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer.content(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(
        container.padding,
        const EdgeInsets.all(DesignSpacing.contentPadding),
      );
    });

    testWidgets('applies component padding constructor correctly', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer.component(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(
        container.padding,
        const EdgeInsets.all(DesignSpacing.componentSpacing),
      );
    });

    testWidgets('applies section padding constructor correctly', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer.section(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      expect(
        container.padding,
        const EdgeInsets.all(DesignSpacing.sectionSpacing),
      );
    });

    testWidgets('applies rounded constructor correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer.rounded(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(
        decoration.borderRadius,
        BorderRadius.circular(DesignBorderRadius.lg),
      );
    });

    testWidgets('applies pill constructor correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer.pill(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(
        decoration.borderRadius,
        BorderRadius.circular(DesignBorderRadius.full),
      );
    });

    testWidgets('applies no shadow correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.boxShadow, isEmpty);
    });

    testWidgets('applies small shadow correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              shadow: TinaContainerShadow.sm,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.sm]);
    });

    testWidgets('applies medium shadow correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              shadow: TinaContainerShadow.md,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.md]);
    });

    testWidgets('applies large shadow correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              shadow: TinaContainerShadow.lg,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.lg]);
    });

    testWidgets('applies extra large shadow correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              shadow: TinaContainerShadow.xl,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.xl]);
    });

    testWidgets('applies inner shadow correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              shadow: TinaContainerShadow.inner,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.inner]);
    });

    testWidgets('applies glass shadow correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              shadow: TinaContainerShadow.glass,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.boxShadow, [DesignShadows.glass]);
    });

    testWidgets('applies semantic label correctly', (tester) async {
      const semanticLabel = 'Content container';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TinaContainer(
              semanticLabel: semanticLabel,
              child: Text('Content'),
            ),
          ),
        ),
      );

      final semantics = tester.widget<Semantics>(
        find.descendant(
          of: find.byType(TinaContainer),
          matching: find.byType(Semantics),
        ),
      );

      expect(semantics.properties.label, semanticLabel);
    });

    group('TinaContainerPadding', () {
      test('has all expected padding values', () {
        expect(TinaContainerPadding.xs, const EdgeInsets.all(DesignSpacing.xs));
        expect(TinaContainerPadding.sm, const EdgeInsets.all(DesignSpacing.sm));
        expect(TinaContainerPadding.md, const EdgeInsets.all(DesignSpacing.md));
        expect(TinaContainerPadding.lg, const EdgeInsets.all(DesignSpacing.lg));
        expect(TinaContainerPadding.xl, const EdgeInsets.all(DesignSpacing.xl));
        expect(
          TinaContainerPadding.xl2,
          const EdgeInsets.all(DesignSpacing.xl2),
        );
        expect(
          TinaContainerPadding.xl3,
          const EdgeInsets.all(DesignSpacing.xl3),
        );
      });

      test('has all expected horizontal padding values', () {
        expect(
          TinaContainerPadding.horizontalXs,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.xs),
        );
        expect(
          TinaContainerPadding.horizontalSm,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.sm),
        );
        expect(
          TinaContainerPadding.horizontalMd,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.md),
        );
        expect(
          TinaContainerPadding.horizontalLg,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.lg),
        );
        expect(
          TinaContainerPadding.horizontalXl,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.xl),
        );
      });

      test('has all expected vertical padding values', () {
        expect(
          TinaContainerPadding.verticalXs,
          const EdgeInsets.symmetric(vertical: DesignSpacing.xs),
        );
        expect(
          TinaContainerPadding.verticalSm,
          const EdgeInsets.symmetric(vertical: DesignSpacing.sm),
        );
        expect(
          TinaContainerPadding.verticalMd,
          const EdgeInsets.symmetric(vertical: DesignSpacing.md),
        );
        expect(
          TinaContainerPadding.verticalLg,
          const EdgeInsets.symmetric(vertical: DesignSpacing.lg),
        );
        expect(
          TinaContainerPadding.verticalXl,
          const EdgeInsets.symmetric(vertical: DesignSpacing.xl),
        );
      });
    });

    group('TinaContainerMargin', () {
      test('has all expected margin values', () {
        expect(TinaContainerMargin.xs, const EdgeInsets.all(DesignSpacing.xs));
        expect(TinaContainerMargin.sm, const EdgeInsets.all(DesignSpacing.sm));
        expect(TinaContainerMargin.md, const EdgeInsets.all(DesignSpacing.md));
        expect(TinaContainerMargin.lg, const EdgeInsets.all(DesignSpacing.lg));
        expect(TinaContainerMargin.xl, const EdgeInsets.all(DesignSpacing.xl));
        expect(
          TinaContainerMargin.xl2,
          const EdgeInsets.all(DesignSpacing.xl2),
        );
        expect(
          TinaContainerMargin.xl3,
          const EdgeInsets.all(DesignSpacing.xl3),
        );
      });

      test('has all expected horizontal margin values', () {
        expect(
          TinaContainerMargin.horizontalXs,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.xs),
        );
        expect(
          TinaContainerMargin.horizontalSm,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.sm),
        );
        expect(
          TinaContainerMargin.horizontalMd,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.md),
        );
        expect(
          TinaContainerMargin.horizontalLg,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.lg),
        );
        expect(
          TinaContainerMargin.horizontalXl,
          const EdgeInsets.symmetric(horizontal: DesignSpacing.xl),
        );
      });

      test('has all expected vertical margin values', () {
        expect(
          TinaContainerMargin.verticalXs,
          const EdgeInsets.symmetric(vertical: DesignSpacing.xs),
        );
        expect(
          TinaContainerMargin.verticalSm,
          const EdgeInsets.symmetric(vertical: DesignSpacing.sm),
        );
        expect(
          TinaContainerMargin.verticalMd,
          const EdgeInsets.symmetric(vertical: DesignSpacing.md),
        );
        expect(
          TinaContainerMargin.verticalLg,
          const EdgeInsets.symmetric(vertical: DesignSpacing.lg),
        );
        expect(
          TinaContainerMargin.verticalXl,
          const EdgeInsets.symmetric(vertical: DesignSpacing.xl),
        );
      });
    });

    group('TinaContainerShadow enum', () {
      test('has all expected values', () {
        expect(TinaContainerShadow.values, hasLength(7));
        expect(TinaContainerShadow.values, contains(TinaContainerShadow.none));
        expect(TinaContainerShadow.values, contains(TinaContainerShadow.sm));
        expect(TinaContainerShadow.values, contains(TinaContainerShadow.md));
        expect(TinaContainerShadow.values, contains(TinaContainerShadow.lg));
        expect(TinaContainerShadow.values, contains(TinaContainerShadow.xl));
        expect(TinaContainerShadow.values, contains(TinaContainerShadow.inner));
        expect(TinaContainerShadow.values, contains(TinaContainerShadow.glass));
      });
    });
  });
}
