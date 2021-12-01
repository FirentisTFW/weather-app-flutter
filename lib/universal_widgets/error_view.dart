import 'package:app/generated/l10n.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/universal_widgets/action_button.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String? buttonTitle;
  final String message;
  final VoidCallback onButtonPressed;
  final String title;

  const ErrorView({
    this.buttonTitle,
    required this.message,
    required this.onButtonPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.defaultPaddingAll,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          _buildTitle(),
          const SizedBox(
            height: 30.0,
          ),
          _buildMessage(),
          const Spacer(),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: AppTextStyles.title(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMessage() {
    return Text(
      message,
      style: AppTextStyles.text(),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButton(BuildContext context) {
    return ActionButton(
      onPressed: onButtonPressed,
      title: buttonTitle ?? S.of(context).tryAgain,
    );
  }
}
