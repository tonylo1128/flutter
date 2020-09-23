import "package:flutter/material.dart";

class CusDrawer extends StatelessWidget {
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
          ListTile(title: Text("Texting 1")),
          ListTile(title: Text("Texting 2")),
          ListTile(title: Text("Texting 3")),
        ],
      ),
    );
  }
}
