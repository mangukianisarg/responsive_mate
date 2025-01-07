import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_package/responsive.dart';

void main() {
  testWidgets('Responsive layout renders correct widget based on screen size',
      (WidgetTester tester) async {
    // Test case for mobile layout
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(400, 800)), // Mobile size
          child: Responsive(
            mobile: Text('Mobile'),
            tablet: Text('Tablet'),
            desktop: Text('Desktop'),
          ),
        ),
      ),
    );

    expect(find.text('Mobile'), findsOneWidget);
    expect(find.text('Tablet'), findsNothing);
    expect(find.text('Desktop'), findsNothing);

    // Test case for tablet layout
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(900, 800)), // Tablet size
          child: Responsive(
            mobile: Text('Mobile'),
            tablet: Text('Tablet'),
            desktop: Text('Desktop'),
          ),
        ),
      ),
    );

    expect(find.text('Tablet'), findsOneWidget);
    expect(find.text('Mobile'), findsNothing);
    expect(find.text('Desktop'), findsNothing);

    // Test case for desktop layout
    await tester.pumpWidget(
      const MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(1200, 800)), // Desktop size
          child: Responsive(
            mobile: Text('Mobile'),
            tablet: Text('Tablet'),
            desktop: Text('Desktop'),
          ),
        ),
      ),
    );

    expect(find.text('Desktop'), findsOneWidget);
    expect(find.text('Mobile'), findsNothing);
    expect(find.text('Tablet'), findsNothing);
  });
}
