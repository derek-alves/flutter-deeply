import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:generator/src/utils/generator_extension.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, dynamic> fields = {};

  @override
  visitConstructorElement(ConstructorElement element) {
    className = element.returnType.toClassName();
    return super.visitConstructorElement(element);
  }

  @override
  void visitFieldElement(FieldElement element) {
    super.visitFieldElement(element);
    fields[element.name] = element.type.toClassName();
  }
}
