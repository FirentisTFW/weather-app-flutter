import 'package:intl/intl.dart';

abstract class Constants {
  const Constants._();

  static final DateFormat dateFormat12h = DateFormat('hh:mm a');
  static final DateFormat dateFormat24h = DateFormat('HH:mm');
}
