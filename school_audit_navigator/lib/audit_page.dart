import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:school_audit_navigator/details_page.dart';
import 'package:school_audit_navigator/widgets/widgets.dart';

class AuditPage extends StatefulWidget {
  final String? auditID;
  const AuditPage({this.auditID, Key? key}) : super(key: key);
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
    Future<List<Map<String, dynamic>>> futureData = getCollegeInfo(widget.auditID.toString());
    return FutureBuilder(
      future: futureData,
      builder: (context, AsyncSnapshot snapshot) {
       if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            final List<Map<String, dynamic>> college = snapshot.data;
            final String acceptDate = college[0]['fac_accepted_date'];
            final int expend = college[0]['total_amount_expended'];
            final String auditee = college[0]['auditee_contact_name'];
            final String auditee_contact = college[0]['auditee_email'];
            final String auditor = college[0]['auditor_contact_name'];
            final String auditor_contact = college[0]['auditor_email'];
            return Scaffold(
              appBar: AppBar(
        title: Text(college[0]['auditee_name']),
        backgroundColor: const Color.fromARGB(255, 76, 124, 175),
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Paragraph(
            'FAC Acceptance Date: 01/23/2024\nTotal Federal Expenditure: \$7,772,859\nAuditee: Shawn Mathis, mathis@hendrix.edu\nAuditor: Corey Jennings, corey.jennings@forvis.com'
          ),     
        
        const SizedBox(height: 100),
        const Subtitle('Funding Categories'),
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
      ],)
            );

      }
  });
  }
}