// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cold_start/main.dart';

void main() {
  testWidgets('Shows splash then list view', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Initially the flutter splash should be visible.
    expect(find.byType(FlutterLogo), findsOneWidget);
    expect(find.text('Device Info Example'), findsNothing);

    // Wait for the splash duration.
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    // After the delay the list view should appear.
    expect(find.text('Device Info Example'), findsOneWidget);
  });
}
