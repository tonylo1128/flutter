import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kmb/json/RecordJson.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordPage extends StatefulWidget {
  final passInPharsedResult;

  RecordPage({this.passInPharsedResult});

  @override
  RecordPageState createState() => RecordPageState();
}

class RecordPageState extends State<RecordPage> {
  @override
  void initState() {
    // initprefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {
                // prefs.clear(),
              },
            )
          ],
        ),
        body: Container(
          color: Colors.blueGrey,
          child: widget.passInPharsedResult != null
              ? ListView(
                  children: [
                    Text("IT WORKEDDDDDDDDDDDDDDDD"),
                  ],
                )
              : Center(
                  child: Text(
                    "Nth is in here yet !",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
        ));
  }
}
