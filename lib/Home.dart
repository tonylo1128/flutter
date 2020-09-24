import 'package:flutter/material.dart';
import 'MainBody.dart';
import 'CusDrawer.dart';
import 'CusSearch.dart';
import 'NetworkCheck.dart';

class Home extends StatelessWidget {
  // NetworkCheck temp = NetworkCheck();
  // temp.check();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text("KMBPJ"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CusSearch(),
              );
            },
          )
        ],
      ),
      drawer: CusDrawer(),
      body: MainBody(),
    );
  }
}
