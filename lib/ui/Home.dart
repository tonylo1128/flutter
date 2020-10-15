import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kmb/apiCall/getData/ChallengeDataJson.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListAction.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListState.dart';
import 'MainBody.dart';
import 'CusDrawer.dart';
import 'CusSearch.dart';
import 'NetworkCheck.dart';
import 'SearchTextField.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // NetworkCheck temp = NetworkCheck();
  // temp.check();

  bool searching = false;
  List<ChallengeData> result = [];

  void retrieveResult(resultFromChildWidget) {
    setState(() => {result = resultFromChildWidget});
    print(result.length);
  }

  dispatchAction(inputList) {
    StoreProvider.of<ButtonListState>(context)
        .dispatch(ButtonListAction(inputList));
  }

  // passInFunction: (resultFromChildWidget) => {
  //                     setState(() => {result = resultFromChildWidget})
  //                   }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: searching ? Colors.redAccent : Colors.black,
        title: searching
            ? SearchTextField(passInFunction: retrieveResult)
            : new Text("KMBPJ"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                searching = !searching;
              });
            },
          )
        ],
      ),
      drawer: CusDrawer(),
      body: MainBody(
        passInData: result,
        passIndispatchAction: dispatchAction,
      ),
      // MainBody(passInData: result)
    );
  }
}

// IconButton(
//           icon: Icon(Icons.arrow_downward),
//           onPressed: () => {
//                 print("fuhfuufufuf"),
//                 StoreProvider.of<ButtonListState>(context)
//                     .dispatch(ButtonListAction([]))
//               }),
