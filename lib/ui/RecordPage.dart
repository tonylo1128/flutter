import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kmb/ui/PopupDialog.dart';
import 'package:kmb/ui/RecordCard.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

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
              // widget.passInPrefs.clear(),
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
                        (item) => Slidable(
                          key: Key(item.route + item.bound + item.serviceType),
                          actionPane: SlidableBehindActionPane(),
                          actionExtentRatio: 0.25,
                          child: RecordCard(passInPharsedResultItem: item),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                                caption: 'Delete',
                                color: Colors.redAccent,
                                icon: Icons.delete,
                                onTap: () => {
                                      print(Slidable.of(context)),
                                    }),
                          ],
                          dismissal: SlidableDismissal(
                            child: SlidableDrawerDismissal(),
                            onDismissed: (actionType) {
                              print(actionType);
                              return Fluttertoast.showToast(
                                  msg: "Deleted !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                          ),
                        ),
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
