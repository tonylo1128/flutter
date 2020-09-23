import 'dart:ui';

import 'package:flutter/material.dart';
import 'MainBody.dart';
import 'CusDrawer.dart';
import 'CusSearch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("KMBPJ"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CusSearch(),
                  );
                })
          ],
        ),
        drawer: CusDrawer(),
        body: MainBody(),
      ),
    );
  }
}
