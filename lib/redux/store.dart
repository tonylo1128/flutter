import 'AppReducer.dart';
import 'package:redux/redux.dart';
import 'states.dart';

final store = Store<ButtonListState>(
  appReducer,
  initialState: ButtonListState(
      availableList: [":Damn it, i am still in initialState ! ! ! !"]),
);
