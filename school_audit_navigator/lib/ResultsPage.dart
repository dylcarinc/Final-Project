import 'package:flutter/material.dart';
import 'package:school_audit_navigator/AuditPage.dart';
import 'package:school_audit_navigator/api.dart';
import 'package:school_audit_navigator/objects/states.dart';

class ResultsPage extends StatefulWidget {
  final States selectedState;
  const ResultsPage({required this.selectedState,super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    String state= widget.selectedState.toString();
    String stateAbrev = state.substring(state.indexOf('.')+1, state.length).toUpperCase();
    print(stateAbrev);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audits Found'),
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        centerTitle: true,
      ),
      body: FutureBuilder(
      future: searchColleges(true, '$stateAbrev'),
      builder: (context, AsyncSnapshot snapshot){
        final List<Map<String, dynamic>> colleges = snapshot.data ?? [];
         if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
         }
         else{ 
        return Container(
          child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
          trailing:  Text(colleges.elementAt(index)['audit_year']),
          title: Text(colleges.elementAt(index)['auditee_name'])
        );})
         );
      }}),
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
      child: const Text('01/23/2024 - Hendrix College')
    ));
  }
}
