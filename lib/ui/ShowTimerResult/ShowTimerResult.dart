import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowTimerResult extends StatefulWidget {
  final passInResultList;

  const ShowTimerResult({this.passInResultList});

  @override
  ShowTimerResultState createState() => ShowTimerResultState();
}

class ShowTimerResultState extends State<ShowTimerResult> {
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
            onPressed: () {},
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
