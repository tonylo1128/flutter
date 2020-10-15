import 'states.dart';
import 'buttonAvailabilityList/ButtonListReducer.dart';

ButtonListState appReducer(ButtonListState state, action) {
  print("diuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");

  return new ButtonListState(
    availableList: buttonListReducerTesting(state.availableList, action),
  );
}
