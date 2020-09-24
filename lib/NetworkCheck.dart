import 'package:connectivity/connectivity.dart';

class NetworkCheck {
  Future<String> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Mobile");
      return "Mobile";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Wifi");
      return "Wifi";
    }
    print("None");
    return "none";
  }

  dynamic checkInternet(Function func) {
    check().then((intenet) {
      if (intenet != null && intenet != "none") {
        func(true);
      } else {
        func(false);
      }
    });
  }
}
