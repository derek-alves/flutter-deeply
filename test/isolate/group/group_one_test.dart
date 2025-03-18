import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Grupo 1 - Cálculo Pesado', () {
    test('Fatorial Grande', () {
      int factorial(int n) => n <= 1 ? 1 : n * factorial(n - 1);
      expect(factorial(15), equals(1307674368000));
    });

    test('Soma de Números Grandes', () {
      int sum = List.generate(1000000, (i) => i).reduce((a, b) => a + b);
      expect(sum, greaterThan(0));
    });

    test('Raízes Quadradas', () {
      List<double> results = List.generate(500000, (i) => sqrt(i.toDouble()));
      expect(results.isNotEmpty, isTrue);
    });
  });
}
