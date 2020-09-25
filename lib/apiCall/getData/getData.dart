import 'package:http/http.dart' as http;
import 'ChallengeDataJson.dart';
import 'dart:async';
import 'dart:convert';

var testingServer = "https://testing-server1128.herokuapp.com";

List<dynamic> temp;
List<ChallengeData> _result = List<ChallengeData>();

Future<List<ChallengeData>> fetchData() async {
  // final response = await http.get(testingServer + "/getdata?page0&per_page=1");
  final response = await http.get(testingServer);

  if (response.statusCode == 200) {
    temp = json.decode(response.body)['recieveRespFromkmbDataRepos'];

    for (var item in temp) {
      _result.add(
        ChallengeData.fromJson(item),
      );
    }
    return _result;
  } else {
    throw Exception('Failed to load data from database');
  }
}

Future<List<ChallengeData>> search(String keyword) async {
  print("I am in search function ar !");

  List<dynamic> temp;
  List<ChallengeData> _result = new List<ChallengeData>();

  var jsonTemp = {'inputSearchValue': keyword};
  var params = jsonEncode(jsonTemp);

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  var response = await http.post("http://10.192.32.43:8081" + "/seaching",
      headers: headers, body: params);

  temp = json.decode(response.body)['returnResp'];
  for (var item in temp) {
    _result.add(
      ChallengeData.fromJson(item),
    );
  }
  return _result;
}
