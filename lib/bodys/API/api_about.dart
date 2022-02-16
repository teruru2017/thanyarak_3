//@dart = 2.9
import 'dart:convert';

class About {
  String html;
  String htmlname;
  String urlhtmlpath;
  About({
    this.html,
    this.htmlname,
    this.urlhtmlpath,
  });

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      html: json["html"] == null ? null : json["html"],
      htmlname: json["htmlname"] == null ? null : json["htmlname"],
      urlhtmlpath: json["urlhtmlpath"] == null ? null : json["urlhtmlpath"],
    );
  }
}
