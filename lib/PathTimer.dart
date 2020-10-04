import 'package:flutter/material.dart';
import 'package:kmb/ListItem.dart';

import 'Helper.dart';

class PathTimer extends StatefulWidget {
  final passInStopList;
  const PathTimer({this.passInStopList});

  @override
  PathTimerState createState() => PathTimerState();
}

class PathTimerState extends State<PathTimer> {
  List<List> passInGorbalTime = [];

  void setPassInGorbalTime(inputIndex, inputStationName) {
    var changeTargetIndex = -3;
    setState(() {
      print("Let's see see how long is the list: " +
          (passInGorbalTime.length).toString());
      if (passInGorbalTime.length == 0) {
        print("I am in IF");
        passInGorbalTime
            .add([inputIndex, new DateTime.now(), inputStationName]);
      } else {
        print("i am in else");
        for (var i in passInGorbalTime) {
          if (i[0] == inputIndex) {
            print("Same index");
            print("the pass in Index is: " + inputIndex.toString());
            print("The current looping index: " + i[0].toString());
            changeTargetIndex = inputIndex;
            break;
          } else {
            changeTargetIndex = -2;
            print("No this value, add it now");
            print("the pass in Index is: " + inputIndex.toString());
            print("The current looping index: " + i[0].toString());
          }
        }
        if (changeTargetIndex == -2) {
          print("CHANGEINDEX IS A :" + changeTargetIndex.toString());
          passInGorbalTime
              .add([inputIndex, new DateTime.now(), inputStationName]);
        } else if (changeTargetIndex != -3 && changeTargetIndex != -2) {
          print("CHANGEINDEX IS B :" + changeTargetIndex.toString());
          passInGorbalTime[changeTargetIndex][1] = new DateTime.now();
        }
      }
      passInGorbalTime = bubbleSort(passInGorbalTime);
      print(passInGorbalTime);
    });
  }

  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  
  moveDown(inputItemHeight){
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange){

        }
        else{
          _controller.animateTo(_controller.offset + inputItemHeight,
          duration: Duration(milliseconds: 500), curve:  Curves.linear);
        }
    
  }

  @override
  Widget build(BuildContext context) {
    double itemHeight = 60;

    return Container(
        child: widget.passInStopList != null
            ? ListView(
              controller: _controller,
              itemExtent: itemHeight,
                children: [
                  ...(widget.passInStopList as List<String>)
                      .map((passInData) => ListItem(
                          passInPathList: passInData,
                          passInIndex:
                              widget.passInStopList.indexOf(passInData),
                          passInCheckAndSetTime: setPassInGorbalTime,
                          passInMoveDown: moveDown))
                      .toList()
                ],
              )
            : Text("Error null here"));
  }
}
