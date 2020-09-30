import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'apiCall/getData/ChallengeDataJson.dart';
import 'apiCall/getData/getData.dart';

typedef BusDataCallback = void Function(List<ChallengeData> resultInput);

class SearchTextField extends StatefulWidget {
  final BusDataCallback passInFunction;
  const SearchTextField({this.passInFunction});

  @override
  SearchTextFieldState createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  TextEditingController testController = TextEditingController();
  FocusNode _focusNode;
  Timer _debounce;

  handleOnChangeCallSearchApi() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      // do something with testController.text
      print("Here is the input " + testController.text);

      if (testController.text != null) {
        var temp = await search(testController.text);
        widget.passInFunction(temp);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    testController.addListener(handleOnChangeCallSearchApi);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    testController.dispose();
    _focusNode.dispose();
    testController.removeListener(handleOnChangeCallSearchApi);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new TextField(
      //controller can be replace by onChange, but controller allow us do more staff
      controller: testController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'input keywords here',
      ),
    );
  }
}
