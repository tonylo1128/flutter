import 'package:flutter/material.dart';

import 'PopupDialog.dart';

class RecordCard extends StatefulWidget {
  final passInPharsedResultItem;
  RecordCard({this.passInPharsedResultItem});

  @override
  _RecordCardState createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard> {
  var font20Black = TextStyle(color: Colors.black87, fontSize: 20);

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (_) => PopupDialog(
        passInItem: widget.passInPharsedResultItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
          splashColor: Colors.redAccent.withAlpha(30),
          onTap: () => {
                print("tapped"),
                _showMyDialog(),
              },
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.8,
            height: 100,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.passInPharsedResultItem.route,
                    style: font20Black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Bound : " + widget.passInPharsedResultItem.bound,
                    style: font20Black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Service Type : " +
                        widget.passInPharsedResultItem.serviceType,
                    style: font20Black,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
