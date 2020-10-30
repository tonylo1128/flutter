import 'package:flutter/material.dart';
import 'package:kmb/ui/SlidableWidget.dart';

class RecordPage extends StatefulWidget {
  final passInPharsedResult;
  final passInObj;
  RecordPage({this.passInPharsedResult, this.passInObj});

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
              widget.passInObj.clear(),
              print("record clear"),
            },
          )
        ],
      ),
      body: Container(
        color: Colors.blueGrey,
        child: widget.passInPharsedResult != null
            ? ListView(
                children: [
                  ...(widget.passInPharsedResult as List)
                      .map(
                        (item) => SlidableWidget(passInLoopingItem: item),
                      )
                      .toList()
                ],
              )
            : Center(
                child: Text(
                  "Nth is in here yet !",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
      ),
    );
  }
}

// RecordCard(passInPharsedResultItem: item),
