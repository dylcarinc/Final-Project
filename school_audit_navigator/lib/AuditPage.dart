import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:school_audit_navigator/DetailsPage.dart';

class AuditPage extends StatefulWidget {
  const AuditPage({super.key});

  @override
  State<AuditPage> createState() => _AuditPageState();
}

class _AuditPageState extends State<AuditPage> {
  //test data, will be replaced with data from api
  Map<String, double> dataMap = {
    "Test 1": 5,
    "Test 2": 4,
    "Test 3": 3,
    "Test 4": 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Name Of Institution'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text('FAC Acceptance Date:'),
        const Text('Total Federal Expenditure:'),
        const Text('Auditee:'),
        const Text('Auditor:'),
        const SizedBox(height: 100),
        const Center(child: Text('Funding Categories')),
        const Spacer(),
        Center(child: 
        PieChart(
          dataMap: dataMap, 
          chartRadius: MediaQuery.of(context).size.width / 1.7,
          legendOptions: const LegendOptions(
            legendPosition: LegendPosition.right
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
            decimalPlaces: 1,
          ),
          )),
        const Spacer(),
        //idk how to add some padding so it's not flush against the corner of the screen
        Align(
          alignment: Alignment.bottomRight, 
          child: 
          TextButton(
            child: const Text("More Info"),
            onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Detailspage(
              )
            )
          );
        }
            
            
            
          ))
        
      ],),
      
    );
  }
}