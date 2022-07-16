import 'package:app/universal_widgets/adaptive_button.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final bool isSelected;
  final void Function(bool) onChanged;

  const AppCheckbox({
    required this.isSelected,
    required this.onChanged,
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
          onChanged(!isSelected);
        },
        child: AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 200,
          ),
          child: isSelected ? _buildCheckIcon() : const SizedBox.shrink(),
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
