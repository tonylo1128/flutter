import 'states.dart';
import 'buttonAvailabilityList/ButtonListReducer.dart';


ButtonListState appReducer(ButtonListState state, action){
  return ButtonListState(
    availableList: buttonListReducer(state.availableList, action),
  );
}