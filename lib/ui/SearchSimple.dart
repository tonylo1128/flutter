import "package:flutter/material.dart";

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    print("At least i am in ACTIONS");

    return [
      IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            showSuggestions(context);
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    print("At least i am in LEADING");
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Container();
  }
}
