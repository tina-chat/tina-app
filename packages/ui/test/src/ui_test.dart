// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:tina_ui/ui.dart';

void main() {
  group('Ui', () {
    test('can be instantiated', () {
      expect(Ui(), isNotNull);
    });
  });
}
