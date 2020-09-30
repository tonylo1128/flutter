import 'package:flutter/material.dart';

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
            ? Text(
                widget.passInStopList[0],
                style: TextStyle(color: Colors.white),
              )
            : Text("Error null here")
      ],
    );
  }
}
