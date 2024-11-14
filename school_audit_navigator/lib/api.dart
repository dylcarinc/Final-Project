//select=auditee_name&
//&auditee_name=fts.college"
import 'dart:convert';

import 'package:http/http.dart' as http;
Future<List<Map<String, dynamic>>> searchColleges(bool isHigerED, String state) async {
  Uri url;
  if (isHigerED){
    url = Uri.parse("https://api-staging.fac.gov/general?select=auditee_name,audit_year&auditee_state=eq.$state&auditee_name=ilike(any).{*College*,*University*}");
  }
  else{
  url =  Uri.parse("https://api-staging.fac.gov/general?auditee_state=eq.AR&auditee_name=fts.school");
  }
  print(url);
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  //print(response.body);
  //List valueMap = jsonDecode(response.body.trim());
  //print (valueMap.elementAt(0));
  final data = (json.decode(response.body) as List).cast<Map<String, dynamic>>();
  //print(data.elementAt(1)['auditee_name']);
  return data;

}
Future<String> searchName(String name) async{
  var url = Uri.https('api-staging.fac.gov', '/general',{'select': 'auditee_name','select': 'audit_year','auditee_name':'eq.$name'});
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  print(response.body);
  
  return response.body;
}
 Future<String> getCollegeInfo(String id) async{
  var url = Uri.https('api-staging.fac.gov', '/federal_awards',{'General.report_id':id});
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});

 return response.body;
}