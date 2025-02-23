import 'package:flutter/material.dart';
import 'package:flutter_deep_study/spies/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Stub do Presenter
class CounterPresenterMock extends Mock implements CounterPresenter {}

void main() {
  late CounterPresenterMock presenter;
  late Widget sut;

  setUp(() {
    presenter = CounterPresenterMock();
    sut = MaterialApp(home: CounterPage(presenter: presenter));

    // Configura o stub para sempre retornar um valor fixo
    when(() => presenter.counterStream).thenAnswer((_) => Stream.value(0));
  });

  testWidgets('Deve iniciar a página com contagem 0', (tester) async {
    await tester.pumpWidget(sut);
    expect(find.text('Contagem: 0'), findsOneWidget);
  });

  testWidgets('Deve atualizar a contagem ao emitir um novo valor', (
    tester,
  ) async {
    when(() => presenter.counterStream).thenAnswer((_) => Stream.value(5));

    await tester.pumpWidget(sut);
    await tester.pump();

    expect(find.text('Contagem: 5'), findsOneWidget);
  });
}
