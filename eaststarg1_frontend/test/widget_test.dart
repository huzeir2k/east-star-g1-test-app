// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:eaststarg1_frontend/main.dart';

void main() {
  testWidgets('Login screen shows sign in and register options',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // The login screen should be the first thing the user sees.
    expect(find.text('Sign in or register below:'), findsOneWidget);
    expect(find.text('Sign in with...'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);

    // Tapping "Sign in with..." should navigate to the sign-in provider page.
    await tester.tap(find.text('Sign in with...'));
    await tester.pumpAndSettle();

    expect(find.text('Sign in manually'), findsOneWidget);
  });
}
