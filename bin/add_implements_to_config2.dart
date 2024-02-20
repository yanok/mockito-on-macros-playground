import 'package:mockito_on_macros_playground/mockito_macros/add_implements_to_config2.dart';
import 'package:mockito_on_macros_playground/example/b.dart';

@MockAddConfigImplements()
class MockB implements B {}

void main() {
  final mock = MockB();
  print(mock.m1(1, 1));
}
