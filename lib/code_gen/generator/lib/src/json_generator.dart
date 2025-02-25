import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/build.dart';
import 'package:generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class JsonGenerator extends GeneratorForAnnotation<JsonGenAnnotation> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    final String className = '${visitor.className}Gen';
    buffer.writeln('class $className {');
    visitor.fields.forEach((name, type) {
      buffer.writeln('final $type $name;');
    });

    buffer.writeln('const $className({');
    visitor.fields.forEach((name, _) {
      buffer.writeln('required this.$name;');
    });
    buffer.writeln('})');
    buffer.writeln('}');
  }
}
