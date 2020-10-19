import 'package:flutter/material.dart';
import 'package:kmb/apiCall/getData/getData.dart';
import 'ListItem.dart';
// import 'package:kmb/ListItem.dart';
import 'package:intl/intl.dart';
import 'Helper.dart';
import 'ShowTimerResult/ConvertResultToString.dart';
import '../redux/reduxFileimport.dart';

class PathTimer extends StatefulWidget {
  final passInStopList;
  final passInController;
  final passInRetrieveTimeResult;
  final passInRetrieveResetAssignToChildGorbalTime;
  final passInPassInpassIndispatchUpdateAction;
  const PathTimer(
      {this.passInStopList,
      this.passInController,
      this.passInRetrieveTimeResult,
      this.passInRetrieveResetAssignToChildGorbalTime,
      this.passInPassInpassIndispatchUpdateAction});

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
    print("MOVING FUNCTIOn TESTING");
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
            ? Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        controller: _controller,
                        itemExtent: 60,
                        itemCount: widget.passInStopList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = widget.passInStopList[index];
                          return ListItem(
                              passInPathList: item,
                              passInIndex: index,
                              passInCheckAndSetTime: setPassInGorbalTime,
                              passInMoveDown: moveDown,
                              passInpassInPassInpassIndispatchUpdateAction:
                                  widget
                                      .passInPassInpassIndispatchUpdateAction);
                        },
                      ),
                    ),
                  ),
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
                  )
                ],
              )
            : Text("Error null here"));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
