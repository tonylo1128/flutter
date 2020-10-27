pharseStrongToRecordJson(route, boundInfo, timerList) {
  String jsonString;

  String temp = "";
  jsonString = "{" +
      "\"route\":" +
      "\"" +
      route.toString() +
      "\"" +
      "," +
      "\"bound\":" +
      "\"" +
      boundInfo[0].toString() +
      "\"" +
      "," +
      "\"serviceType\":" +
      "\"" +
      boundInfo[1].toString() +
      "\"" +
      "," +
      "\"timerList\":" +
      "[";

  for (var item in timerList) {
    print(timerList.length);
    print(timerList.indexOf(item));
    temp = temp +
        "{" +
        "\"time\":" +
        "\"" +
        item[1].toString() +
        "\"" +
        "," +
        "\"station\":" +
        "\"" +
        item[2].toString() +
        "\"" +
        "}";
    if (timerList.length != timerList.indexOf(item) + 1) {
      temp = temp + ",";
    }
  }

  jsonString = jsonString + temp + "]" + "}";
  print("Tstingggggggggggggggg");
  print(jsonString);
  return jsonString;
}
