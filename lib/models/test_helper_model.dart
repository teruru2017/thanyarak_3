import 'package:intl/intl.dart';

class Helper {
  Helper();

  String readTimestamp(int timestamp) {
    var now = new DateTime.now();
    var format = new DateFormat('HH:mm a');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' วันที่แล้ว';
      } else {
        time = diff.inDays.toString() + ' วันที่แล้ว';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' สัปดาห์ที่แล้ว';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' สัปดาห์ที่แล้ว';
      }
    }

    return time;
  }
}
