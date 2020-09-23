import "package:flutter/material.dart";

class CusSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("data"),
      ],
    );
    // throw UnimplementedError();
  }
}
