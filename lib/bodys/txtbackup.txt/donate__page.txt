import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/detaildonate_pages.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';

import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_circular.dart';
import 'package:thanyarak/widgets/show_title.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

double topWidgetHeight = 70;

class _DonatePageState extends State<DonatePage> {
  List<String> pathImageAritcles = [
    'images/donate.png',
    'images/donate.png',
    'images/donate.png',
    'images/donate.png'
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(children: <Widget>[
        Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/bg_menu.png"),
                  alignment: Alignment.topCenter),
            ),
            child: Column(
              children: [
                Container(
                  height: topWidgetHeight,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 100,
                          child: Container(
                            //margin: EdgeInsets.only(top: 35),
                            padding: EdgeInsets.only(bottom: 10, left: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'บริจาค',
                                  style: GoogleFonts.kanit(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          child: Container(
                            //margin: EdgeInsets.only(top: 35),
                            padding: EdgeInsets.only(bottom: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => NotiPage()));
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'images/notimenu.png'))),
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => MenuPage()));
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('images/menu.png'))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height + 600,
                  color: Colors.transparent,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //หัว
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    // color: Colors.green,

                                    child: Column(
                                        children: <Widget>[listArticle()]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ])
      ])),
    );
  }

  SizedBox listArticle() {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: pathImageAritcles.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => detaildonate_pages()));
          },
          child: Card(
              //color: Colors.amber,
              // elevation: 1,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(
                          pathImageAritcles[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.green,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 1, left: 20, right: 20),
                      child: ShowTitle(
                          title: cutWordH(titleAritcles[index]),
                          textStyle: GoogleFonts.kanit(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff0088C6),
                          )),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 7, left: 20, right: 20),
                      child: ShowTitle(
                          title: cutWord(detailAritcles[index]),
                          textStyle: GoogleFonts.kanit(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    //color: Colors.green,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding:
                        const EdgeInsets.only(bottom: 7, left: 5, right: 20),
                    child: Column(
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
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              )),
        ),
      ),
    );
  }
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
