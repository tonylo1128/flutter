import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowTimerResult extends StatefulWidget {
  final passInResultList;
  final passInPassInRetrieveTimeResult;
  final passInPageController;

  const ShowTimerResult(
      {this.passInResultList,
      this.passInPassInRetrieveTimeResult,
      this.passInPageController});

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
    return widget.passInResultList != null
        ? ListView(
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            Expanded(
                              flex: 5,
                              child: Text(
                                loopingItem[1],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                    widget.passInPassInRetrieveTimeResult(
                        widget.passInResultList),
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
                  child: Text(
                    "Check your result",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.redAccent,
                  onPressed: () => {
                    widget.passInPageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    )
                  },
                  child: Text(
                    "Back to Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        : Container(
            child: Align(
              alignment: Alignment(0, 0),
              child: Text(
                "Nth in here yet ar, go back to first page la",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          );
  }
}
