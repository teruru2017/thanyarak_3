//@dart = 2.9
import 'dart:convert';

class apiAR {
  int cmsId;
  String masterKey;
  String subject;
  String title;
  String pictureName;
  String createBy;
  DateTime createDate;
  DateTime lastModifyDate;
  int createDateStt;
  int lastModifyDateStt;
  String lastModifyBy;
  int view;
  String picturePath;
  apiAR({
    this.cmsId,
    this.masterKey,
    this.subject,
    this.title,
    this.pictureName,
    this.createBy,
    this.createDate,
    this.lastModifyDate,
    this.createDateStt,
    this.lastModifyDateStt,
    this.lastModifyBy,
    this.view,
    this.picturePath,
  });

  factory apiAR.fromJson(Map<String, dynamic> json) {
    return apiAR(
      cmsId: json["cmsId"] == null ? null : json["cmsId"],
      masterKey: json["masterKey"] == null ? null : json["masterKey"],
      subject: json["subject"] == null ? null : json["subject"],
      title: json["title"] == null ? null : json["title"],
      pictureName: json["pictureName"] == null ? null : json["pictureName"],
      createBy: json["createBy"] == null ? null : json["createBy"],
      createDate: json["createDate"] == null
          ? null
          : DateTime.parse(json["createDate"]),
      lastModifyDate: json["lastModifyDate"] == null
          ? null
          : DateTime.parse(json["lastModifyDate"]),
      createDateStt:
          json["createDateSTT"] == null ? null : json["createDateSTT"],
      lastModifyDateStt:
          json["lastModifyDateSTT"] == null ? null : json["lastModifyDateSTT"],
      lastModifyBy: json["lastModifyBy"] == null ? null : json["lastModifyBy"],
      view: json["view"] == null ? null : json["view"],
      picturePath: json["PicturePath"] == null ? null : json["PicturePath"],
    );
  }
}
