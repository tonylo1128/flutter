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

  initprefs() async {
    await SharedPreferences.getInstance().then((value) => {
          print("TESTINGGGGGGGGGGGGGGGGGGGG"),
          print(value.getKeys()),
          keyList = value.getKeys().toList(),
          for (var i in keyList)
            {
              jsonDecodeTemp.add(jsonDecode(value.getString(i))),
              print(jsonDecodeTemp),
              temp = RecordJson.fromJson(jsonDecodeTemp[keyList.indexOf(i)]),
              print(temp),
              pharsedResult.add(temp)
            },
          // print(pharsedResult[0]),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "Header",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          ListTile(
            title: Text("Texting 1"),
            onTap: () => {
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
