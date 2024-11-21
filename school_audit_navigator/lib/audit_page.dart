import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:school_audit_navigator/details_page.dart';
import 'package:school_audit_navigator/widgets/widgets.dart';
import 'package:school_audit_navigator/api.dart';

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
    Future<Map<String, dynamic>> values =  getCollegeDataMap(widget.auditID.toString());
    return FutureBuilder(
      future: Future.wait([getCollegeInfo(widget.auditID.toString()), getCollegeDataMap(widget.auditID.toString())]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
       if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            final List<Map<String, dynamic>> college = snapshot.data![0];
            final Map<String, double> values = snapshot.data![1];
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
           Paragraph(
            'FAC Acceptance Date: $acceptDate\nTotal Federal Expenditure: $expend\nAuditee: $auditee, $auditee_contact\nAuditor: $auditor, $auditor_contact'
          ),     
        
        const SizedBox(height: 100),
        const Subtitle('Funding Categories'),
        const Spacer(),
        Center(child: 
        PieChart(
          dataMap: values, 
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