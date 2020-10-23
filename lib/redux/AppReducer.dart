import 'package:kmb/redux/buttonAvailabilityList//ButtonListAction.dart';

import 'buttonAvailabilityList/UpdateButtonListAction.dart';
import 'states.dart';
import 'buttonAvailabilityList/ButtonListReducer.dart';
import 'searching/SearchingReducer.dart';

ButtonListState appReducer(dynamic state, action) {
  print("WE ARE IN AppReducer~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ");
  var tempState;

  if (action is ButtonListAction) {
    print("MOTHER FUCKERRRRRRRRRRRRRRRRRRRRRR");
    print("DLLMMMMMMMMMMMMMMMMM");
    var actionTemp = action.stopsFromApicall;
    var newAvailableList = [];

    for (int i = 0; i < actionTemp.length; i++) {
      if (i == 0) {
        newAvailableList.add([i, true]);
      } else {
        newAvailableList.add([i, false]);
      }
    }
    print(newAvailableList);

    tempState = newAvailableList;
  }

  if (action is UpdateButtonListAction) {
    print("I am in reducer but an other aciotn arrrrrrrrrrrr");
    var targetIndex = action.index;

    print(targetIndex);
    print(state.availableList);

    if (state.availableList[targetIndex][0] == targetIndex &&
        state.availableList[targetIndex][1] == true) {
      var temp = state.availableList;
      if (targetIndex + 1 <= state.availableList.length - 1) {
        temp[targetIndex + 1][1] = true;
        tempState = temp;
      } else {
        temp[targetIndex][1] = true;
        tempState = temp;
      }
    }
  }

  return ButtonListState(
    availableList: tempState,
  );
}
