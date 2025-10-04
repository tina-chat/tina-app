import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/src/atoms/tina_tile.dart';

void main() {
  group('TinaTile', () {
    testWidgets('renders with required parameters', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTile(
              onTap: () {},
              child: const Text('Test Tile'),
            ),
          ),
        ),
      );

      expect(find.text('Test Tile'), findsOneWidget);
      expect(find.byType(TinaTile), findsOneWidget);
    });

    testWidgets('has correct width (full width)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTile(
              onTap: () {},
              child: const Text('Test Tile'),
            ),
          ),
        ),
      );

      final tile = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(tile.width, double.infinity);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTile(
              onTap: () {},
              isLoading: true,
              child: const Text('Test Tile'),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Tile'), findsNothing);
    });

    testWidgets('renders leading and trailing widgets', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTile(
              onTap: () {},
              leading: const Icon(Icons.star),
              trailing: const Icon(Icons.arrow_forward),
              child: const Text('Test Tile'),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.text('Test Tile'), findsOneWidget);
    });

    testWidgets('handles disabled state correctly', (tester) async {
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTile(
              onTap: () => wasTapped = true,
              enabled: false,
              child: const Text('Test Tile'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TinaTile));
      await tester.pump();

      expect(wasTapped, false);
    });

    testWidgets('calls onTap when enabled', (tester) async {
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTile(
              onTap: () => wasTapped = true,
              child: const Text('Test Tile'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TinaTile));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('does not call onTap when loading', (tester) async {
      var wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TinaTile(
              onTap: () => wasTapped = true,
              isLoading: true,
              child: const Text('Test Tile'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TinaTile));
      await tester.pump();

      expect(wasTapped, false);
    });

    group('variants', () {
      for (final variant in TinaTileVariant.values) {
        testWidgets('renders $variant variant', (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: TinaTile(
                  onTap: () {},
                  variant: variant,
                  child: const Text('Test Tile'),
                ),
              ),
            ),
          );

          expect(find.byType(TinaTile), findsOneWidget);
          expect(find.text('Test Tile'), findsOneWidget);
        });
      }
    });

    group('sizes', () {
      for (final size in TinaTileSize.values) {
        testWidgets('renders $size size', (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: TinaTile(
                  onTap: () {},
                  size: size,
                  child: const Text('Test Tile'),
                ),
              ),
            ),
          );

          expect(find.byType(TinaTile), findsOneWidget);
          expect(find.text('Test Tile'), findsOneWidget);
        });
      }
    });
  });
}
