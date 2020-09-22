import 'dart:ui';

import 'package:flutter/material.dart';
import 'MainBody.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("KMBPJ"),
        ),
        drawer: Drawer(
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
              ListTile(title: Text("Texting 1")),
              ListTile(title: Text("Texting 2")),
              ListTile(title: Text("Texting 3")),
            ],
          ),
        ),
        body: MainBody(),
      ),
    );
  }
}
