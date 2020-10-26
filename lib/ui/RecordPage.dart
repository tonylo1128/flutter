import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  final passInPassInRoute;
  final passInPassInBound;
  final passInPassInTimeResult;

  RecordPage(
      {this.passInPassInRoute,
      this.passInPassInBound,
      this.passInPassInTimeResult});

  @override
  RecordPageState createState() => RecordPageState();
}

class RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {
                print(widget.passInPassInRoute),
                print(widget.passInPassInBound),
                print(widget.passInPassInTimeResult),
              },
            )
          ],
        ),
        body: Container(
          color: Colors.blueGrey,
          child: widget.passInPassInRoute != null
              ? Column(
                  children: [
                    Text(widget.passInPassInRoute),
                    Text(widget.passInPassInBound[0]),
                    Text(widget.passInPassInTimeResult),
                  ],
                )
              : Text("Nth is in here yet ar !"),
        ));
  }
}
