import 'package:flutter/material.dart';

class PathTimer extends StatefulWidget{
  final passInTargetRoute;
  const PathTimer({this.passInTargetRoute});

  @override
  PathTimerState createState()=> PathTimerState();
}

class PathTimerState extends State<PathTimer>{

  @override
  Widget build(BuildContext context){
    return ListView(
      children: [
        widget.passInTargetRoute!=null ?
          Text(widget.passInTargetRoute, style: TextStyle(color: Colors.white),)
        :
          Text("Error null here")
        
        
        
      ],
    );
  }
}