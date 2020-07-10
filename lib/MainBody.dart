import 'package:flutter/material.dart';
import 'KmbCard.dart';
import 'apiCall/getData/getData.dart';
import 'apiCall/getData/ChallengeDataJson.dart';

class MainBody extends StatefulWidget {
  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  var apiReturnData = List<ChallengeData>();

  @override
  void initState() {
    fetchData().then((value) {
      print('Async done');
      apiReturnData = value;
    });
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              ...(apiReturnData as List<ChallengeData>)
                  .map(
                    (passInData) => KmbCard(passInData: passInData),
                  )
                  .toList()
            ],
          )),
    );
  }
}
