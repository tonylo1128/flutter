import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kmb/apiCall/getData/ChallengeDataJson.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListAction.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListState.dart';
import 'package:kmb/redux/store.dart';
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

  var checkValue = store.state.availableList;

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
    );
  }
}

// Text(
//               checkValue[0],
//               // style: TextStyle(color: Colors.white),
//             ),
//             IconButton(
//                 icon: Icon(Icons.arrow_downward,color: Colors.white),
//                 onPressed: () => {
//                       StoreProvider.of<ButtonListState>(context)
//                           .dispatch(ButtonListAction(["DAMN IT2"]))
//                     }),
// MainBody(
//         passInData: result,
//         passIndispatchAction: dispatchAction,
//       ),

// Column(
//           children: <Widget>[
//             Text(
//               checkValue[0],
//               style: TextStyle(color: Colors.white),
//             ),
//             IconButton(
//                 icon: Icon(Icons.arrow_downward, color: Colors.white),
//                 onPressed: () => {
//                       StoreProvider.of<ButtonListState>(context)
//                           .dispatch(ButtonListAction(["DAMN IT233"])),
//                       print(
//                           "testing mother fucker ${store.state.availableList}"),
//                     }),
//             MainBody(
//               passInData: result,
//               passIndispatchAction: dispatchAction,
//             ),
//           ],
//         )
