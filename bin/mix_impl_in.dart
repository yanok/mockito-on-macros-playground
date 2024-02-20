import 'package:mockito_on_macros_playground/mockito_macros/mix_impl_in.dart';
import 'package:mockito_on_macros_playground/example/b.dart';

@MockAddMixin()
class MockB implements B {}

void main() {
  final mock = MockB();
  print(mock.m1(1, 1));
}
