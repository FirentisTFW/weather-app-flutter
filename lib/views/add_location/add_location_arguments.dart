import 'package:dio/dio.dart';

class AddLocationArguments {
  final VoidCallback onLocationAdded;

  const AddLocationArguments({
    required this.onLocationAdded,
  });
}
