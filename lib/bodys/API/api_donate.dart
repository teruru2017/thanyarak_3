//@dart = 2.9
import 'dart:convert';

class apiDonate {
  int id;
  String subject;
  String title;
  String htmlname;
  String urlhtmlpath;
  String picname;
  String urlpicpath;
  String createby;
  DateTime createdate;
  DateTime lastmoddate;
  String lastmodby;

  apiDonate({
    this.id,
    this.subject,
    this.title,
    this.htmlname,
    this.urlhtmlpath,
    this.picname,
    this.urlpicpath,
    this.createby,
    this.createdate,
    this.lastmoddate,
    this.lastmodby,
  });

  factory apiDonate.fromJson(Map<String, dynamic> json) {
    return apiDonate(
      id: json["id"] == null ? null : json["id"],
      subject: json["subject"] == null ? null : json["subject"],
      title: json["title"] == null ? null : json["title"],
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
      lastmodby: json["lastmodby"] == null ? null : json["lastmodby"],
    );
  }
}
