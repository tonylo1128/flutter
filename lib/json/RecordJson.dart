class RecordJson {
  final String route;
  final String bound;
  final String serviceType;
  final List timerList;

  RecordJson({this.route, this.bound, this.serviceType, this.timerList});

  RecordJson.fromJson(Map<String, dynamic> json)
      : route = json['route'],
        bound = json['bound'],
        serviceType = json['serviceType'],
        timerList = json['timerList'];

  Map<String, dynamic> toJson() => {
        'route': route,
        'bound': bound,
        'serviceType': serviceType,
        'timeResult': timerList,
      };
}
