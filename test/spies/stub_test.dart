import 'package:flutter_deep_study/spies/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock gerado pelo mocktail (Stub)
class CounterPresenterStub extends Mock implements CounterPresenter {}

void main() {
  late CounterPresenterStub presenter;

  setUp(() {
    presenter = CounterPresenterStub();
  });

  test('Deve retornar um valor fixo quando o stream for acessado', () {
    when(() => presenter.counterStream).thenAnswer((_) => Stream.value(10));

    expect(presenter.counterStream, emits(10)); // Testa se o stream emite 10
  });

  test('Deve chamar increment() sem capturar chamadas', () {
    when(() => presenter.increment()).thenReturn(null);

    presenter
        .increment(); // Apenas executa, sem verificar quantas vezes foi chamado

    verify(
      () => presenter.increment(),
    ).called(1); // Verifica se foi chamado uma vez
  });
}
