// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:basic/homepage.dart';

void main() {
  testWidgets('Verify UI components are rendered correctly',
      (WidgetTester tester) async {
    // Build the Stacker game widget
    await tester.pumpWidget(const HomePage());
    expect(find.text('P L A Y'), findsOneWidget);
    expect(find.text('S T O P'), findsOneWidget);
  });
}
