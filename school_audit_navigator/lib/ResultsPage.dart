import 'package:flutter/material.dart';
import 'package:school_audit_navigator/AuditPage.dart';
import 'package:school_audit_navigator/api.dart';
import 'package:school_audit_navigator/objects/states.dart';

class ResultsPage extends StatefulWidget {
  final States? selectedState;
  final String? collegeName;

  const ResultsPage({this.selectedState, this.collegeName, Key? key}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> futureData;

    if (widget.collegeName != null && widget.collegeName!.isNotEmpty) {
      futureData = searchColleges(name: widget.collegeName);
    } else if (widget.selectedState != null) {
      String state = widget.selectedState.toString();
      String stateAbrev = state.substring(state.indexOf('.') + 1).toUpperCase();
      futureData = searchColleges(isHigherED: true, state: stateAbrev);
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('No Search Criteria'),
        ),
        body: Center(
          child: Text('No search criteria provided.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audits Found'),
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureData,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final List<Map<String, dynamic>> colleges = snapshot.data;
            return ListView.builder(
              itemCount: colleges.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  trailing: Text(colleges[index]['audit_year'].toString()),
                  title: Text(colleges[index]['auditee_name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuditPage(
                          // Pass necessary data to AuditPage
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      // Keeping the FloatingActionButton as per your request
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AuditPage(),
            ),
          );
        },
        child: const Text('01/23/2024 - Hendrix College'),
      ),
    );
  }
}
