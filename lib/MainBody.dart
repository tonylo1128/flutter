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

  @override
  void initState() {
    fetchData().then((value) {
      print('Async done');
      _apiReturnData = value;
    });
    super.initState();
  }

  @override
  build(BuildContext context) {
    var ogSize = MediaQuery.of(context).size;

    print(ogSize);

    return Column(
      children: <Widget>[
        Container(
          height: 100,
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
        Container(
          width: ogSize.width,
          height: ogSize.height - 185,
          margin: const EdgeInsets.only(
            top: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: DragTarget(
            builder:
                (context, List<ChallengeData> candidateData, rejectedData) {
              print("Hasnt get in onWillAccept and onAccept ar");
              return successfulDrop
                  ? Align(
                      alignment: Alignment(0, 0),
                      child: Text(
                        dragSuccessTemp.destination,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment(0, 0),
                      child: Text('Empty dropzone'),
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
