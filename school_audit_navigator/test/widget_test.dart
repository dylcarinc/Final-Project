import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_audit_navigator/results_page.dart';
import 'package:school_audit_navigator/audit_page.dart';
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
  group('Search Results Tests', () {

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
  });


  group('Audit Page Tests', () {

    testWidgets('AuditPage shows loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuditPage(
            auditEIN: '123456789',
            auditID: 'TEST001',
            auditYear: '2023',
          ),
        ),
      );

      // Verify loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading audit data...'), findsOneWidget);
    });

    testWidgets('AuditPage displays year dropdown', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuditPage(
            auditEIN: '123456789',
            auditID: 'TEST001',
            auditYear: '2023',
          ),
        ),
      );

      // Initial pump to build widget
      await tester.pump();

      // Find the specific DropdownButton with String type
      expect(find.byType(DropdownButton<String>), findsOneWidget);

      // Verify dropdown items
      expect(find.text('2023'), findsOneWidget);
      
      // Optional: Verify more dropdown values
      final dropdownButton = tester.widget<DropdownButton<String>>(
        find.byType(DropdownButton<String>)
      );
      
      // Verify the current value matches the provided audit year
      expect(dropdownButton.value, equals('2023'));
    });

    testWidgets('AuditPage displays main section headings',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuditPage(
            auditEIN: '123456789',
            auditID: 'TEST001',
            auditYear: '2023',
          ),
        ),
      );

      // Allow frame to be pumped
      await tester.pump();

      // Verify page title
      expect(find.text('School Audit Navigator'), findsOneWidget);
    });
  });
}
