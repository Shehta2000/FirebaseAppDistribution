// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_app_distribution/firebase_app_distribution.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Firebase App Distribution Tests', () {
    testWidgets('App should build successfully', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(
        home: FirebaseAppDistribution(),
      ));

      // Verify that the app builds without errors
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('App should have Scaffold widget', (WidgetTester tester) async {
      // Build our app
      await tester.pumpWidget(const MaterialApp(
        home: FirebaseAppDistribution(),
      ));

      // Check if Scaffold exists
      expect(find.byType(Scaffold), findsOneWidget);
    });

    test('App should have correct widget structure', () {
      // Simple unit test
      const app = FirebaseAppDistribution();
      expect(app, isA<StatelessWidget>());
    });
  });
}
