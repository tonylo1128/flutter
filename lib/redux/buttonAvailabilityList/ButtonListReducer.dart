import 'package:redux/redux.dart';
import 'UpdateButtonListAction.dart';

final buttonListReducerTesting =
    TypedReducer<List, dynamic>(buttonListActionReducer);

List buttonListActionReducer(List state, action) {
  // if (action is ButtonListAction) {
  //   print("I am in reducer ar ahahahahhaahahaahahahahahahahahahahahahahaahah");
  //   print(
  //       "I am in ButtonListReducer, and the current state is (before i changed it)  : $state");

  //   var actionTemp = action.stopsFromApicall;
  //   var newAvailableList = [];
  //   print(actionTemp);

  //   for (int i = 0; i < actionTemp.length; i++) {
  //     if (i == 0) {
  //       newAvailableList.add([i, true]);
  //     } else {
  //       newAvailableList.add([i, false]);
  //     }
  //   }
  //   print(newAvailableList);

  //   return newAvailableList;
  // }
  if (action is UpdateButtonListAction) {
    print("I am in reducer but an other aciotn arrrrrrrrrrrr");
    var targetIndex = action.index;

    if (state[targetIndex][0] == targetIndex && state[targetIndex][1] == true) {
      var temp = state;
      if (targetIndex + 1 <= state.length - 1) {
        temp[targetIndex + 1][1] = true;
        return temp;
      } else {
        temp[targetIndex][1] = true;
        return temp;
      }
    }
  }
  print(action);
  print(state);
  return ["I am in reducer and outside of IF !!!!"];
  // return action.stopsFromApicall;
}
