import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class Loc {
  static AppLocalizations of(BuildContext context) => AppLocalizations.of(context)!;
}
