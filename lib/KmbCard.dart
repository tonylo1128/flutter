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
  double xPosition = 0;
  double yPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: yPosition,
        left: xPosition,
        child: GestureDetector(
            onPanUpdate: (tapInfo) {
              setState(() {
                xPosition += tapInfo.delta.dx;
                yPosition += tapInfo.delta.dy;
              });
            },
            child: SizedBox(
              width: 300,
              height: 300,
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
                        width: 200,
                        height: 100,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                          ),
                          child: Text(
                            widget.passInData.route,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  )),
            )));
  }
}
