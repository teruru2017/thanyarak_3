// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/CarouselWithDotsPage.dart';
import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/article_page.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/detailcheck.dart';
import 'package:thanyarak/bodys/hitstoryDetail.dart';
import 'package:thanyarak/bodys/mark_procedure.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/shop_page.dart';
// import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/bodys/xray.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/show_circular.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:thanyarak/widgets/show_title_head.dart';
//import 'package:thanyarak/states/main_home.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainLoginPage extends StatefulWidget {
  const MainLoginPage({Key? key}) : super(key: key);

  @override
  _MainLoginPageState createState() => _MainLoginPageState();
}

// Map<String, WidgetBuilder> map = {
//   '/mainHome': (BuildContext context) => const MainHome(),
// };

void results() {
  SignInPage();
}

final List<String> imgLists = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
int _currents = 0;
final CarouselController _controller = CarouselController();

class _MainLoginPageState extends State<MainLoginPage> {
  int i = 0;

  CarouselSlider builBannerPro() {
    return CarouselSlider(
        items: widgets,
        options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3)));
  }

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  int _current = 0;
  List<String> imgListPro = [
    'images/topgraphic.png',
    'images/topgraphic.png',
    'images/topgraphic.png',
  ];

  List<String> imgList = [
    'images/shopping.png',
    'images/shopping.png',
  ];

  List<Widget> widgets = [];

  List<Widget> widgetsPro = [];

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
  double topWidgetHeight = 100;
  int _volume = 0;
  int counter = 0;
  double setbottom = 600;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // loopCreateBanner();
    // loopCreatePro();
  }

  //Widget createBannerWidget(String path) => Image.asset(path);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    //พื้นหลัง
                    Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            //  color: Colors.amber,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  //color: Colors.amber,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.all(10),
                                    //color: Colors.red,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: ShapeDecoration(
                                            //color: Colors.green,
                                            shape: CircleBorder(),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'images/avatar.png'),
                                            )),
                                        // child: Image(
                                        //   image: AssetImage('images/avatar.png'),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: 100,
                                    //color: Colors.blue,

                                    //margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.only(top: 15),
                                    child: Align(
                                      //alignment: Alignment.topLeft,
                                      child: Column(children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'สวัสดีค่ะ',
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                            style: GoogleFonts.kanit(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'กรุณาเข้าสู่ระบบ',
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                            style: GoogleFonts.kanit(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20, right: 15),
                                  child: Container(
                                    //color: Colors.amber,
                                    height: 40,
                                    width: 100,
                                    child: Container(
                                      //color: Colors.red,
                                      //margin: EdgeInsets.only(top: 35),
                                      // padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          NotiPage()));
                                            },
                                            child: Container(
                                              width: 20,
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
                                                      builder: (context) =>
                                                          MenuPage()));
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/menu.png'))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),

                    //เนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 120,
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  CarouselSlider(
                                    items: imageSliders,
                                    carouselController: _controller,
                                    options: CarouselOptions(
                                        viewportFraction: 1,
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        autoPlayInterval: Duration(seconds: 15),
                                        aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _currents = index;
                                          });
                                        }),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        imgLists.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controller
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 9.0,
                                          height: 9.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _currents == entry.key
                                                  ? Colors.pink[200]
                                                  : Colors.blue),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              )),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(200, 60),
                                  bottomRight: Radius.elliptical(200, 60)),
                            ),
                            child: buildContent(),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ShowHead(
                                    title: 'บทความ',
                                    pathIcon: 'images/article.png'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Article_page()));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 15),
                                  // color: Colors.amber,
                                  child: Text('ดูทั้งหมด',
                                      style: GoogleFonts.kanit(
                                        color: Colors.black38,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ),
                            ],
                          ),

                          //cardบทความ
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                // width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    top: 10, right: 10, left: 10, bottom: 20),
                                //color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 330,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                              offset: Offset(0, 8),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40))),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 130,
                                            decoration: BoxDecoration(
                                              // color: Colors.white,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'images/1150.png')),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30),
                                                ),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'ทำไมต้องตรวจอัลตราซาวเต้านม',
                                                        style: GoogleFonts.kanit(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff0088C6))),
                                                    Text(
                                                        'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.kanit(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black)),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .solidClock,
                                                          size: 12,
                                                          color:
                                                              Color(0xff0088C6),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "16-06-2564",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .solidEye,
                                                          size: 12,
                                                          color:
                                                              Color(0xff0088C6),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "50,000",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      width: 330,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                              offset: Offset(0, 8),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40))),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              // color: Colors.white,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'images/1150.png')),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30),
                                                ),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'ทำไมต้องตรวจอัลตราซาวเต้านม',
                                                        style: GoogleFonts.kanit(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff0088C6))),
                                                    Text(
                                                        'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.kanit(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black)),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .solidClock,
                                                          size: 12,
                                                          color:
                                                              Color(0xff0088C6),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "16-06-2564",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .solidEye,
                                                          size: 12,
                                                          color:
                                                              Color(0xff0088C6),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "50,000",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Container(
                                      width: 330,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 10,
                                              offset: Offset(0, 8),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40))),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              // color: Colors.white,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'images/1150.png')),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30),
                                                ),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'ทำไมต้องตรวจอัลตราซาวเต้านม',
                                                        style: GoogleFonts.kanit(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff0088C6))),
                                                    Text(
                                                        'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.kanit(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black)),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .solidClock,
                                                          size: 12,
                                                          color:
                                                              Color(0xff0088C6),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "16-06-2564",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .solidEye,
                                                          size: 12,
                                                          color:
                                                              Color(0xff0088C6),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "50,000",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          const ShowHead(
                              title: 'มูลนิธิถันยรักษ์',
                              pathIcon: 'images/shop.png'),
                          buildAboutMe(),
                          SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(),
    );
  }

  Padding buildAboutMe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffE6EFFE),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Color(0XFFe6effe), Color(0XFFFFFFFF)]),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/tt.png'))),
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
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.transparent,
                        ),
                        child: Text(
                          "ดูทั้งหมด",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            color: Colors.blue[600],
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContent() {
    return Container(
      // height: 300,
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage('images/main_body.png'), fit: BoxFit.fill),
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
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => detailcheck_page()));
            },
            child: Image.asset('images/list.png')),
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
        GestureDetector(
            onTap: () {
              setState(
                () {
                  showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.transparent,
                      transitionDuration: Duration(milliseconds: 200),
                      pageBuilder: (BuildContext context, Animation frist,
                              Animation second) =>
                          Addmark());
                },
              );
            },
            child: Image.asset('images/calenda.png')),
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
          title: 'การแจ้งเตือน',
          textStyle: MyConstant().h4StyleBlack(),
        ),
      ],
    );
  }

  Padding buildNonAppointCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
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
                // Navigator.push(context,
                //     CupertinoPageRoute(builder: (context) => SignInPage()));
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SignInPage()));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.symmetric(horizontal: 15),
                //width: 320,
                //padding: EdgeInsets.symmetric(vertical: 15),
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

  // CarouselSlider builBanner() {
  //   return CarouselSlider(
  //       items: widgets,
  //       options: CarouselOptions(
  //           viewportFraction: 1,
  //           autoPlay: true,
  //           autoPlayInterval: Duration(seconds: 3)));
  // }

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

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _currents = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carousel with indicator controller demo')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currents = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgLists.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_currents == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

