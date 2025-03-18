import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Grupo 2 - I/O e Processamento', () {
    test('Simulação de Leitura e Escrita', () async {
      final file = File('test_temp.txt');
      await file.writeAsString(
        List.generate(10000, (i) => 'Linha $i').join('\n'),
      );
      String content = await file.readAsString();
      expect(content.isNotEmpty, isTrue);
      await file.delete();
    });

    test('Loop Extensivo', () {
      int count = 0;
      for (int i = 0; i < 100000000; i++) {
        count++;
      }
      expect(count, equals(100000000));
    });

    test('Manipulação de Lista Grande', () {
      List<int> numbers = List.generate(1000000, (i) => i * 2);
      numbers.shuffle();
      numbers.sort();
      expect(numbers.first, equals(0));
    });
  });
}
