import 'package:flutter/material.dart';
import 'ListItem.dart';
// import 'package:kmb/ListItem.dart';
import 'package:intl/intl.dart';

import 'Helper.dart';
import 'ShowTimerResult/ConvertResultToString.dart';

class PathTimer extends StatefulWidget {
  final passInStopList;
  final passInController;
  final passInRetrieveTimeResult;
  final passInRetrieveResetAssignToChildGorbalTime;
  const PathTimer(
      {this.passInStopList,
      this.passInController,
      this.passInRetrieveTimeResult,
      this.passInRetrieveResetAssignToChildGorbalTime});

  @override
  PathTimerState createState() => PathTimerState();
}

class PathTimerState extends State<PathTimer>
    with AutomaticKeepAliveClientMixin {
  ScrollController _controller;
  List<List> assignToChildGorbalTime = [];

  List buttonAvailabilityList = [];

  void resetAssignToChildGorbalTime() {
    setState(() {
      assignToChildGorbalTime = [];
    });
  }

  void setPassInGorbalTime(inputIndex, inputStationName) {
    var changeTargetIndex = -3;
    setState(() {
      if (assignToChildGorbalTime.length == 0) {
        assignToChildGorbalTime.add([
          inputIndex,
          DateFormat('kkmm').format(DateTime.now()),
          inputStationName
        ]);
      } else {
        for (var i in assignToChildGorbalTime) {
          if (i[0] == inputIndex) {
            changeTargetIndex = assignToChildGorbalTime.indexOf(i);
            break;
          } else {
            changeTargetIndex = -2;
          }
        }
        if (changeTargetIndex == -2) {
          assignToChildGorbalTime.add([
            inputIndex,
            DateFormat('kkmm').format(DateTime.now()),
            inputStationName
          ]);
        } else if (changeTargetIndex != -3 && changeTargetIndex != -2) {
          assignToChildGorbalTime[changeTargetIndex][1] =
              DateFormat('kkmm').format(DateTime.now());
        }
      }
      assignToChildGorbalTime = bubbleSort(assignToChildGorbalTime);
    });
    convertResultToString(assignToChildGorbalTime);
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    widget.passInRetrieveResetAssignToChildGorbalTime(
        resetAssignToChildGorbalTime);
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
                        widget
                            .passInRetrieveTimeResult(assignToChildGorbalTime);
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
