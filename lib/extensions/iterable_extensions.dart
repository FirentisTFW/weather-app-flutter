extension NullableIterableExtensions<T> on Iterable<T>? {
  Iterable<T> orEmpty() => this ?? [];

  Iterable<T> whereNotNull() => orEmpty().whereType<T>().toList();
}

extension IterableWithNullableElementsExtensions<T> on Iterable<T?> {
  Iterable<T> whereNotNull() => orEmpty().whereType<T>().toList();
}
