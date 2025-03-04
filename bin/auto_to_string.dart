import 'package:mockito_on_macros_playground/auto_to_string.dart';

void main() {
  final jack = User('Jack', 25);
  print(jack.toString());
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);

  @override
  @AutoToString()
  String toString();
}
