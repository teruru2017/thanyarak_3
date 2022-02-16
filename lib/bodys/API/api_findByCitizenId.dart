//@dart=2.9
import 'dart:convert';

class FindByCitizenId {
  String pid;
  String hn;
  String citizenId;
  String prefix;
  String name;
  String surname;
  DateTime dob;
  String address;
  String subDistrict;
  String district;
  String province;
  String zip;
  String mobile;
  String email;
  String lastExamDate;
  FindByCitizenId({
    this.pid,
    this.hn,
    this.citizenId,
    this.prefix,
    this.name,
    this.surname,
    this.dob,
    this.address,
    this.subDistrict,
    this.district,
    this.province,
    this.zip,
    this.mobile,
    this.email,
    this.lastExamDate,
  });

  factory FindByCitizenId.fromJson(Map<String, dynamic> json) {
    return FindByCitizenId(
      pid: json["pid"] == null ? null : json["pid"],
      hn: json["hn"] == null ? null : json["hn"],
      citizenId: json["citizenId"] == null ? null : json["citizenId"],
      prefix: json["prefix"] == null ? null : json["prefix"],
      name: json["name"] == null ? null : json["name"],
      surname: json["surname"] == null ? null : json["surname"],
      dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
      address: json["address"] == null ? null : json["address"],
      subDistrict: json["sub_district"] == null ? null : json["sub_district"],
      district: json["district"] == null ? null : json["district"],
      province: json["province"] == null ? null : json["province"],
      zip: json["zip"] == null ? null : json["zip"],
      mobile: json["mobile"] == null ? null : json["mobile"],
      email: json["email"] == null ? null : json["email"],
      lastExamDate:
          json["last_exam_date"] == null ? null : json["last_exam_date"],
    );
  }
}
