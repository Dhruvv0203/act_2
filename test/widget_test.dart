import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digital_pet_app/main.dart';

void main() {
  testWidgets('PetApp tab switching test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(PetApp());

    // Verify that the first tab (Dog) is displayed initially.
    expect(find.text('Dogs are loyal and friendly!'), findsOneWidget);
    expect(find.text('Cats love to sleep and explore!'), findsNothing);

    // Tap on the 'Cat' tab and trigger a frame.
    await tester.tap(find.text('Cat'));
    await tester.pump();

    // Verify that the Cat tab content is now visible.
    expect(find.text('Cats love to sleep and explore!'), findsOneWidget);
    expect(find.text('Dogs are loyal and friendly!'), findsNothing);

    // Tap on the 'Bird' tab and trigger a frame.
    await tester.tap(find.text('Bird'));
    await tester.pump();

    // Verify that the Bird tab content is now visible.
    expect(find.text('Birds are colorful and can sing beautifully!'), findsOneWidget);
    expect(find.text('Cats love to sleep and explore!'), findsNothing);
  });
}
