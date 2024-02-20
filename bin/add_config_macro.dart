import 'package:mockito_on_macros_playground/mockito_macros/add_config_macro.dart';
import 'package:mockito_on_macros_playground/example/b.dart';

@MockAddConfigMacro()
class MockB implements B {}

void main() {
  final mock = MockB();
  print(mock.m1(1, 1));
}
