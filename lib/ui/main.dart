import 'dart:ui';
import 'package:flutter_redux/flutter_redux.dart';
// import '../redux/store.dart';
import 'package:flutter/material.dart';
import 'package:kmb/redux/AppReducer.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListState.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
