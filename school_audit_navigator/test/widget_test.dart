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
import 'package:school_audit_navigator/DetailsPage.dart';
void main() {
  testWidgets('Navigate to ResultsPage when Go button is pressed', (WidgetTester tester) async {
    // Build the app with MyHomePage.
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(title: 'School Audit Navigator'),
    ));

    // Tap the 'Go' button.
    await tester.tap(find.text('Go'));
    await tester.pumpAndSettle();

    // Verify that ResultsPage is displayed by checking for its AppBar title.
    expect(find.text('Audits Found'), findsOneWidget);
  });

testWidgets('Navigate to ResultsPage when Go button is pressed', (WidgetTester tester) async {
  // Build the app with MyHomePage.
  await tester.pumpWidget(MaterialApp(
    home: MyHomePage(title: 'School Audit Navigator'),
  ));

  // Tap the 'Go' button.
  await tester.tap(find.text('Go'));
  await tester.pumpAndSettle();

  // Verify that ResultsPage is displayed by checking for its AppBar title.
  expect(find.text('Audits Found'), findsOneWidget);
});

  //TEST RESULT
  testWidgets('ResultsPage displays audits and navigates to AuditPage', (WidgetTester tester) async {
    // Build ResultsPage widget.
    await tester.pumpWidget(MaterialApp(
      home: ResultsPage(),
    ));

    // Verify that the AppBar title is displayed.
    expect(find.text('Audits Found'), findsOneWidget);

    // Verify that the list contains the expected audit.
    expect(find.text('01/23/2024 - Hendrix College'), findsOneWidget);

    // Tap on the audit item.
    await tester.tap(find.text('01/23/2024 - Hendrix College'));
    await tester.pumpAndSettle();

    // Verify that AuditPage is displayed.
    expect(find.text('Hendrix College'), findsOneWidget);
  });

  //TEST AUDITPAGE
  testWidgets('AuditPage displays audit details and pie chart', (WidgetTester tester) async {
    // Build AuditPage widget.
    await tester.pumpWidget(MaterialApp(
      home: AuditPage(),
    ));

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

  testWidgets('DetailsPage displays expenditure details', (WidgetTester tester) async {
    // Build DetailsPage widget.
    await tester.pumpWidget(MaterialApp(
      home: Detailspage(),
    ));

    // Verify that the AppBar title is displayed.
    expect(find.text('Federal Spending on'), findsOneWidget);

    // Verify that expenditure details are displayed.
    expect(find.text('Total Expenditure: \$7,772,859'), findsOneWidget);
    expect(find.text('\$1,120,000 - Specific Instance'), findsOneWidget);
    expect(find.text('\$960,400 - Specific Instance'), findsOneWidget);
    expect(find.text('\$610,530 - Specific Instance'), findsOneWidget);
  });

}
