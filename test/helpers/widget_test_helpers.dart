import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtensions on WidgetTester {
  BuildContext get context => element(find.byType(TestPlaceholder));
}

class TestPlaceholder extends StatelessWidget {
  const TestPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
