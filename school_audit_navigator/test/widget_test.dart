// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_audit_navigator/main.dart'; 
import 'package:school_audit_navigator/ResultsPage.dart'; 
import 'package:school_audit_navigator/AuditPage.dart'; 
import 'package:pie_chart/pie_chart.dart';

void main() {
testWidgets('AuditPage displays audit details and pie chart', (WidgetTester tester) async {
  // Build AuditPage widget.
  await tester.pumpWidget(MaterialApp(
    home: AuditPage(),
  ));

  // WILL NEED TO ADJUST THESE LATER BUT ITS FINE FOR NOW
  // Verify that the AppBar title is displayed.
  expect(find.text('Hendrix College'), findsOneWidget);

  // Verify that audit details are displayed.
  expect(find.text('FAC Acceptance Date: 01/23/2024'), findsOneWidget);
  expect(find.text('Total Federal Expenditure: \$7,772,859'), findsOneWidget);
  expect(find.text('Auditee: Shawn Mathis, mathis@hendrix.edu'), findsOneWidget);
  expect(find.text('Auditor: Corey Jennings, corey.jennings@forvis.com'), findsOneWidget);

  // Verify that the PieChart is displayed.
  expect(find.byType(PieChart), findsOneWidget);

  // Verify that 'More Info' button is present and navigates to DetailsPage.
  expect(find.text('More Info'), findsOneWidget);

  // Tap the 'More Info' button.
  await tester.tap(find.text('More Info'));
  await tester.pumpAndSettle();

  // Verify that DetailsPage is displayed.
  expect(find.text('Federal Spending on'), findsOneWidget);
});


}
