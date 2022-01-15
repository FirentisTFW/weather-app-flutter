import 'package:app/generated/l10n.dart';
import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationsListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final void Function(WidgetRef) onAddIconPressed;

  const LocationsListAppBar({
    required this.onAddIconPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: AppColors.grey.withOpacity(0.1),
            spreadRadius: 0.1,
          ),
        ],
        color: AppColors.white,
      ),
      child: _buildBody(context, ref),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(context),
          _buildAddIcon(ref),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).locationsListAppBarTitle,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildAddIcon(WidgetRef ref) {
    return GestureDetector(
      onTap: () => onAddIconPressed(ref),
      child: const Icon(
        Icons.add,
        size: 30.0,
      ),
    );
  }
}
