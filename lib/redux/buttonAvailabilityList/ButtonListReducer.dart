import 'package:kmb/redux/buttonAvailabilityList/ButtonListState.dart';
import 'package:redux/redux.dart';
import 'ButtonListAction.dart';

final buttonListReducerTesting =
    TypedReducer<List, ButtonListAction>(_buttonListActionReducer);

List _buttonListActionReducer(List state, ButtonListAction action) {
  if (action is ButtonListAction) {
    print("I am in reducer ar ahahahahhaahahaahahahahahahahahahahahahahaahah");
    var temooooo = action.stopsFromApicall;
    print("testing 1: $state");
    print("testing 2: $temooooo");

    state = action.stopsFromApicall;
    print(state);
    // return ButtonListState(availableList: action.stopsFromApicall)
    return action.stopsFromApicall;
  }

  return action.stopsFromApicall;
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
