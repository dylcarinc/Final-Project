import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_audit_navigator/main.dart'; 

import 'package:school_audit_navigator/audit_page.dart'; 
import 'package:pie_chart/pie_chart.dart';
import 'package:school_audit_navigator/details_page.dart';
import 'package:school_audit_navigator/results_page.dart';
import 'package:school_audit_navigator/objects/states.dart';

// Mock data for testing
final mockSearchResults = [
  {
    'auditee_name': 'Test University',
    'audit_year': '2023',
    'auditee_ein': '123456789',
    'report_id': 'TEST001'
  },
  {
    'auditee_name': 'Sample College',
    'audit_year': '2023',
    'auditee_ein': '987654321',
    'report_id': 'TEST002'
  }
];

void main() {
    setUp(() {
      // Setup mock responses before each test
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets('ResultsPage shows loading indicator initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResultsPage(collegeName: 'Test University'),
        ),
      );

      // Verify loading indicator is shown initially
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    testWidgets('ResultsPage shows no results message for empty criteria',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResultsPage(),
        ),
      );

      // Verify no search criteria message
      expect(find.text('No search criteria provided.'), findsOneWidget);
    });
    testWidgets('ResultsPage displays sort dropdown', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResultsPage(selectedState: States.al),
        ),
      );

      // Wait for the widget to build
      await tester.pump();

      // Verify the sort dropdown exists
      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.text('         Sort by: '), findsOneWidget);  // Updated to match exact text with spaces
      
      // Also verify the dropdown options exist
      expect(find.text('AZ'), findsOneWidget);
    });
}
