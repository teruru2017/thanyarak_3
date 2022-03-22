//@dart = 2.9
import 'dart:convert';

class Arhighlight {
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
  String htmlName;
  String urlHtmlPath;
  String html;
  Arhighlight({
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
    this.htmlName,
    this.urlHtmlPath,
    this.html,
  });

  factory Arhighlight.fromJson(Map<String, dynamic> json) {
    return Arhighlight(
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
      htmlName: json["htmlName"] == null ? null : json["htmlName"],
      urlHtmlPath: json["urlHtmlPath"] == null ? null : json["urlHtmlPath"],
      html: json["html"] == null ? null : json["html"],
    );
  }
}
