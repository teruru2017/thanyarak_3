//@dart=2.9
import 'dart:convert';

class ScheduleDate {
  DateTime date;
  bool isHoliday;
  List<Timeslot> timeslots;

  ScheduleDate({
    this.date,
    this.isHoliday,
    this.timeslots,
  });

  factory ScheduleDate.fromJson(Map<String, dynamic> json) {
    return ScheduleDate(
      date: json["date"] == null ? null : DateTime.parse(json["date"]),
      isHoliday: json["is_holiday"] == null ? null : json["is_holiday"],
      timeslots: json["timeslots"] == null
          ? null
          : List<Timeslot>.from(
              json["timeslots"].map((x) => Timeslot.fromJson(x))),
    );
  }
}

class Timeslot {
  Timeslot({
    this.time,
    this.available,
  });

  String time;
  String available;

  factory Timeslot.fromJson(Map<String, dynamic> json) {
    return Timeslot(
      time: json["time"] == null ? null : json["time"],
      available: json["available"] == null ? null : json["available"],
    );
  }
}
