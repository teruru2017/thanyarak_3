//@dart = 2.9
import 'dart:convert';

class apibanner {
  String id;
  String name;
  String file;
  String urlpath;

  apibanner({
    this.id,
    this.name,
    this.file,
    this.urlpath,
  });

  factory apibanner.fromJson(Map<String, dynamic> json) {
    return apibanner(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      file: json["file"] == null ? null : json["file"],
      urlpath: json["urlpath"] == null ? null : json["urlpath"],
    );
  }
}
