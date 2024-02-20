import 'package:mockito_on_macros_playground/mockito_macros/add_config.dart';
import 'package:mockito_on_macros_playground/example/b.dart';

@MockAddConfig()
class MockB implements B {}

void main() {
  final mock = MockB();
  print(mock.m1(1, 1));
}
