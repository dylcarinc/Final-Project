import 'package:flutter/material.dart';
import 'package:school_audit_navigator/audit_page.dart';
import 'package:school_audit_navigator/api.dart';
import 'package:school_audit_navigator/objects/states.dart';

class ResultsPage extends StatefulWidget {
  final States? selectedState;
  final String? collegeName;

  const ResultsPage({this.selectedState, this.collegeName, super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String _selectedFilter = 'AZ'; // Default filter option changed from 'Alphabetical' to 'AZ'

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
          title: const Text('No Search Criteria'),
        ),
        body: const Center(
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
      body: Column(
        children: [
          // Filter UI
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('Sort by: '),
                DropdownButton<String>(
                  value: _selectedFilter,
                  items: <String>['AZ', 'ZA', 'Oldest Year', 'Newest Year']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedFilter = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          // FutureBuilder
          Expanded(
            child: FutureBuilder(
              future: futureData,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  // Make a copy of the data to avoid modifying the original snapshot data
                  List<Map<String, dynamic>> colleges =
                      List<Map<String, dynamic>>.from(snapshot.data);
                  // Sort the colleges based on _selectedFilter
                  colleges.sort((a, b) {
                    if (_selectedFilter == 'AZ') {
                      return a['auditee_name'].compareTo(b['auditee_name']);
                    } else if (_selectedFilter == 'ZA') {
                      return b['auditee_name'].compareTo(a['auditee_name']);
                    } else if (_selectedFilter == 'Oldest Year') {
                      return a['audit_year'].compareTo(b['audit_year']);
                    } else if (_selectedFilter == 'Newest Year') {
                      return b['audit_year'].compareTo(a['audit_year']);
                    } else {
                      return 0;
                    }
                  });
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
                                auditID: colleges[index]['report_id'],
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
          ),
        ],
      ),
    );
  }
}
