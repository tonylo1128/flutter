bubbleSort(inputList) {
  var temp;
  bool swipped = false;
  for (int i = 0; i < inputList.length; i++) {
    for (int time = 0; time < inputList.length - 1; time++) {
      if (inputList[time][0] > inputList[time + 1][0]) {
        temp = inputList[time];
        inputList[time] = inputList[time + 1];
        inputList[time + 1] = temp;
        swipped = true;
      }
    }
    if (swipped == false) {
      break;
    }
  }
  return inputList;
}
