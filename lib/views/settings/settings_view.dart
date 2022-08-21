import 'package:app/data/enums/temperature_unit.dart';
import 'package:app/data/enums/time_format.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/universal_widgets/app_progress_indicator.dart';
import 'package:app/utils/settings_utils.dart';
import 'package:app/views/settings/settings_providers.dart';
import 'package:app/views/settings/settings_state.dart';
import 'package:app/views/settings/widgets/setting_cell.dart';
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
      backgroundColor: AppColors.lightYellow,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final SettingsState state = ref.watch(settingsProvider);
    final Widget child;

    if (state is SettingsFetchSuccess) {
      child = _buildLoadedBody(state);
    } else {
      child = const AppProgressIndicator();
    }

    return AnimatedSwitcher(
      duration: AppAnimations.animatedSwitcherDuration,
      child: child,
    );
  }

  Widget _buildLoadedBody(SettingsFetchSuccess state) {
    return Padding(
      padding: AppDimensions.defaultPaddingHorizontal.copyWith(
        top: 30.0,
      ),
      child: Column(
        children: [
          _buildTemperatureSetting(state),
          _buildTimeFormatSetting(state),
        ].separatedBy(
          const SizedBox(
            height: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildTemperatureSetting(SettingsFetchSuccess state) {
    return SettingCell<TemperatureUnit>(
      initialValue: state.temperatureUnit,
      label: S.of(context).settingsTemperatureUnitLabel,
      values: SettingsUtils.provideAvailableTemperatureUnits(),
      onChanged: (value) {
        if (value != null) {
          ref.read(settingsProvider.notifier).changeTemperatureUnit(value);
        }
      },
    );
  }

  Widget _buildTimeFormatSetting(SettingsFetchSuccess state) {
    return SettingCell<TimeFormat>(
      initialValue: state.timeFormat,
      label: S.of(context).settingsTimeFormatLabel,
      values: SettingsUtils.provideAvailableTimeFormats(),
      onChanged: (value) {
        if (value != null) {
          ref.read(settingsProvider.notifier).changeTimeFormat(value);
        }
      },
    );
  }
}
