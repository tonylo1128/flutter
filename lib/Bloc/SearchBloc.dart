import 'package:flutter/cupertino.dart';

class SearchBloc extends InheritedWidget {
  String keyword;
  bool searching = false;
  final Widget child;

  SearchBloc({this.keyword, this.searching, this.child});

  bool updateShouldNotify(SearchBloc oldWidget) {
    return keyword != null;
  }

  static SearchBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SearchBloc>();
  }
}
