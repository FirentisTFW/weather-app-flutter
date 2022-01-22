import 'package:app/networking/models/location_proposition.dart';
import 'package:app/providers/network_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationsPropositionsProvider = FutureProvider<List<LocationProposition>>(
  (ref) async {
    final geocodingRepository = ref.read(geocodingRepositoryProvider);

    // TODO Implement

    return [];
  },
);
