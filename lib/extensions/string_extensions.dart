extension NullableStringExtension on String? {
  bool get isNullOrBlank => this?.trim().isEmpty ?? true;
}
