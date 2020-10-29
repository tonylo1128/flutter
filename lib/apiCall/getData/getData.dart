import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'ChallengeDataJson.dart';
import 'dart:async';
import 'dart:convert';
import 'ConvertCoord.dart';

var testingServer = "https://testing-server1128.herokuapp.com";
var localhost = "http://10.192.32.43:8081";
// var localhost = "http://192.168.8.182:8081";

var server = testingServer;

List<dynamic> temp;
List<ChallengeData> _result = List<ChallengeData>();

Future<List<ChallengeData>> fetchData() async {
  // final response = await http.get(testingServer + "/getdata?page0&per_page=1");
  final response = await http.get(server);

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
  print(keyword);

  List<dynamic> temp;
  List<ChallengeData> _result = new List<ChallengeData>();

  var jsonTemp = {'inputSearchValue': keyword};
  var params = jsonEncode(jsonTemp);

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  var response =
      await http.post(server + "/seaching", headers: headers, body: params);

  temp = json.decode(response.body)['returnResp'];
  print(temp);
  for (var item in temp) {
    _result.add(
      ChallengeData.fromJson(item),
    );
  }

  print("i am about to return result at search function !!!!");
  return _result;
}

getPath(
    String keyword,
    Function passInFunction,
    Function passInRetrieveStop,
    String passInTargetBound,
    String passInTargetServiceType,
    Function passInRetrieveStopFromDifferentBound) async {
  print("I am in getPath function");

  var temp;
  var stop;
  List<LatLng> convertResult = [];
  Set<Polyline> polyline = {};

  var response = await http.post(
      "https://search.kmb.hk/KMBWebSite/Function/FunctionRequest.ashx?action=getstops&route=" +
          keyword +
          "&serviceType=" +
          passInTargetServiceType +
          "&bound=" +
          passInTargetBound);

  if (response.statusCode == 200) {
    temp = json.decode(response.body)['data']['route']['lineGeometry'];
    temp = temp.replaceAll("paths", '"paths"');
    temp = json.decode(temp)['paths'];
    stop = json.decode(response.body)['data']['routeStops'];

    //the return of "eachStop" resp is List<String>
    var resp = eachStop(stop);

    passInRetrieveStopFromDifferentBound(resp);
    //Redux here !!!!
    passInRetrieveStop(resp);

    for (List i in temp) {
      for (var target in i) {
        convertResult.add(convertCoord(target));
      }
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

eachStop(input) {
  List<String> allStop = [];
  print(input);
  for (var i in input) {
    allStop.add(i['CName']);
  }
  print(allStop);
  return allStop;
}

getBound(inputRoute, Function passInSetBoundResult,
    Function retrieveBoundBasicInfo) async {
  print("i am inside getBound la !");

  var resp = await http.get(
      "https://search.kmb.hk/KMBWebSite/Function/FunctionRequest.ashx?action=getroutebound&route=" +
          inputRoute);

  var temp = json.decode(resp.body)['data'];
  passInSetBoundResult(temp);
  //for bound details, pass back to MainBody.dart and then pass to DifferentBound.dart

  print(temp);
}

getBoundBasicInfo(boundList, Function retrieveBoundBasicInfo) async {
  List resultTemp = [];
  print("we are in getBoundBasicInfo function");
  print(boundList);
  for (var i in boundList) {
    var response = await http.post(
        "https://search.kmb.hk/KMBWebSite/Function/FunctionRequest.ashx?action=getstops&route=" +
            i["ROUTE"] +
            "&serviceType=" +
            i["SERVICE_TYPE"].toString() +
            "&bound=" +
            i["BOUND"].toString());

    var reformatTemp = [
      json.decode(response.body)['data']['basicInfo']['OriCName'],
      json.decode(response.body)['data']['basicInfo']['DestCName']
    ];
    resultTemp.add(reformatTemp);
  }
  print("!!!!!");
  print(resultTemp);
  retrieveBoundBasicInfo(resultTemp);
}
