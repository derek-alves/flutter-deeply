import 'package:analyzer/dart/element/type.dart';

extension GeneratorExtensionDartType on DartType {
  String toClassName() {
    return toString().replaceFirst('*', '');
  }
}

extension GeneratorExtensionInterfaceType on InterfaceType {
  String toClassName() {
    return toString().replaceFirst('*', '');
  }
}
