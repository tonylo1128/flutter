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
  var lastLength;
  var temp;

  initprefs() async {
    await SharedPreferences.getInstance().then((value) => {
          print("This is the init process for the SharedPreferences"),
          print(keyList.length),
          if (keyList.length == 0)
            {
              print("I am in == 0 !!!"),
              addRecordToVar(value),
            }
          else if (keyList.length > lastLength)
            {
              print(keyList.length),
              print(lastLength),
              print(1 > 0),
              print("I am in >>>>>>>>>>>>>"),
              addRecordToVar(value),
            },
        });
    print("jsut finish that init staff");
  }

  addRecordToVar(inputValue) {
    keyList = inputValue.getKeys().toList();
    for (var i in keyList) {
      jsonDecodeTemp.add(jsonDecode(inputValue.getString(i)));
      temp = RecordJson.fromJson(jsonDecodeTemp[keyList.indexOf(i)]);
      pharsedResult.add(temp);
    }
    lastLength = keyList.length;
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
