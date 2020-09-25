import 'package:flutter/material.dart';
import 'MainBody.dart';
import 'CusDrawer.dart';
import 'CusSearch.dart';
import 'NetworkCheck.dart';
import 'SearchTextField.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // NetworkCheck temp = NetworkCheck();
  // temp.check();

  bool searching = false;
  String searchKeyWord;

  passKeyword(inputFromChildWidget) =>
      setState(() => {searchKeyWord = inputFromChildWidget});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: searching ? Colors.redAccent : Colors.black,
        title: searching
            ? SearchTextField(passInFunction: passKeyword)
            : new Text("KMBPJ"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                searching = !searching;
              });
            },
          )
        ],
      ),
      drawer: CusDrawer(),
      body: MainBody(),
    );
  }
}
