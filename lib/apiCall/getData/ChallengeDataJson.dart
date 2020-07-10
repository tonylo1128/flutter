class ChallengeData {
  final String igLink;
  final String createdAt;
  final int id;
  final String updatedAt;
  final String remark;
  final String challangeable;
  final String status;
  final String direction;
  final String destination;
  final String endTime;
  final String totalTime;
  final String coOp;
  final String startingPoint;
  final String route;
  final String company;
  final String startTime;

  //constructor
  ChallengeData({
    this.igLink,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.remark,
    this.challangeable,
    this.status,
    this.direction,
    this.destination,
    this.endTime,
    this.totalTime,
    this.coOp,
    this.startingPoint,
    this.route,
    this.company,
    this.startTime,
  });

  //function to from a json ~
  factory ChallengeData.fromJson(Map<String, dynamic> json) {
    return ChallengeData(
      igLink: json["Instagram記錄連結"],
      createdAt: json["createdAt"],
      id: json["id"],
      updatedAt: json["updatedAt"],
      remark: json["備註"],
      challangeable: json["可挑戰"],
      status: json["完成挑戰"],
      direction: json["方向"],
      destination: json["目的地"],
      endTime: json["結束時間"],
      totalTime: json["總行程時間"],
      coOp: json["聯營"],
      startingPoint: json["起點"],
      route: json["路線"],
      company: json["路線所屬公司"],
      startTime: json["開始時間"],
    );
  }
}
