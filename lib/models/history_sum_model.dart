class historysSum {
  int idset;
  String icon;
  String head;
  String dateTime;
  String Times;
  List<String> imgs;
  historysSum(
      this.idset, this.icon, this.head, this.Times, this.dateTime, this.imgs);
  static List<historysSum> generatehistoryssum() {
    return [
      historysSum(1, 'images/i_l_history.png', 'Ultrasound', '11:30 - 12:30 น.',
          '12/12/12', ['assets/images/t1.jpg', 'images/t2.jpg']),
      historysSum(
          2,
          'images/i_l_history_g.png',
          'Core Biopsy',
          '11:30 - 12:30 น.',
          '12/12/12',
          ['images/t1.jpg', 'assets/images/t2.jpg']),
      historysSum(
          3,
          'images/i_l_history_r.png',
          'Mammogram Ultrasound',
          '11:30 - 12:30 น.',
          '12/12/12',
          ['assets/images/t1.jpg', 'assets/images/t2.jpg']),
      historysSum(
          4,
          'images/i_l_history.png',
          'Core Biopsy',
          '11:30 - 12:30 น.',
          '12/12/12',
          ['images/t1.jpg', 'assets/images/t2.jpg']),
      historysSum(
          5,
          'images/i_l_history_g.png',
          'Ultrasound',
          '11:30 - 12:30 น.',
          '12/12/12',
          ['assets/images/t1.jpg', 'assets/images/t2.jpg']),
      historysSum(
          6,
          'images/i_l_history_r.png',
          'Ultrasound',
          '11:30 - 12:30 น.',
          '12/12/12',
          ['assets/images/t1.jpg', 'assets/images/t2.jpg'])
    ];
  }
}
