import 'package:flutter/material.dart';
import 'package:kmb/ListItem.dart';
import 'package:intl/intl.dart';

import 'Helper.dart';

class PathTimer extends StatefulWidget {
  final passInStopList;
  final passInController;
  final passInRetrieveTimeResult;
  const PathTimer(
      {this.passInStopList,
      this.passInController,
      this.passInRetrieveTimeResult});

  @override
  PathTimerState createState() => PathTimerState();
}

class PathTimerState extends State<PathTimer>
    with AutomaticKeepAliveClientMixin {
  List<List> assignToChildGorbalTime = [];

  void setPassInGorbalTime(inputIndex, inputStationName) {
    var changeTargetIndex = -3;
    setState(() {
      print("Let's see see how long is the list: " +
          (assignToChildGorbalTime.length).toString());
      if (assignToChildGorbalTime.length == 0) {
        print("I am in IF");
        assignToChildGorbalTime.add([
          inputIndex,
          DateFormat('kkmm').format(DateTime.now()),
          inputStationName
        ]);
      } else {
        print("i am in else");
        for (var i in assignToChildGorbalTime) {
          if (i[0] == inputIndex) {
            print("````````````````````````````````````");
            changeTargetIndex = assignToChildGorbalTime.indexOf(i);
            break;
          } else {
            changeTargetIndex = -2;
          }
        }
        if (changeTargetIndex == -2) {
          print("CHANGEINDEX IS A :" + changeTargetIndex.toString());
          assignToChildGorbalTime.add([
            inputIndex,
            DateFormat('kkmm').format(DateTime.now()),
            inputStationName
          ]);
        } else if (changeTargetIndex != -3 && changeTargetIndex != -2) {
          print("CHANGEINDEX IS B :" + changeTargetIndex.toString());
          assignToChildGorbalTime[changeTargetIndex][1] =
              DateFormat('kkmm').format(DateTime.now());
        }
      }
      assignToChildGorbalTime = bubbleSort(assignToChildGorbalTime);
      print(assignToChildGorbalTime);
      widget.passInRetrieveTimeResult(assignToChildGorbalTime);
    });
  }

  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  moveDown(inputItemHeight) {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
    } else {
      _controller.animateTo(_controller.offset + inputItemHeight,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
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
                      .toList(),
                  Container(
                    color: Colors.redAccent,
                    child: RaisedButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        if (widget.passInController.hasClients) {
                          widget.passInController.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        "Check your result",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            : Text("Error null here"));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
