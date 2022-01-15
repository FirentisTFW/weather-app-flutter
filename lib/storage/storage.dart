import 'package:hive/hive.dart';

class Storage {
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
}
