import 'package:http/http.dart' as http;

var testingServer = "https://testing-server1128.herokuapp.com";

Future<http.Response> fetchData() {
  return http.get(testingServer);
}
