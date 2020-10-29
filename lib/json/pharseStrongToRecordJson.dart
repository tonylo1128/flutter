import 'package:intl/intl.dart';

pharseStrongToRecordJson(route, boundInfo, timerList) {
  String jsonString;

  var now = DateFormat('yyyy-MM-dd H:M:S').format(new DateTime.now());
  print(now);

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
      "\"createDate\":" +
      "\"" +
      now.toString() +
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
  print("This is pharseStrongToRecordJson function");
  print(jsonString);
  return jsonString;
}
