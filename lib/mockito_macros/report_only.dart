
import 'package:_fe_analyzer_shared/src/macros/api.dart';
import 'package:mockito_on_macros_playground/utils.dart';

macro class ReportOnly implements ClassTypesMacro {
  const ReportOnly();

  void buildTypesForClass(ClassDeclaration clazz, ClassTypeBuilder builder) {
    builder.info('Running report only macro');
  }
}