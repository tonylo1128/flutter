import 'dart:ui';
import 'package:flutter_redux/flutter_redux.dart';
// import '../redux/store.dart';
import 'package:flutter/material.dart';
import 'package:kmb/redux/AppReducer.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListAction.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListState.dart';
import 'package:kmb/redux/store.dart';
import 'package:redux/redux.dart';
import '../ui/Home.dart';
import 'Home.dart';

void main() {
  final store = Store<ButtonListState>(
    appReducer,
    initialState: ButtonListState(availableList: ["initialState:testing~"]),
  );

  runApp(StoreProvider(store: store, child: MyApp()));
  print('Initial state: ${store.state.availableList}');
}

class MyApp extends StatelessWidget {
  var checkValue = store.state.availableList;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.red,
          body: StoreConnector<ButtonListState, List>(
            converter: (Store<ButtonListState> store) =>
                store.state.availableList,
            builder: (BuildContext cintext, List availableList) {
              return Column(
                children: <Widget>[
                  Text(
                    checkValue[0],
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_downward, color: Colors.white),
                    onPressed: () => {
                      StoreProvider.of<ButtonListState>(context)
                          .dispatch(ButtonListAction(["DAMN IT233"])),
                      print(
                          "testing mother fucker ${store.state.availableList}"),
                    },
                  ),
                ],
              );
            },
          )),
    );
  }
}

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
