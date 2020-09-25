import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SearchTextField extends StatefulWidget {
  final Function passInFunction;

  const SearchTextField({this.passInFunction});

  @override
  SearchTextFieldState createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  final testController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    testController.dispose();
    super.dispose();
  }

  final FocusNode _focusNode = FocusNode();
  var _message;
  void _handleKeyEvent(RawKeyEvent event) {
    setState(() {
      if (event.logicalKey == LogicalKeyboardKey.keyQ) {
        _message = 'Pressed the "Q" key!';
        print(_message);
      } else {
        if (kReleaseMode) {
          _message =
              'Not a Q: Key label is "${event.logicalKey.keyLabel ?? '<none>'}"';

          print(_message);
        } else {
          // This will only print useful information in debug mode.
          _message = 'Not a Q: Pressed ${event.logicalKey.debugName}';
          print(_message);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: TextField(
        controller: testController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'input here to here',
        ),
      ),
    );
  }
}
