// Spy do Presenter para testes
import 'dart:async';

import 'package:flutter_deep_study/spies/counter_page.dart';
import 'package:mocktail/mocktail.dart';

class CounterPresenterSpy extends Mock implements CounterPresenter {
  void mockTotalCall() => when(() => getTotal).thenReturn(10);

  int callCount = 0;
  final _counterController = StreamController<int>.broadcast();

  @override
  Stream<int> get counterStream => _counterController.stream;

  @override
  void increment() {
    callCount++;
    _counterController.add(callCount); // Simula a emissão de um novo valor
  }

  void emitCounter(int value) {
    _counterController.add(value);
  }

  void dispose() {
    _counterController.close();
  }
}
