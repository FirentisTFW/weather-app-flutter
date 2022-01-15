import 'package:app/data/models/named_location.dart';
import 'package:app/providers/storage_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationsListProvider = AutoDisposeFutureProvider<List<NamedLocation>>(
  (ref) async {
    final storage = ref.read(storageProvider);

    return storage.getLocations();
  },
);
