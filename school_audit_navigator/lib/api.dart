import 'dart:convert';
import 'package:school_audit_navigator/objects/agencies.dart';
import 'package:http/http.dart' as http;
//used for the search function
Future<List<Map<String, dynamic>>> searchColleges({bool isHigherED = false, String? state, String? name}) async {
  Uri url;

  if (name != null && name.isNotEmpty) {
    // Search by college name
    url = Uri.parse("https://api-staging.fac.gov/general?select=auditee_name,audit_year,report_id,auditee_ein&auditee_name=ilike.%$name%");
  } else if (state != null) {
    // Search by state
    if (isHigherED) {
      url = Uri.parse("https://api-staging.fac.gov/general?select=auditee_name,audit_year,report_id,auditee_ein&auditee_state=eq.$state&auditee_name=ilike(any).{*College*,*University*}");
    } else {
      url = Uri.parse("https://api-staging.fac.gov/general?auditee_state=eq.$state&auditee_name=fts.school");
    }
  } else {
    throw Exception('Either name or state must be provided.');
  }

  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  final data = (json.decode(response.body) as List).cast<Map<String, dynamic>>();
  return data;
}

Future<List<Map<String, dynamic>>> getCollegeInfo(String id) async {
  var url = Uri.parse("https://api-staging.fac.gov/general?report_id=eq.$id");
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  final data = (json.decode(response.body) as List).cast<Map<String, dynamic>>();
  return data;
}
Future<List<Map<String, dynamic>>> getCollegeInfofromYear(String year, String ein) async {
  var url = Uri.parse("https://api-staging.fac.gov/general?audit_year=eq.$year&auditee_ein=eq.$ein");
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  final data = (json.decode(response.body) as List).cast<Map<String, dynamic>>();
  return data;
}
//gets college data for the pie chart
Future<Map<String, double>> getCollegeDataMap(String year, String ein) async {
  var url1 = Uri.parse("https://api-staging.fac.gov/general?audit_year=eq.$year&auditee_ein=eq.$ein");
  var response1 = await http.get(url1, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  final data1 = (json.decode(response1.body) as List).cast<Map<String, dynamic>>();
  String reportID = data1[0]['report_id'];
  var url = Uri.parse("https://api-staging.fac.gov/federal_awards?report_id=eq.$reportID&select=federal_agency_prefix,amount_expended");
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  final data = (json.decode(response.body) as List).cast<Map<String, dynamic>>();
  final Map<String, double> dataMap = {};
  int i = 0;
  while (i < data.length){
    String agencyPrefix = data[i]['federal_agency_prefix'];
    int newPrefix = int.parse(agencyPrefix);
    String agencyName = agencies[newPrefix] ?? "";
    if (!dataMap.containsKey(agencyName)){
      dataMap[agencyName] = data [i]['amount_expended'].toDouble();
    }
    else{
      dataMap[agencyName] =  dataMap[agencyName]! + data[i]['amount_expended'];
    }
    i++;
  }
  return dataMap;
}
//gets other years for the line graph
Future<Map<String, double>> getOtherYears(String ein) async {
  var url = Uri.parse("https://api-staging.fac.gov/general?auditee_ein=eq.$ein&select=audit_year,total_amount_expended&order=audit_year.asc");
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  final data = (json.decode(response.body) as List).cast<Map<String, dynamic>>();
  final Map<String, double> dataMap = {};
  int i = 0;
  while(i < data.length){
    dataMap[data[i]['audit_year'].toString()] = data [i]['total_amount_expended'].toDouble();
    i ++;
  }
  return dataMap;
}
//Tried to use this to get other years of audit in the dropdown, but not working
/*Future<List<int>> getYearList(String ein) async {
  var url = Uri.parse("https://api-staging.fac.gov/general?auditee_ein=eq.$ein&select=audit_year&order=audit_year.asc");
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  List<Map<String, int>> data = (json.decode(response.body) as List).cast<Map<String, int>>();
  List<int> work = data.map((map) => map['audit_year']).toList() as List<int>;
  print("done");
  return work;
}*/
