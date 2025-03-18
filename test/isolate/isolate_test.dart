import 'dart:async';
import 'dart:io';
import 'dart:isolate';

Future<void> runTestsInIsolate(List<dynamic> args) async {
  final sendPort = args[0] as SendPort;
  final testFile = args[1] as String;

  // Executa os testes
  final stopwatch = Stopwatch()..start();
  final result = await Process.run('dart', ['test', testFile]);
  stopwatch.stop();

  print(result.stdout);
  print(result.stderr);
  sendPort.send(stopwatch.elapsedMilliseconds);
}

void main() async {
  final receivePort1 = ReceivePort();
  final receivePort2 = ReceivePort();

  await Isolate.spawn(runTestsInIsolate, [
    receivePort1.sendPort,
    'test/group1_test.dart',
  ]);
  await Isolate.spawn(runTestsInIsolate, [
    receivePort2.sendPort,
    'test/group2_test.dart',
  ]);

  final time1 = await receivePort1.first as int;
  final time2 = await receivePort2.first as int;

  print("Testes em Isolates: Tempo total: ${time1 + time2} ms");

  receivePort1.close();
  receivePort2.close();
}
