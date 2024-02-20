
import 'package:_fe_analyzer_shared/src/macros/api.dart';

import 'package:mockito_on_macros_playground/utils.dart';

macro class MockAddConfigMacro implements ClassTypesMacro {
  const MockAddConfigMacro();

  @override
  Future<void> buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder) async {
    builder.info("Running 'add config + macro' macro");
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
    builder.info('Declaring $configName');
    final mockConfig = await builder.resolveIdentifier(
        Uri.parse('package:mockito_on_macros_playground/mockito_runtime.dart'), 'MockConfig');
    builder.info('Resolved MockConfig to ${mockConfig.name}');
    final mockConfigMacro = await builder.resolveIdentifier(
      Uri.parse('package:mockito_on_macros_playground/mockito_macros/add_config_macro.dart'),
      'MockConfigMacro');
    builder.info('Resolved MockConfigMacro to ${mockConfigMacro.name}');
    builder.declareType(configName, DeclarationCode.fromParts([
      '@',
      mockConfigMacro,
      '() ',
      'class $configName implements ',
      NamedTypeAnnotationCode(name: mockConfig, typeArguments: [
        NamedTypeAnnotationCode(name: clazz.identifier)
      ]),
      ' {}'
    ]));
    builder.info('Declared MockConfig class');
  }
}

macro class MockConfigMacro implements ClassDeclarationsMacro {
  const MockConfigMacro();

  @override
  Future<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) async {
    builder.info("Running 'MockConfigMacro'");
    final classToMock = clazz.interfaces.single.typeArguments.single;
    builder.declareInType(DeclarationCode.fromParts([
      'void',
      ' bla() {}']));
  }
}