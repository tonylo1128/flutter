import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kmb/redux/buttonAvailabilityList/UpdateButtonListAction.dart';
import 'package:kmb/redux/store.dart';

class ListItem extends StatefulWidget {
  final passInPathList;
  final passInIndex;
  final passInCheckAndSetTime;
  final passInMoveDown;
  final Function passInpassInPassInpassIndispatchUpdateAction;
  const ListItem(
      {this.passInPathList,
      this.passInIndex,
      this.passInCheckAndSetTime,
      this.passInMoveDown,
      this.passInpassInPassInpassIndispatchUpdateAction});

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<ListItem> {
  @override
  void initState() {
    print("i am in the init function of ListItem");
    print(widget.passInPathList);
    // print();
  }

  List time = [];
  var timeTemp;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: Column(
              children: [
                Text(
                  widget.passInPathList,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.timer),
                      onPressed: store.state.availableList[widget.passInIndex]
                                  [1] ==
                              true
                          ? () async => {
                                widget.passInCheckAndSetTime(
                                    widget.passInIndex, widget.passInPathList),
                                print("First gate"),
                                widget.passInMoveDown(60),
                                // await widget
                                //     .passInpassInPassInpassIndispatchUpdateAction(
                                //         widget.passInIndex),
                                print("Second gate"),
                                store.dispatch(
                                    UpdateButtonListAction(widget.passInIndex))
                              }
                          : null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
