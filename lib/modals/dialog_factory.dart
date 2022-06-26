import 'dart:io';

import 'package:app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class DialogFactory {
  const DialogFactory._();

  static Future<void> showUnavailableDialog(BuildContext context) => showSimpleDialog(
        context,
        message: S.of(context).unavailableDialogMessage,
        title: S.of(context).unavailableDialogTitle,
      );

  static Future<void> showSimpleDialog(
    BuildContext context, {
    List<Widget>? actions,
    bool isBarrierDismissible = true,
    required String message,
    required String title,
  }) {
    final Widget messageWidget = _buildMessage(message);
    final Widget titleWidget = _buildTitle(title);
    final List<Widget> actionsWidgets = actions ?? _buildDefaultActions(context);

    return showDialog(
      context: context,
      barrierDismissible: isBarrierDismissible,
      builder: (_) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            actions: actionsWidgets,
            content: messageWidget,
            title: titleWidget,
          );
        }
        return AlertDialog(
          actions: actionsWidgets,
          content: messageWidget,
          title: titleWidget,
        );
      },
    );
  }

  static Widget buildAction({
    required VoidCallback onPressed,
    required String text,
  }) {
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }
    final Widget child = Text(
      text.toUpperCase(),
    );
    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        child: child,
      );
    }

    return MaterialButton(
      onPressed: onPressed,
      child: child,
    );
  }

  static Widget _buildMessage(String? message) {
    // TODO Style
    return Text(message ?? '');
  }

  static Widget _buildTitle(String title) {
    // TODO Style
    return Text(title);
  }

  static List<Widget> _buildDefaultActions(BuildContext context) {
    return [
      buildAction(
        onPressed: () {
          Navigator.pop(context);
        },
        text: S.of(context).ok,
      ),
    ];
  }
}
