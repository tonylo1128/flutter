import 'package:flutter/material.dart';

class KmbCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 350,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(175),
          ),
          color: Colors.red,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 100,
                child: Image.network(
                    "https://t6.rbxcdn.com/41f3702acfff23d966b3f4d8a1121203"),
              ),
              SizedBox(
                width: 300,
                height: 100,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  child: Text("Mother Fukcer ! ! !"),
                ),
              ),
            ],
          )),
    );
  }
}

// Align(
//           alignment: Alignment.center,
//           child: Text("My Text"),
//         ),
