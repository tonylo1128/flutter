import 'states.dart';
import 'buttonAvailabilityList/ButtonListReducer.dart';
import 'searching/SearchingReducer.dart';

ButtonListState appReducer(ButtonListState state, action) {
  print("WE ARE IN AppReducer~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ");
  print(state);
  return ButtonListState(
    availableList: buttonListReducerTesting(state.availableList, action),
  );
}
