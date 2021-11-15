class Article {
  int idset;
  String icon;
  String head;
  String details;
  String dateTime;
  String review;
  List<String> imgs;
  Article(this.idset, this.icon, this.head, this.details, this.review,
      this.dateTime, this.imgs);
  static List<Article> generateArticle() {
    return [
      Article(
          1,
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          '100',
          '12/12/12',
          ['assets/images/t1.jpg', 'images/t2.jpg']),
      Article(
          2,
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          '100',
          '12/12/12',
          ['images/t1.jpg', 'assets/images/t2.jpg']),
      Article(
          3,
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          '100',
          '12/12/12',
          ['assets/images/t1.jpg', 'assets/images/t2.jpg']),
      Article(
          4,
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          '100',
          '12/12/12',
          ['images/t1.jpg', 'assets/images/t2.jpg']),
      Article(
          5,
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          '100',
          '12/12/12',
          ['assets/images/t1.jpg', 'assets/images/t2.jpg'])
    ];
  }
}
