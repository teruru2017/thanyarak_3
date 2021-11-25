class historys {
  int idset;
  String icon;
  String head;
  String dateTime;
  String Times;
  List<String> imgs;
  historys(
      this.idset, this.icon, this.head, this.Times, this.dateTime, this.imgs);
  static List<historys> generatehistorys() {
    return [
      historys(1, 'images/i_l_history.png', 'Ultrasound', '11:30 - 12:30 น.',
          '12/12/12', ['assets/images/t1.jpg', 'images/t2.jpg']),
      historys(2, 'images/i_l_history.png', 'Core Biopsy', '11:30 - 12:30 น.',
          '12/12/12', ['images/t1.jpg', 'assets/images/t2.jpg']),
      historys(
          3,
          'images/i_l_history.png',
          'Mammogram Ultrasound',
          '11:30 - 12:30 น.',
          '12/12/12',
          ['assets/images/t1.jpg', 'assets/images/t2.jpg']),
      historys(4, 'images/i_l_history.png', 'Core Biopsy', '11:30 - 12:30 น.',
          '12/12/12', ['images/t1.jpg', 'assets/images/t2.jpg']),
      historys(5, 'images/i_l_history.png', 'Ultrasound', '11:30 - 12:30 น.',
          '12/12/12', ['assets/images/t1.jpg', 'assets/images/t2.jpg']),
      historys(6, 'images/i_l_history.png', 'Ultrasound', '11:30 - 12:30 น.',
          '12/12/12', ['assets/images/t1.jpg', 'assets/images/t2.jpg'])
    ];
  }
}
