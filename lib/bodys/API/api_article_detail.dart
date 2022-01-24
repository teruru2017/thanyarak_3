//@dart = 2.9
import 'dart:convert';

class ardetail {
  int id;
  String masterkey;
  String subject;
  String title;
  String html;
  String htmlname;
  String urlhtmlpath;
  String picname;
  String urlpicpath;
  String createby;
  DateTime createdate;
  DateTime lastmoddate;
  int createdateStt;
  int lastmoddateStt;
  String lastmodby;
  int view;

  ardetail({
    this.id,
    this.masterkey,
    this.subject,
    this.title,
    this.html,
    this.htmlname,
    this.urlhtmlpath,
    this.picname,
    this.urlpicpath,
    this.createby,
    this.createdate,
    this.lastmoddate,
    this.createdateStt,
    this.lastmoddateStt,
    this.lastmodby,
    this.view,
  });

  factory ardetail.fromJson(Map<String, dynamic> json) {
    return ardetail(
      id: json["id"] == null ? null : json["id"],
      masterkey: json["masterkey"] == null ? null : json["masterkey"],
      subject: json["subject"] == null ? null : json["subject"],
      title: json["title"] == null ? null : json["title"],
      html: json["html"] == null ? null : json["html"],
      htmlname: json["htmlname"] == null ? null : json["htmlname"],
      urlhtmlpath: json["urlhtmlpath"] == null ? null : json["urlhtmlpath"],
      picname: json["picname"] == null ? null : json["picname"],
      urlpicpath: json["urlpicpath"] == null ? null : json["urlpicpath"],
      createby: json["createby"] == null ? null : json["createby"],
      createdate: json["createdate"] == null
          ? null
          : DateTime.parse(json["createdate"]),
      lastmoddate: json["lastmoddate"] == null
          ? null
          : DateTime.parse(json["lastmoddate"]),
      createdateStt:
          json["createdate_stt"] == null ? null : json["createdate_stt"],
      lastmoddateStt:
          json["lastmoddate_stt"] == null ? null : json["lastmoddate_stt"],
      lastmodby: json["lastmodby"] == null ? null : json["lastmodby"],
      view: json["view"] == null ? null : json["view"],
    );
  }
}
