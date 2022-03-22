//@dart = 2.9
import 'dart:convert';

class apiDonateGET {
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

  apiDonateGET({
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

  factory apiDonateGET.fromJson(Map<String, dynamic> json) {
    return apiDonateGET(
      id: json["id"],
      subject: json["subject"],
      title: json["title"],
      picname: json["picname"],
      urlpicpath: json["urlpicpath"],
      createby: json["createby"],
      createdate: DateTime.parse(json["createdate"]),
      lastmoddate: DateTime.parse(json["lastmoddate"]),
      createdateStt: json["createdate_stt"],
      lastmoddateStt: json["lastmoddate_stt"],
      lastmodby: json["lastmodby"],
      view: json["view"],
    );
  }
}
