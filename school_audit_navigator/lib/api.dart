

import 'package:http/http.dart' as http;
void showData() async {
var url = Uri.https('api-staging.fac.gov', '/general',{'auditee_zip':'eq.72032'});
print(url);
var response = await http.get(url, headers: {'X-Api-Key': 'OTOlQu3kFOeDM2LwYz7S0ofa3m45FJQOhfB40VEz'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
}