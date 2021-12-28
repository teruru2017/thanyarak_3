//@dart = 2.9
import 'dart:convert';

class ardetail {
  String id;
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
  String lastmodby;
  String view;

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
      lastmodby: json["lastmodby"] == null ? null : json["lastmodby"],
      view: json["view"] == null ? null : json["view"],
    );
  }
}
