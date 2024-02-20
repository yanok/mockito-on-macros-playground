
// There is no public API exposed yet, the in-progress API lives here.
import 'package:_fe_analyzer_shared/src/macros/api.dart';

import 'package:mockito_on_macros_playground/utils.dart';

macro class MockAddMixin implements ClassTypesMacro {
  const MockAddMixin();

  @override
  Future<void> buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder) async {
    builder.info("Running 'add mixin' macro");
    final mockImpl = await builder.resolveIdentifier(
        Uri.parse('package:mockito_on_macros_playground/mockito_runtime.dart'),
        'MockImpl');
    builder.info('Resolved MockImpl to ${mockImpl.name}');
    builder.appendMixins([NamedTypeAnnotationCode(name: mockImpl)]);
  }
}