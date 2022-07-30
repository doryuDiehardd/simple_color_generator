import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_color_generator/widgets/color_generator.dart';

void main() {
  testWidgets('RGB color changing smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ColorGenerator());
    final Finder rgbStart = find.text('\n\nRGB(255, 255, 255)');
    final Finder rgbFinder = find.textContaining(RegExp('\n\nRGB\(\d{3}, \d{3}, \d{3}\)`g'));

    // Verify that our RGB color is r = 255, g = 255, b = 255 at start.
    expect(rgbStart, findsOneWidget);
    expect(rgbFinder, findsNothing);

    // Tapping on the left part of screen with RGB color
    await tester.tap(find.byType(InkWell).first);
    await tester.pump();

    // Verify that RGB color was changed.
    expect(rgbFinder != rgbStart, isTrue);
    expect(rgbStart, findsNothing);
  });

  testWidgets('HEX color changing smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ColorGenerator());
    
    final hexStart = find.text('\n\nHEX(#16777215)');
    final hexFinder = find.textContaining(RegExp('\n\nHEX\(#\w{1,8}\)g'));

    // Verify that our HEX color is #FFFFFF at start.
    expect(hexStart, findsOneWidget);
    expect(hexFinder, findsNothing);

    // Tapping on the left part of screen with HEX color
    await tester.tap(find.byType(InkWell).last);
    await tester.pump();

    // Verify that HEX color was changed.
    expect(hexFinder != hexStart, isTrue);
    expect(hexStart, findsNothing);
  });
}
