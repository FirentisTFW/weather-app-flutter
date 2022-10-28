import 'dart:async';

import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  const Storage();

  Future<SharedPreferences> get _sharedPreferences => SharedPreferences.getInstance();

  Future<Box> getBox({
    required String storageKey,
  }) async {
    final bool isBoxOpen = Hive.isBoxOpen(storageKey);
    if (isBoxOpen) {
      return Hive.box(storageKey);
    } else {
      return Hive.openBox(storageKey);
    }
  }

  Future<String?> getString(
    String key, {
    String? defaultValue,
  }) async =>
      (await _sharedPreferences).getString(key) ?? defaultValue;

  Future<bool> putString({
    required String key,
    required String value,
  }) async =>
      (await _sharedPreferences).setString(key, value);
}