final List<Widget> imageSliders = imgLists
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(0, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class Addmark extends StatefulWidget {
  Addmark({Key? key}) : super(key: key);

  @override
  _AddmarkState createState() => _AddmarkState();
}

class _AddmarkState extends State<Addmark> {
  @override
  int getAction = 1;
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: true,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 15),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/Calandar.png'))),
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              "เพิ่มการนัดหมาย",
                              style: GoogleFonts.kanit(
                                  color: Color(0xff0088C6), fontSize: 20),
                            ),
                            Text(
                              "หากท่านต้องการนัดหมายทำหัตถการ",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "กับทางศูนย์ถันยรักษ์ กรุณาส่งภาพถ่าย",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "ใบส่งตรวจวินิขฉัยหรือติดต่อที่เบอร์",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "02 411 5657",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            )
                            //ปุ่ม
                            ,
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        getAction = 1;
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: getAction == 1
                                              ? Color(0xff0394fc)
                                              : Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'นัดหมายหัตถการ',
                                          style: GoogleFonts.kanit(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: getAction == 1
                                                ? Color(0xff0088C6)
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        getAction = 2;
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: getAction == 2
                                              ? Color(0xff0394fc)
                                              : Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'เอกซเรย์เต้านม',
                                          style: GoogleFonts.kanit(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: getAction == 2
                                                ? Color(0xff0088C6)
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (getAction == 1) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                mark_procedure_page()));
                                  } else {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => xray_page()));
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffE6EFFE),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff0088C6),
                                        Color(0xff43CEF8)
                                      ]),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ยืนยัน',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    //
                                    color: Colors.white),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ยกเลิก',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);
        showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder:
                (BuildContext context, Animation frist, Animation second) =>
                    dating_page());
        return true;
      });

  // BoxShadow BoxShadow2() {
  //   return BoxShadow(
  //     color: Colors.white,
  //     offset: const Offset(0.0, 0.0),
  //     blurRadius: 0.0,
  //     spreadRadius: 0.0,
  //   );
  // } //BoxShadow

}
