import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final passInPathList;
  final passInIndex;
  final passInCheckAndSetTime;
  final passInMoveDown;
  const ListItem(
      {this.passInPathList, this.passInIndex, this.passInCheckAndSetTime, this.passInMoveDown});

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<ListItem> {
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
                    onPressed: () => {
                      widget.passInCheckAndSetTime(
                          widget.passInIndex, widget.passInPathList),
                          widget.passInMoveDown(60),
                      // time.add(new DateTime.now()),
                      // print(widget.passInIndex)
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// for(var i in time){
//         if(time[time.indexOf(i)][0] != inputIndex){
//           print("not the same index, added now !");
//           time.add([inputIndex, new DateTime.now()]);
//         }
//         else{
//           print("Same index !!!");
//           print(i[0]);
//           print(inputIndex);
//           i[1] = new DateTime.now();
//         }
//       }
