//@dart=2.9
import 'dart:convert';

class Appointments_SS {
  int id;
  String datetime;
  Location location;
  String status;

  Appointments_SS({
    this.id,
    this.datetime,
    this.location,
    this.status,
  });

  factory Appointments_SS.fromJson(Map<String, dynamic> json) {
    return Appointments_SS(
      id: json["id"] == null ? null : json["id"],
      datetime: json["datetime"] == null ? null : json["datetime"],
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      status: json["status"] == null ? null : json["status"],
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
