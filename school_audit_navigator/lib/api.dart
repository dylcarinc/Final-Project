import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> searchColleges({bool isHigherED = false, String? state, String? name}) async {
  Uri url;

  if (name != null && name.isNotEmpty) {
    // Search by college name
    url = Uri.parse("https://api-staging.fac.gov/general?select=auditee_name,audit_year&auditee_name=ilike.%$name%");
  } else if (state != null) {
    // Search by state
    if (isHigherED) {
      url = Uri.parse("https://api-staging.fac.gov/general?select=auditee_name,audit_year,report_id&auditee_state=eq.$state&auditee_name=ilike(any).{*College*,*University*}");
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
Future<Map<String, double>> getCollegeDataMap(String id) async {
  var url = Uri.parse("https://api-staging.fac.gov/federal_awards?report_id=eq.$id&select=federal_agency_prefix,amount_expended");
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  final data = (json.decode(response.body) as List).cast<Map<String, dynamic>>();
  final Map<String, double> dataMap = {};
  int i = 0;
  while (i < data.length){
    if (!dataMap.containsKey(data[i]['federal_agency_prefix'])){
      dataMap[data[i]['federal_agency_prefix'].toString()] = data [i]['amount_expended'].toDouble();
    }
    else{
      dataMap[data[i]['federal_agency_prefix']] =  dataMap[data[i]['federal_agency_prefix']]! + data[i]['amount_expended'];
    }
    i++;
  }
  return dataMap;
}
