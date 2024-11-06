

import 'package:http/http.dart' as http;
void searchColleges(bool isHigerED, String state) async {
  var url = Uri.https('google.com');
if (isHigerED){
  url = Uri.https('api-staging.fac.gov', '/general',{'select': 'auditee_name','auditee_state':'eq.$state', 'auditee_name': 'fts.university', 'auditee_name': 'fts.college'},);
}
else{
 url = Uri.https('api-staging.fac.gov', '/general',{'select': 'auditee_name', 'auditee_state':'eq.$state', 'auditee_name': 'fts.school'});
}
print(url);
var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

}
void getCollegeYear(String name, int year) async{
  var url = Uri.https('api-staging.fac.gov', '/general',{'select': 'auditee_name','auditee_name':'eq.$name', 'audit_year':'$year'});
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
void getCollegeInfo(String id) async{
  var url = Uri.https('api-staging.fac.gov', '/federal_awards',{'General.report_id':'$id'});
  var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}