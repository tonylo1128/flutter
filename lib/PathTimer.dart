import 'package:flutter/material.dart';
import 'package:kmb/ListItem.dart';

class PathTimer extends StatefulWidget {
  final passInStopList;
  const PathTimer({this.passInStopList});

  @override
  PathTimerState createState() => PathTimerState();
}

class PathTimerState extends State<PathTimer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        widget.passInStopList != null
            ? Column(
                children: [
                  ...(widget.passInStopList as List<String>)
                      .map((passInData) => ListItem(
                            passInPathList: passInData,
                          ))
                      .toList()
                ],
              )
            : Text("Error null here")
      ],
    );
  }
}
