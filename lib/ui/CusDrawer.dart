import 'dart:convert';

import "package:flutter/material.dart";
import 'package:kmb/json/RecordJson.dart';
import 'package:kmb/ui/RecordPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CusDrawer extends StatefulWidget {
  @override
  CusDrawerState createState() => CusDrawerState();
}

class CusDrawerState extends State<CusDrawer> {
  var prefs;
  List<RecordJson> pharsedResult = new List<RecordJson>();
  List jsonDecodeTemp = [];
  List keyList = [];
  var temp;

  addRecordToVar(inputValue) {
    pharsedResult = [];
    jsonDecodeTemp = [];
    keyList = inputValue.getKeys().toList();

    for (var i in keyList) {
      jsonDecodeTemp.add(jsonDecode(inputValue.getString(i)));
      temp = RecordJson.fromJson(jsonDecodeTemp[keyList.indexOf(i)]);
      pharsedResult.add(temp);
    }
  }

  initprefs() async {
    await SharedPreferences.getInstance()
        .then((vaule) => {addRecordToVar(vaule)});

    print("jsut finish that init staff");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Text(
              "Header",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          ListTile(
            title: Text("Your Record"),
            onTap: () => {
              print("I just click onTAPPPPPPPPP"),
              initprefs(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return RecordPage(passInPharsedResult: pharsedResult);
                }),
              ),
            },
          ),
          ListTile(title: Text("Texting 2")),
          ListTile(title: Text("Texting 3")),
        ],
      ),
    );
  }
}
