import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:thanyarak/bodys/about_page.dart';
// import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_circular.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:thanyarak/widgets/show_title_head.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

void results() {
  SignInPage();
}

class _MainPageState extends State<MainPage> {
  List<String> banners = [
    'images/topgraphic.png',
    'images/topgraphic.png',
    'images/topgraphic.png',
  ];
  List<Widget> widgets = [];
  List<String> pathImageAritcles = [
    'images/t1.jpg',
    'images/t2.jpg',
    'images/t1.jpg',
    'images/t2.jpg'
  ];
  List<String> titleAritcles = [
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ111',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ222',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ333',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ444',
  ];
  List<String> detailAritcles = [
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ มันได้กลายมาเป็นเนื้อหาจำลองมาตรฐานของธุรกิจดังกล่าวมาตั้งแต่ศตวรรษที่ 16',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ มันได้กลายมาเป็นเนื้อหาจำลองมาตรฐานของธุรกิจดังกล่าวมาตั้งแต่ศตวรรษที่ 16',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ มันได้กลายมาเป็นเนื้อหาจำลองมาตรฐานของธุรกิจดังกล่าวมาตั้งแต่ศตวรรษที่ 16',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ มันได้กลายมาเป็นเนื้อหาจำลองมาตรฐานของธุรกิจดังกล่าวมาตั้งแต่ศตวรรษที่ 16'
  ];
  List<String> dataAritcles = [
    '16-6-25564',
    '17-6-25564',
    '18-6-25564',
    '18-6-25564'
  ];
  List<String> viewAritcles = [
    'ผู้เข้าชม 123k',
    'ผู้เข้าชม 123k',
    'ผู้เข้าชม 123k',
    'ผู้เข้าชม 123k'
  ];
  int _currentIndex = 0;
  int _volume = 0;
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loopCreateBanner();
  }

  void loopCreateBanner() {
    for (var item in banners) {
      setState(() {
        widgets.add(createBannerWidget(item));
      });
    }
  }

  Widget createBannerWidget(String path) => Image.asset(path);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHead(),
            builBanner(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: banners.map((urlOfItem) {
            //     int index = banners.indexOf(urlOfItem);
            //     return Container(
            //       width: 10.0,
            //       height: 10.0,
            //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: _currentIndex == index
            //             ? Color.fromRGBO(242, 145, 163, 1)
            //             : Color.fromRGBO(0, 136, 192, 1),
            //       ),
            //     );
            //   }).toList(),
            // ),
            buildContent(),
            const ShowHead(title: 'บทความ', pathIcon: 'images/article.png'),
            listArticle(),
            const ShowHead(
                title: 'โปรโมชั่นร้านค้า', pathIcon: 'images/shop.png'),
            builBanner(),
            const ShowHead(
                title: 'มูลนิธิถันยรักษ์', pathIcon: 'images/shop.png'),
            buildAboutMe(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Padding buildAboutMe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: MyConstant.myBlue2,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    child: Image.asset('images/tt.png'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowTitle(
                    title: 'เกี่ยวกับเรา',
                    textStyle: MyConstant().h3StyleWeigth(),
                  ),
                  ShowTitle(
                    title: 'ประวัติความเป็นมา',
                    textStyle: MyConstant().h3StyleWeigth(),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //         builder: (context) => AboutPage()));
                    },
                    child: ShowTitle(
                      title: 'ดูทั้งหมด',
                      textStyle: MyConstant().h2StyleBlue(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox listArticle() {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: pathImageAritcles.length,
        itemBuilder: (context, index) => Card(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(
                    pathImageAritcles[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ShowTitle(
                  title: cutWordH(titleAritcles[index]),
                  textStyle: MyConstant().h2StyleBlue(),
                ),
              ),
            ),
            Container(
              width: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ShowTitle(
                  title: cutWord(detailAritcles[index]),
                  textStyle: MyConstant().h4StyleBlack(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 4, 4),
                  child: SvgPicture.asset('images/c1.svg'),
                ),
                ShowTitle(
                  title: dataAritcles[index],
                  textStyle: MyConstant().h4StyleGley(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
                  child: SvgPicture.asset('images/v2.svg'),
                ),
                ShowTitle(
                  title: viewAritcles[index],
                  textStyle: MyConstant().h4StyleGley(),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Container buildContent() {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/main_body.png'), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          const ShowHead(title: 'การนัดหมาย', pathIcon: 'images/calendar.png'),
          buildNonAppointCard(),
          groupIcon(),
        ],
      ),
    );
  }

  Padding groupIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [requirResult(), addAppointMent(), myNotification()],
      ),
    );
  }

  Column requirResult() {
    return Column(
      // child: GestureDetector(

      children: [
        Image.asset('images/list.png'),
        const SizedBox(
          height: 5,
        ),
        ShowTitle(
          title: 'ขอผลตรวจ',
          textStyle: MyConstant().h4StyleBlack(),
        ),
      ],
    );
  }

  Column addAppointMent() {
    return Column(
      children: [
        Image.asset('images/calenda.png'),
        const SizedBox(
          height: 5,
        ),
        ShowTitle(
          title: 'เพิ่มการนัดหมาย',
          textStyle: MyConstant().h4StyleBlack(),
        ),
      ],
    );
  }

  Column myNotification() {
    return Column(
      children: [
        Image.asset('images/noti.png'),
        const SizedBox(
          height: 5,
        ),
        ShowTitle(
          title: 'การแจ้งเตรียน',
          textStyle: MyConstant().h4StyleBlack(),
        ),
      ],
    );
  }

  Padding buildNonAppointCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      width: 15, child: Image.asset('images/box_calenda.png')),
                ),
              ),
              title: ShowTitle(
                title: 'ยังไม่มีการนัดหมาย',
                textStyle: MyConstant().h3StyleWeigth(),
              ),
              subtitle: ShowTitle(
                title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
                textStyle: MyConstant().h4StyleGley(),
              ),
              trailing: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(
                        Icons.navigate_next,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    child: ShowTitle(
                      title: 'เข้าสู่ระบบ',
                      textStyle: MyConstant().h3StyleWhite(),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  CarouselSlider builBanner() {
    return CarouselSlider(
        items: widgets,
        options: CarouselOptions(
            viewportFraction: 0.92,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3)));
  }

  Container buildHead() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/header.png'), fit: BoxFit.cover),
      ),
      // width: double.infinity,
      height: 140,
      child: ListTile(
        leading: const ShowCircular(path: 'images/ter.jpg'),
        title: ShowTitle(
          title: 'สวัสดี',
          textStyle: MyConstant().h2StyleWhite(),
        ),
        subtitle: ShowTitle(
          title: 'กรุณาเข้าสู้ระบบ',
          textStyle: MyConstant().h3StyleWhite(),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(builder: (context) => MenuPage()),
                // );
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String cutWord(String detailAritcl) {
    String resutl = detailAritcl;
    if (resutl.length >= 150) {
      resutl = resutl.substring(0, 75);
      resutl = '$resutl ....';
    }
    return resutl;
  }

  String cutWordH(String titleAritcles) {
    String resutl = titleAritcles;
    if (resutl.length >= 50) {
      resutl = resutl.substring(0, 25);
      resutl = '$resutl ....';
    }
    return resutl;
  }
}
