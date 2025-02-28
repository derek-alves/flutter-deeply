import 'package:flutter/material.dart';
import 'package:flutter_deep_study/code_gen/annotations/lib/src/json_generator.dart';

void main() {
  runApp(const MainApp());
  print(jsonGen.runtimeType);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
