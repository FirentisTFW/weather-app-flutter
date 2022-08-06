import 'package:app/extensions/extensions.dart';
import 'package:app/networking/from_json_factories.dart';
import 'package:app/networking/from_json_factory.dart';

abstract class JsonParser {
  const JsonParser._();

  static List<T> parseListResponse<T>(dynamic json) {
    if (json is! List) throw UnimplementedError();
    final Iterable<Map<String, dynamic>?> jsonIterable = _mapJsonToIterable(json);

    return jsonIterable
        .map(
          (element) {
            final FromJsonFactory? fromJsonFactory = fromJsonFactories[T];
            if (element == null || fromJsonFactory == null) return null;
            return fromJsonFactory(element) as T;
          },
        )
        .whereNotNull()
        .toList();
  }

  static Iterable<Map<String, dynamic>> _mapJsonToIterable(List json) {
    return json.map(
      (element) {
        try {
          return Map<String, dynamic>.from(element as Map);
        } catch (_) {
          // TODO Consider logging error
          return null;
        }
      },
    ).whereNotNull();
  }
}
