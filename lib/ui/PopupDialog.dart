import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupDialog extends StatefulWidget {
  final passInItem;

  PopupDialog({this.passInItem});
  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<PopupDialog> {
  String result = "";

  convertText() {
    for (var i in widget.passInItem.timerList) {
      result = result + i["time"] + " " + i["station"] + "\n";
    }
    print(result);
  }

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
          Text(widget.passInItem.createDate),
          ...(widget.passInItem.timerList as List)
              .map((item) => Row(
                    children: <Widget>[
                      Text(item['time'].toString()),
                      Text(item['station'].toString()),
                    ],
                  ))
              .toList(),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: ()=>{
            print(widget.passInItem.timerList),
            convertText(),
            FlutterClipboard.copy(result)
                        .then((value) => print('copied')),
                    Fluttertoast.showToast(
                        msg: "Copied !",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0)
                  
          },
          child: Text("Copy"),
        )
      ],
    );
  }
}
