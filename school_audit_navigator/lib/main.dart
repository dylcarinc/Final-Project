import 'package:flutter/material.dart';
import 'package:school_audit_navigator/DetailsPage.dart';
import 'package:school_audit_navigator/ResultsPage.dart';
import 'package:school_audit_navigator/auditPage.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MyHomePage(title: "School Audit Navigator"),
      theme: ThemeData(  
        scaffoldBackgroundColor: Colors.red[100],
      )
    ),
  );
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(decoration: InputDecoration(
          labelText: 'Search by Name',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),),
            const Text('-OR-',),
          const TextField(decoration: InputDecoration(
          labelText: 'Search By State',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),),
          FloatingActionButton(
          onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ResultsPage(
              )
            )
          );
        },
          child: const Text('Go')
        ),
          ],
        ),
      ),
    );
  }
}

