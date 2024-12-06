import 'package:flutter/material.dart';
import 'package:school_audit_navigator/objects/line_graph_data.dart';
import 'package:school_audit_navigator/widgets/LineGraphWidget.dart';
import 'package:school_audit_navigator/widgets/widgets.dart';

class Detailspage extends StatefulWidget {
  final String? auditEIN;
  const Detailspage({this.auditEIN, super.key});
  @override
  State<Detailspage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    print(widget.auditEIN.toString());
    return FutureBuilder(future: graphData(widget.auditEIN.toString()),
     builder: (context, AsyncSnapshot snapshot){

      if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Scaffold( 
      appBar: AppBar(
        title: const Text('School Audit Navigator'),
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        centerTitle: true,
      ),
      body: 
        Center(
          child: Column(
            children: [const Subtitle('Federal Spending Used On:'), 
          SizedBox(width: 400, height: 500,child:LineGraphWidget(snapshot.data)),])
           ),
           );

                 
  }
  }
  );
  }
    }
    