extension ListExtensions<T> on List<T> {
  List<T> copy() => [
        ...this,
      ];

  List<T> separatedBy(T separator) => expand(
        (element) => [
          element,
          separator,
        ],
      ).toList()
        ..removeLast();

  List<T> surroundedBy(T separator) => expand(
        (element) => [
          element,
          separator,
        ],
      ).toList()
        ..insert(0, separator);
}

extension NullableListExtensions<T> on List<T>? {
  List<T> orEmpty() => this ?? [];
}
