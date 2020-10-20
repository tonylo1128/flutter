import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowTimerResult extends StatefulWidget {
  final passInResultList;

  const ShowTimerResult({this.passInResultList});

  @override
  ShowTimerResultState createState() => ShowTimerResultState();
}

class ShowTimerResultState extends State<ShowTimerResult> {
  String result = "";

  convertText() {
    for (var i in widget.passInResultList) {
      result = result + i[1] + " " + i[2] + "\n";
    }
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ...(widget.passInResultList as List<List>)
            .map((loopingItem) => Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 20,
                          child: Text(
                            loopingItem[2],
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      Expanded(
                        flex: 5,
                        child: Text(
                          loopingItem[1],
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        Container(
          child: RaisedButton(
            color: Colors.redAccent,
            onPressed: () => {
              print(widget.passInResultList),
              convertText(),
              FlutterClipboard.copy(result).then((value) => print('copied')),
              Fluttertoast.showToast(
                  msg: "Copied !",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  fontSize: 16.0)
            },
            child: Text(
              "Check your result",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
