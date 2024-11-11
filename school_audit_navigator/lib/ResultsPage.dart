import 'package:flutter/material.dart';
import 'package:school_audit_navigator/AuditPage.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Audits Found'),
        backgroundColor: Colors.red[300],
        centerTitle: true,
      ),

      //Placeholder button: should be in list view of buttons for each audit found
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AuditPage(
                
              ),
            ),
          );
      },
    ));
  }
}