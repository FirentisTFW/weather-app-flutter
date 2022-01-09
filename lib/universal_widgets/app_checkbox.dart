import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final void Function(bool) onChanged;
  final ValueNotifier<bool> valueNotifier;

  const AppCheckbox({
    required this.onChanged,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.square(26.0),
      child: AdaptiveButton(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(6.0),
        ),
        onPressed: () {
          valueNotifier.value = !valueNotifier.value;
          onChanged(valueNotifier.value);
        },
        child: ValueListenableBuilder<bool>(
          valueListenable: valueNotifier,
          builder: (_, isSelected, __) {
            return AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 200,
              ),
              child: isSelected ? _buildCheckIcon() : const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCheckIcon() {
    return const Icon(
      Icons.check,
      size: 20.0,
    );
  }
}
