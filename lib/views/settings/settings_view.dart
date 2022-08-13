import 'package:app/views/settings/settings_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView();

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  void initState() {
    super.initState();
    ref.read(settingsProvider.notifier).getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO Implement page
      body: Container(),
    );
  }
}
