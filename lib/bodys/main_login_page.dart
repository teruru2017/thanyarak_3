import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/menu_login_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/shop_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_circular.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:thanyarak/widgets/show_title_head.dart';

import 'about_page.dart';

class MainLoginPage extends StatefulWidget {
  MainLoginPage({Key? key}) : super(key: key);

  @override
  _MainLoginPageState createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Card(
                color: Color(0xffABDDFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 2,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/bgsky.png"),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          scale: 1.5,
                          image: AssetImage("images/iconshop.png"),
                          alignment: Alignment(0.8, 0.3),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          scale: 1.5,
                          image: AssetImage("images/textshop.png"),
                          alignment: Alignment(-0.5, -0.5),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ShopPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 1.3,
                                  image: AssetImage("images/clickshop.png"),
                                  alignment: Alignment(-0.7, 0.6))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AboutPage()));
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
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: pathImageAritcles.length,
        itemBuilder: (context, index) => Card(
            elevation: 3,
            margin: EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 150,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ShowTitle(
                        title: cutWordH(titleAritcles[index]),
                        textStyle: GoogleFonts.kanit(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0088C6),
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ShowTitle(
                        title: cutWord(detailAritcles[index]),
                        textStyle: GoogleFonts.kanit(
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
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
                )
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
      padding: const EdgeInsets.all(15),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      width: 15, child: Image.asset('images/box_calenda.png')),
                ),
              ),
              title: ShowTitle(
                  title: 'ยังไม่มีการนัดหมาย',
                  textStyle: GoogleFonts.kanit(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              subtitle: ShowTitle(
                  title: 'เข้าสู่ระบบ เพื่อทำการนัดหมาย',
                  textStyle: GoogleFonts.kanit(
                      fontSize: 14, color: Color(0xffB7B7B7))),
              trailing: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.navigate_next,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SignInPage()));
              },
              child: Container(
                width: 320,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffE6EFFE),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                ),
                child: Text(
                  "เข้าสู่ระบบ",
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 16,
                    color: Color(0xffFFFFFF),
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  CarouselSlider builBanner() {
    return CarouselSlider(
        items: widgets,
        options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3)));
  }

  Container buildHead() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/header.png'), fit: BoxFit.fitWidth),
      ),
      // width: double.infinity,
      height: 140,
      child: ListTile(
        leading: const ShowCircular(path: 'images/Member_login.png'),
        title: ShowTitle(
          title: 'สวัสดีค่ะ',
          textStyle: GoogleFonts.kanit(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        subtitle: ShowTitle(
          title: 'จอร์นาธาน วิคตอร์เรีย',
          textStyle: GoogleFonts.kanit(
            fontSize: 14,
            color: Colors.white60,
          ),
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
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => MenuLoginPage()),
                );
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
