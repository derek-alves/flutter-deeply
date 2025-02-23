import 'package:flutter/material.dart';
import 'package:flutter_deep_study/spies/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'counter_presenter_spy.dart';

// Spy do Presenter para testes

void main() {
  late CounterPresenterSpy presenter;
  late Widget sut;

  setUp(() {
    presenter = CounterPresenterSpy();
    sut = MaterialApp(home: CounterPage(presenter: presenter));
  });

  tearDown(() {
    presenter.dispose(); // Fecha o StreamController para evitar memory leaks
  });

  testWidgets('Deve iniciar a página com contagem 0', (tester) async {
    await tester.pumpWidget(sut);
    expect(find.text('Contagem: 0'), findsOneWidget);
  });

  testWidgets('Deve chamar increment() ao tocar no botão', (tester) async {
    await tester.pumpWidget(sut);
    await tester.tap(find.text('Incrementar'));

    expect(presenter.callCount, 1); // Verifica se o método foi chamado
  });

  testWidgets('Deve atualizar a contagem ao emitir um novo valor', (
    tester,
  ) async {
    await tester.pumpWidget(sut);

    presenter.emitCounter(5); // Simula um novo valor
    await tester.pump();

    expect(find.text('Contagem: 5'), findsOneWidget);
  });
}
