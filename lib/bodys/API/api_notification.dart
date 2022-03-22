//@dart = 2.9
import 'dart:convert';

class notification {
  notification({
    this.notiId,
    this.pid,
    this.userId,
    this.notificationType,
    this.examDate,
    this.scheduleDatetime,
    this.status,
    this.createDate,
    this.updateDate,
    this.assessment,
  });
  int notiId;
  String pid;
  String userId;
  String notificationType;
  DateTime examDate;
  DateTime scheduleDatetime;
  String status;
  DateTime createDate;
  DateTime updateDate;
  String assessment;
  factory notification.fromJson(Map<String, dynamic> json) {
    return notification(
      notiId: json["notiId"] == null ? null : json["notiId"],
      pid: json["pid"] == null ? null : json["pid"],
      userId: json["userId"] == null ? null : json["userId"],
      notificationType:
          json["notificationType"] == null ? null : json["notificationType"],
      examDate:
          json["examDate"] == null ? null : DateTime.parse(json["examDate"]),
      scheduleDatetime: json["scheduleDatetime"] == null
          ? null
          : DateTime.parse(json["scheduleDatetime"]),
      status: json["status"] == null ? null : json["status"],
      createDate: json["createDate"] == null
          ? null
          : DateTime.parse(json["createDate"]),
      updateDate: json["updateDate"] == null
          ? null
          : DateTime.parse(json["updateDate"]),
      assessment: json["assessment"] == null ? null : json["assessment"],
    );
  }
}
