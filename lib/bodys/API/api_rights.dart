//@dart=2.9
import 'dart:convert';

class RightsAPI {
  int id;
  String name;
  String viewOrder;
  RightsAPI({
    this.id,
    this.name,
    this.viewOrder,
  });

  factory RightsAPI.fromJson(Map<String, dynamic> json) {
    return RightsAPI(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      viewOrder: json["view_order"] == null ? null : json["view_order"],
    );
  }
}
