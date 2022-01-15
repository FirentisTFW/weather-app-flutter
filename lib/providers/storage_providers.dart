import 'package:app/storage/common_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageProvider = Provider(
  (ref) {
    return CommonStorage();
  },
);
