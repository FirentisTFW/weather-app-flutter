import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class AppErrorFactory {
  const AppErrorFactory._();

  static String provideTitle(BuildContext context, dynamic error) {
    // TODO Provide title based on error type
    return S.of(context).defaultErrorTitle;
  }

  static String provideMessage(BuildContext context, dynamic error) {
    // TODO Provide message based on error type
    return S.of(context).defaultErrorMessage;
  }
}
