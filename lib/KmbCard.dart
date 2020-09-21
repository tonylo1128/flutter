import 'package:flutter/material.dart';
// import 'apiCall/getData/getData.dart';
import 'apiCall/getData/ChallengeDataJson.dart';

class KmbCard extends StatefulWidget {
  final ChallengeData passInData;

  const KmbCard({this.passInData});

  // final String serverIP;

  // const ServerIpText ({ Key key, this.serverIP }): super(key: key);

  @override
  KmbCardState createState() => KmbCardState();
}

class KmbCardState extends State<KmbCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, -1),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.black,
                  ),
              width: 50,
              height: 40,
              child: Image.network(
                  "https://t6.rbxcdn.com/41f3702acfff23d966b3f4d8a1121203"),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.02),
            child: Container(
              width: 60,
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  widget.passInData.route,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
