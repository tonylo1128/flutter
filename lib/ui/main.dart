import 'dart:ui';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/store.dart';
import 'package:flutter/material.dart';
import '../ui/Home.dart';
import 'Home.dart';

void main() {
  runApp(StoreProvider(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
