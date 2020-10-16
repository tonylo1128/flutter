import 'package:kmb/redux/buttonAvailabilityList/ButtonListState.dart';
import 'package:redux/redux.dart';
import 'ButtonListAction.dart';

final buttonListReducerTesting =
    TypedReducer<List, ButtonListAction>(buttonListActionReducer);

List buttonListActionReducer(List state, ButtonListAction action) {
  if (action is ButtonListAction) {
    // print("I am in reducer ar ahahahahhaahahaahahahahahahahahahahahahahaahah");
    var temooooo = action.stopsFromApicall;
    // print("testing 1: $state");
    // print("testing 2: $temooooo");

    state = temooooo;
    // var testing = state.availableList;
    print("I am in ButtonListReducer, and the value is  : $state");
    return temooooo;
  }
  return ["I am in reducer and outside of IF !!!!"];
  // return action.stopsFromApicall;
}

// ButtonListState buttonListReducerTesting(
//     ButtonListState state, ButtonListAction action) {
//   if (action is ButtonListAction) {
//     print("I am in reducer ar ahahahahhaahahaahahahahahahahahahahahahahaahah");
//     var temooooo = action.stopsFromApicall;
//     print("testing 1: $state");
//     print("testing 2: $temooooo");

//     print(state);

//     return ButtonListState(
//       availableList: action.stopsFromApicall,
//     );
//     // return ButtonListState(availableList: action.stopsFromApicall)
//   }

//   return state;
// }
