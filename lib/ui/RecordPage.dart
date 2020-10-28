import 'package:flutter/material.dart';
import 'package:kmb/ui/PopupDialog.dart';
import 'package:kmb/ui/RecordCard.dart';

class RecordPage extends StatefulWidget {
  final passInPharsedResult;
  RecordPage({this.passInPharsedResult});

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
                // prefs.clear(),
              },
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.blueGrey,
          child: widget.passInPharsedResult != null
              ? Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ListView(
                      children: [
                        ...(widget.passInPharsedResult as List)
                            .map((item) =>
                                RecordCard(passInPharsedResultItem: item))
                            .toList()
                      ],
                    ),
                  ),
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
