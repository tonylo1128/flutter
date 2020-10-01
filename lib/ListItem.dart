import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final passInPathList;
  const ListItem({this.passInPathList});

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<ListItem> {
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
                      icon: Icon(Icons.timer),
                      onPressed: () => {print(context)},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
