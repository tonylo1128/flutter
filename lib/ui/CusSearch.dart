import "package:flutter/material.dart";
import '../apiCall/getData/getData.dart';

class CusSearch extends SearchDelegate {
  //textfild label
  @override
  String get searchFieldLabel => 'Input keywords here';

  @override
  List<Widget> buildActions(BuildContext context) {
    //the button on the right hand side of the appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //the button on the left hand side of the appbar
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("No Suggestion");
  }

  @override
  Widget buildResults(BuildContext context) {
    search(query).then((value) {
      for (var item in value) {
        print(item.igLink);
      }
    });

    if (query == "tony") {
      return Column(
        children: <Widget>[
          Text("data"),
        ],
      );
    } else {
      return Text("No Result");
    }

    // throw UnimplementedError();
  }
}
