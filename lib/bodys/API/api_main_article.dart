//@dart = 2.9
import 'dart:convert';

class apiarticle {
  int id;
  String subject;
  String title;
  String picname;
  String urlpicpath;
  String createby;
  DateTime createdate;
  DateTime lastmoddate;
  int createdateStt;
  int lastmoddateStt;
  String lastmodby;
  int view;
  apiarticle({
    this.id,
    this.subject,
    this.title,
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

  factory apiarticle.fromJson(Map<String, dynamic> json) {
    return apiarticle(
      id: json["id"] == null ? null : json["id"],
      subject: json["subject"] == null ? null : json["subject"],
      title: json["title"] == null ? null : json["title"],
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
