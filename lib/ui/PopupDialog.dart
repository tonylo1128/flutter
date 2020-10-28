import 'package:flutter/material.dart';

class PopupDialog extends StatefulWidget {
  final passInItem;

  PopupDialog({this.passInItem});
  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.passInItem.route +
          "B" +
          widget.passInItem.bound +
          "S" +
          widget.passInItem.serviceType),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...(widget.passInItem.timerList as List)
              .map((item) => Row(
                    children: <Widget>[
                      Text(item['time'].toString()),
                      Text(item['station'].toString()),
                    ],
                  ))
              .toList()
        ],
      ),
    );
  }
}
