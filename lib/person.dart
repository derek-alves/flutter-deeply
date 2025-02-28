import 'package:annotations/annotations.dart';

part 'person.g.dart'; // This line is MANDATORY!

@jsonGen
class Person {
  final String name;
  final bool hasMoney;
  final double money;

  Person({required this.name, required this.hasMoney, required this.money});
}
