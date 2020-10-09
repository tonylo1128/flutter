import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:kmb/Home.dart';
import '../ui/Home.dart';
import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
