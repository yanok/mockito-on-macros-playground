
import 'package:_fe_analyzer_shared/src/macros/api.dart';

import 'package:mockito_on_macros_playground/utils.dart';

macro class MockAddConfig implements ClassTypesMacro {
  const MockAddConfig();

  @override
  Future<void> buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder) async {
    builder.info("Running 'add config' macro");
    final mockImpl = await builder.resolveIdentifier(
        Uri.parse('package:mockito_on_macros_playground/mockito_runtime.dart'),
        'MockImpl');
    builder.info('Resolved MockImpl to ${mockImpl.name}');
    builder.appendMixins([NamedTypeAnnotationCode(name: mockImpl)]);
    final classToMock = clazz.interfaces.singleOrNull;
    if (classToMock == null) {
      builder.error('Mock class should implement exactly one class');
      return;
    }
    builder.info('Mocking ${classToMock.identifier.name}');
    final name = clazz.identifier.name;
    final configName = '_${name}_Config';
    builder.declareType(configName, DeclarationCode.fromParts([
      'class $configName {}',
    ]));
  }
}