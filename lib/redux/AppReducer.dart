import 'states.dart';
import 'buttonAvailabilityList/ButtonListReducer.dart';

ButtonListState appReducer(ButtonListState state, action) {
  print("WE ARE IN AppReducer~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ");
  return ButtonListState(
    availableList: buttonListReducerTesting(state.availableList, action),
  );
}
