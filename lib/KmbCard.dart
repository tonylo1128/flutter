import 'package:flutter/material.dart';

class KmbCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
          ),
          color: Colors.red,
          child: Center(
            child: Text("Mother Fucker !"),
          ),
        ));
  }
}
