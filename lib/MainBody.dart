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
    return Container(
      height: 100,
      child: Align(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) => ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...(_apiReturnData as List<ChallengeData>)
                  .map(
                    (passInData) => KmbCard(passInData: passInData),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
