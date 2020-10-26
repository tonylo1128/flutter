import "package:flutter/material.dart";
import 'package:kmb/ui/RecordPage.dart';

class CusDrawer extends StatefulWidget {
  final passInRoute;
  final passInBound;
  final passInTimeResult;
  CusDrawer({this.passInBound, this.passInRoute, this.passInTimeResult});

  @override
  CusDrawerState createState() => CusDrawerState();
}

class CusDrawerState extends State<CusDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "Header",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          ListTile(
            title: Text("Texting 1"),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return RecordPage(
                    passInPassInRoute: widget.passInRoute,
                    passInPassInBound: widget.passInBound,
                    passInPassInTimeResult: widget.passInTimeResult,
                  );
                }),
              ),
            },
          ),
          ListTile(title: Text("Texting 2")),
          ListTile(title: Text("Texting 3")),
        ],
      ),
    );
  }
}
