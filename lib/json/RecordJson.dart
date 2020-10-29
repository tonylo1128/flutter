class RecordJson {
  final String route;
  final String bound;
  final String serviceType;
  final String createDate;
  final List timerList;

  RecordJson(
      {this.route,
      this.bound,
      this.serviceType,
      this.createDate,
      this.timerList});

  RecordJson.fromJson(Map<String, dynamic> json)
      : route = json['route'],
        bound = json['bound'],
        serviceType = json['serviceType'],
        createDate = json['createDate'],
        timerList = json['timerList'];

  Map<String, dynamic> toJson() => {
        'route': route,
        'bound': bound,
        'serviceType': serviceType,
        'createDate': createDate,
        'timeResult': timerList,
      };
}
