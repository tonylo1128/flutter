import 'package:redux/redux.dart';

final searchingReducer = TypedReducer<bool, dynamic>(setSearchingReducer);

bool setSearchingReducer(bool state, dynamic action) {
  print("I am in searching Reducer ar !!!!!!!!!!!!");
  return !state;
}
