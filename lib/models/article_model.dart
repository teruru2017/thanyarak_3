class Article {
  String icon;
  String head;
  String details;
  String dateTime;
  num review;
  List<String> imgs;
  Article(this.icon, this.head, this.details, this.review, this.dateTime,
      this.imgs);
  static List<Article> generateArticle() {
    return [
      Article(
          'images/tt1.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          100,
          '12/12/12',
          ['assets/images/t1.jpg', 'images/t2.jpg']),
      Article(
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          100,
          '12/12/12',
          ['images/t1.jpg', 'assets/images/t2.jpg']),
      Article(
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          100,
          '12/12/12',
          ['assets/images/t1.jpg', 'assets/images/t2.jpg']),
      Article(
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          100,
          '12/12/12',
          ['images/t1.jpg', 'assets/images/t2.jpg']),
      Article(
          'images/tt.png',
          'ศูนย์ถันยรักษ์ได้จัดกิจกรรม',
          'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัล',
          100,
          '12/12/12',
          ['assets/images/t1.jpg', 'assets/images/t2.jpg'])
    ];
  }
}
