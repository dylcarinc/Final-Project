import 'package:flutter/material.dart';
import 'package:school_audit_navigator/ResultsPage.dart';
import 'package:school_audit_navigator/objects/states.dart';
import 'package:school_audit_navigator/api.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MyHomePage(title: "School Audit Navigator"),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 186, 189, 196),
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  States stateValue = States.al;
  final TextEditingController _searchController = TextEditingController();

  void _performSearchByName(BuildContext context) async {
    String searchText = _searchController.text.trim();
    if (searchText.isNotEmpty) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(collegeName: searchText),
        ),
      );
    }
  }

  void _performSearchByState(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(selectedState: stateValue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Removed mainAxisAlignment to allow natural spacing
            // added padding below
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Welcome to the Federal Audit Clearinghouse App! Search nationally for a high school or university by name or use the drop down to filter by state."),
              ),
              const SizedBox(height: 30.0),
              
              // Search by Name Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search by Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onSubmitted: (_) => _performSearchByName(context),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () => _performSearchByName(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 76, 124, 175),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      'Search by name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40.0),
              const Text('-OR-'),
              const SizedBox(height: 40.0),

              // Search by State Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButton<States>(
                    isExpanded: true,
                    items: States.values.map((States state) {
                      return DropdownMenuItem<States>(
                        value: state,
                        child: Text(state.state),
                      );
                    }).toList(),
                    value: stateValue,
                    onChanged: (States? newValue) {
                      setState(() {
                        stateValue = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () => _performSearchByState(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 76, 124, 175),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      'Search by state',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
