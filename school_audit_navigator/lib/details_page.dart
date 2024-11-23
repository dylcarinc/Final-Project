import 'package:flutter/material.dart';
import 'package:school_audit_navigator/objects/lineGraphData.dart';
import 'package:school_audit_navigator/widgets/LineGraphWidget.dart';
import 'package:school_audit_navigator/widgets/widgets.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Federal Spending on'),
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        centerTitle: true,
      ),
      body: 
          LineGraphWidget(graphData),
        
  );
  }
}