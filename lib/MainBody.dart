import 'package:flutter/material.dart';
import 'KmbCard.dart';
import 'apiCall/getData/getData.dart';
import 'apiCall/getData/ChallengeDataJson.dart';

class MainBody extends StatefulWidget {
  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  var _apiReturnData = List<ChallengeData>();
  bool successfulDrop = false;
  var dragSuccessTemp;

  var font30White = TextStyle(
    fontSize: 30,
    color: Colors.white,
  );

  @override
  void initState() {
    fetchData().then((value) {
      print('Async done');
      _apiReturnData = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ogSize = MediaQuery.of(context).size;

    print(ogSize);

    return Column(
      children: <Widget>[
        // top part of the app(KMB Logo)
        Container(
          height: 100,
          margin: const EdgeInsets.only(
            top: 15,
          ),
          child: Align(
            alignment: Alignment.center,
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) => ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...(_apiReturnData as List<ChallengeData>)
                      .map((passInData) => Draggable(
                            data: passInData,
                            child: KmbCard(passInData: passInData),
                            feedback: KmbCard(passInData: passInData),

                            //allow us to if there are two widget scroll in a same direction, if yes can set affinity to limit it.
                            affinity: Axis.vertical,
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        ),
        // below code is the "display details part"
        Container(
          width: ogSize.width,
          height: MediaQuery.of(context).size.height - 210,
          margin: const EdgeInsets.only(
            top: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: DragTarget(
            builder:
                (context, List<ChallengeData> candidateData, rejectedData) {
              print("Hasnt get in onWillAccept and onAccept ar");
              return successfulDrop
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          dragSuccessTemp.startingPoint,
                          style: font30White,
                        ),
                        Text(
                          dragSuccessTemp.direction,
                          style: font30White,
                        ),
                        Text(
                          dragSuccessTemp.destination,
                          style: font30White,
                        ),
                      ],
                    )
                  : Align(
                      alignment: Alignment(0, 0),
                      child: Text(
                        'Empty dropzone',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
            },
            onWillAccept: (data) {
              print("onWillAccept");

              return true;
            },
            onAccept: (data) {
              print("onAccept");
              print(data.id);
              if (data.id != 0) {
                setState(() {
                  successfulDrop = true;
                  dragSuccessTemp = data;
                });
                return true;
              } else {
                return Text('Almost there !!!');
              }
            },
          ),
        )
      ],
    );
  }
}
