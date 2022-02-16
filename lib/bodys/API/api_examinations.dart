//@dart=2.9
import 'dart:convert';

class Examinations {
  String id;
  DateTime examDate;
  String examType;
  dynamic examResult;
  Location location;

  Examinations({
    this.id,
    this.examDate,
    this.examType,
    this.examResult,
    this.location,
  });

  factory Examinations.fromJson(Map<String, dynamic> json) {
    return Examinations(
      id: json["id"] == null ? null : json["id"],
      examDate:
          json["exam_date"] == null ? null : DateTime.parse(json["exam_date"]),
      examType: json["exam_type"] == null ? null : json["exam_type"],
      examResult: json["exam_result"],
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
    );
  }
}

class Location {
  Location({
    this.id,
    this.name,
    this.mapLink,
  });

  int id;
  String name;
  String mapLink;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      mapLink: json["map_link"] == null ? null : json["map_link"],
    );
  }
}
