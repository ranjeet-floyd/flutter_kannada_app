import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kannada_app/flashcard_app.dart';

void main() {
  testWidgets('Flutter Kannada App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlashCardApp());

    // Verify that the app title is displayed.
    expect(find.text('Learn Kannada'), findsOneWidget);

    // Verify that at least one flashcard is displayed.
    expect(find.byType(Card), findsAtLeastNWidgets(1));

    // Verify that the first flashcard shows English text initially.
    expect(find.text('Hello, how are you?'), findsOneWidget);

    // Tap on the first flashcard to flip it.
    await tester.tap(find.byType(Card).first);
    await tester.pump();

    // Verify that the Kannada text is now displayed.
    expect(find.text('Namaskāra, hēgiddīri?'), findsOneWidget);
  });

  testWidgets('Shuffle button test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlashCardApp());

    // Find and tap the shuffle button.
    await tester.tap(find.byIcon(Icons.shuffle));
    await tester.pump();

    // The app should still be functional after shuffle.
    expect(find.text('Learn Kannada'), findsOneWidget);
    expect(find.byType(Card), findsAtLeastNWidgets(1));
  });

  testWidgets('Reset button test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlashCardApp());

    // Flip a card first.
    await tester.tap(find.byType(Card).first);
    await tester.pump();

    // Find and tap the reset button.
    await tester.tap(find.byIcon(Icons.restart_alt));
    await tester.pump();

    // Verify that the first card is back to showing English text.
    expect(find.text('Hello, how are you?'), findsOneWidget);
  });
}