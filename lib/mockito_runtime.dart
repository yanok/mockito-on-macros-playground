// Stubs of runtime support, for the experiment safe it's minimal,
// just to make things compile.

mixin MockImpl {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw StateError('not implemented');
}

abstract class MockConfig<T> {}
