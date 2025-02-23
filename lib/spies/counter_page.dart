import 'package:flutter/material.dart';

abstract class CounterPresenter {
  Stream<int> get counterStream;
  void increment();

  int get getTotal;
}

class CounterPage extends StatelessWidget {
  final CounterPresenter presenter;

  const CounterPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador')),
      body: StreamBuilder<int>(
        stream: presenter.counterStream,
        initialData: 0,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Contagem: ${snapshot.data}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: presenter.increment,
                  child: const Text('Incrementar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
