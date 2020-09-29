import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'ChallengeDataJson.dart';
import 'dart:async';
import 'dart:convert';

import 'ConvertCoord.dart';

var testingServer = "https://testing-server1128.herokuapp.com";
var localhost = "http://10.192.32.43:8081";

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

  var response = await http.post(testingServer + "/seaching",
      headers: headers, body: params);

  if (response.statusCode == 200) {
    print("call api works");
  } else {
    print("Some went wrong with api call $response.statusCode");
  }

  temp = json.decode(response.body)['returnResp'];
  for (var item in temp) {
    _result.add(
      ChallengeData.fromJson(item),
    );
  }

  print("i am about to return result at search function !!!!");
  return _result;
}

Future<List> getPath(String keyword, Function passInFunction) async {
  print("I am in getPath function");

  var temp;
  List<LatLng> convertResult = [];
  Set<Polyline> polyline = {};

  var response = await http.post(
      "http://search.kmb.hk/KMBWebSite/Function/FunctionRequest.ashx?action=getstops&route=" +
          keyword +
          "&serviceType=1&bound=1");

  if (response.statusCode == 200) {
    temp = json.decode(response.body)['data']['route']['lineGeometry'];
    temp = temp.replaceAll("paths", '"paths"');
    temp = json.decode(temp)['paths'];

    // print(temp);

    for (List i in temp) {
      for (var target in i) {
        convertResult.add(convertCoord(target));
      }
      // print(convertResult);
    }
  } else
    print("cant get path !!!!");

  polyline.add(Polyline(
      polylineId: PolylineId('route1'),
      visible: true,
      points: convertResult,
      width: 4,
      color: Colors.blue,
      startCap: Cap.roundCap,
      endCap: Cap.buttCap));

  passInFunction(polyline);

  // return convertResult;
}
