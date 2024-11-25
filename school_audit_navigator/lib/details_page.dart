import 'package:flutter/material.dart';
import 'package:school_audit_navigator/objects/line_graph_data.dart';
import 'package:school_audit_navigator/widgets/LineGraphWidget.dart';

class Detailspage extends StatefulWidget {
  final String? auditEIN;
  const Detailspage({this.auditEIN, Key? key}) : super(key: key);
  @override
  State<Detailspage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: graphData(widget.auditEIN.toString()),
     builder: (context, AsyncSnapshot snapshot){

      if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Scaffold( 
      appBar: AppBar(
        title: const Text('Federal Spending on'),
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        centerTitle: true,
      ),
      body: 
        Center(child: SizedBox(width: 400, height: 500,child:LineGraphWidget(snapshot.data) ,),),
        
  );}});
  }
    }
    