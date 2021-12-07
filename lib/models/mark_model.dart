class Marks {
  String id;
  String type;
  String name;
  String date;
  String time;
  bool value;
  Marks(this.id, this.type, this.name, this.date, this.time,
      {this.value = false});

  static List<Marks> generateMarksAll() {
    return [
      Marks('1', 'cancel', 'Test01', '16 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('2', 'succ', 'Test02', '15 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('3', 'succ', 'Test03', '06 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('4', 'last', 'Test04', '22 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('5', 'last', 'Test05', '08 มิ.ย. 2564', '12:30 - 13:30 น.'),
      Marks('6', 'cancel', 'Test06', '16 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('7', 'cancel', 'Test07', '30 มิ.ย. 2564', '13:30 - 14:30 น.'),
      Marks('8', 'cancel', 'Test08', '25 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('9', 'cancel', 'Test09', '17 มิ.ย. 2564', '09:30 - 10:30 น.'),
    ];
  }

  static List<Marks> generateMarksSucc() {
    return [
      Marks('2', 'succ', 'Test02', '15 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('3', 'succ', 'Test03', '06 มิ.ย. 2564', '11:30 - 12:30 น.'),
    ];
  }

  static List<Marks> generateMarksCancel() {
    return [
      Marks('1', 'cancel', 'Test01', '16 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('6', 'cancel', 'Test06', '16 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('7', 'cancel', 'Test07', '30 มิ.ย. 2564', '13:30 - 14:30 น.'),
      Marks('8', 'cancel', 'Test08', '25 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('9', 'cancel', 'Test09', '17 มิ.ย. 2564', '09:30 - 10:30 น.'),
    ];
  }

  static List<Marks> generateMarksLast() {
    return [
      Marks('4', 'last', 'Test04', '22 มิ.ย. 2564', '11:30 - 12:30 น.'),
      Marks('5', 'last', 'Test05', '08 มิ.ย. 2564', '12:30 - 13:30 น.'),
    ];
  }
}
