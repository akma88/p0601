import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p0601/main.dart';

void main() {
  testWidgets('Animation button exists', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Animate'), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}
