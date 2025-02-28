import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/build.dart';
import 'package:generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class JsonGenerator extends GeneratorForAnnotation<JsonGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    print("🚀 Processing class: ${element.displayName}");

    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    if (visitor.className.isEmpty) {
      print("❌ ERROR: Class name not found.");
      return '';
    }

    print("✅ Found class: ${visitor.className}");
    print("✅ Fields detected: ${visitor.fields}");

    final buffer = StringBuffer();
    final String className = '${visitor.className}Gen';

    buffer.writeln(
      'part of "${buildStep.inputId.pathSegments.last}";',
    ); // ✅ Fix missing part directive
    buffer.writeln('class $className {');

    visitor.fields.forEach((name, type) {
      buffer.writeln('  final $type $name;');
    });

    buffer.writeln('  const $className({');
    visitor.fields.forEach((name, _) {
      buffer.writeln('    required this.$name,');
    });
    buffer.writeln('  });');

    buffer.writeln('  Map<String, dynamic> toMap() {');
    buffer.writeln('    return {');
    visitor.fields.forEach((name, _) {
      buffer.writeln("      '$name': $name,");
    });
    buffer.writeln('    };');
    buffer.writeln('  }');

    buffer.writeln('}');

    print("✅ Generated class: \n$buffer");

    return buffer.toString();
  }
}
