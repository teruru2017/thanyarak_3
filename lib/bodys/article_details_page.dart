import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';

class ArticleDetailsPage extends StatefulWidget {
  ArticleDetailsPage({Key? key}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  List<String> banners = [
    'images/tt1.png',
    'images/tt1.png.png',
    'images/tt1.png.png',
  ];
  List<Widget> widgets = [];
  void loopCreateBanner() {
    for (var item in banners) {
      setState(() {
        widgets.add(createBannerWidget(item));
      });
    }
  }

  Widget createBannerWidget(String path) => Image.asset(path);
  List<String> pathImageA = [
    'images/tt1.png',
    'images/tt1.png',
    'images/tt1.png',
  ];

  List<String> pathImageAritcles = [
    'images/tt1.png',
  ];
  List<String> titleAritcles = [
    'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ222',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ333',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ444',
  ];
  List<String> detailAritcles = [
    'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะหลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะหลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมม...อ่านต่อ',
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
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        child: Stack(children: <Widget>[
          Container(
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/header2.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.maybePop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 1, left: 1),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/back01.png'),
                              scale: 1.5)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: EdgeInsets.only(top: 45, left: 1),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'รายละเอียดบทความ',
                        style: GoogleFonts.kanit(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 90,
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     CupertinoPageRoute(
                              //         builder: (context) => NotiPage()));
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/Share.png'))),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     CupertinoPageRoute(
                              //         builder: (context) => MenuPage()));
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/fav.png'))),
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
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/imagearticle.png'),
              )),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 320, left: 35, right: 35),
              child: Text(
                cutWordH(titleAritcles[index]),
                style: GoogleFonts.kanit(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 375, left: 35, right: 35),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 4, 4, 4),
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
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 400, left: 35, right: 35),
                  child: Text(cutWord(detailAritcles[index]),
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        color: Colors.black,
                      )))),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: 600),
            child: Align(
              alignment: Alignment(-0.8, 0),
              child: Text(
                'แกลลอรี่',
                style: GoogleFonts.kanit(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          )),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 630, left: 30, right: 30),
                  child: Container(
                    child: listImages(),
                  )))
        ]),
      ),
    ])));
  }

  // CarouselSlider builBanner() {
  //   return CarouselSlider(
  //       items: widgets,
  //       options: CarouselOptions(
  //           autoPlay: true, autoPlayInterval: Duration(seconds: 3)));
  // }

  // Container buildHead() {
  //   return Container(
  //     decoration: const BoxDecoration(
  //       image: DecorationImage(
  //           image: AssetImage('images/h_detail_article.png'),
  //           fit: BoxFit.cover),
  //     ),
  //     // width: double.infinity,
  //     height: 100,
  //     child: ListTile(
  //       title: ShowTitle(
  //         title: 'รายละเอียดบทความ',
  //         textStyle: MyConstant().h2StyleWhite(),
  //       ),
  //       // subtitle: ShowTitle(
  //       //   title: 'กรุณาเข้าสู้ระบบ',
  //       //   textStyle: MyConstant().h3StyleWhite(),
  //       // ),
  //       trailing: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           IconButton(
  //             onPressed: () {},
  //             icon: const Icon(
  //               Icons.notifications,
  //               color: Colors.white,
  //             ),
  //           ),
  //           IconButton(
  //             onPressed: () {},
  //             icon: const Icon(
  //               Icons.menu,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // SizedBox listArticle() {
  //   return SizedBox(
  //     child: ListView.builder(
  //       scrollDirection: Axis.vertical,
  //       shrinkWrap: true,
  //       physics: const ClampingScrollPhysics(),
  //       itemCount: pathImageAritcles.length,
  //       itemBuilder: (context, index) => Card(
  //           child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: 170,
  //             width: 366,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(20),
  //                   topRight: Radius.circular(20)),
  //               image: DecorationImage(
  //                 image: AssetImage(
  //                   pathImageAritcles[index],
  //                 ),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             width: 326,
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //               child: ShowTitle(
  //                 title: cutWordH(titleAritcles[index]),
  //                 textStyle: MyConstant().h2StyleBlue(),
  //               ),
  //             ),
  //           ),
  //           Row(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(20, 4, 4, 4),
  //                 child: SvgPicture.asset('images/c1.svg'),
  //               ),
  //               ShowTitle(
  //                 title: dataAritcles[index],
  //                 textStyle: MyConstant().h4StyleGley(),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
  //                 child: SvgPicture.asset('images/v2.svg'),
  //               ),
  //               ShowTitle(
  //                 title: viewAritcles[index],
  //                 textStyle: MyConstant().h4StyleGley(),
  //               ),
  //             ],
  //           ),
  //           Container(
  //             width: 326,
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //               child: ShowTitle(
  //                 title: cutWord(detailAritcles[index]),
  //                 textStyle: MyConstant().h4StyleBlack(),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 5,
  //           ),
  //         ],
  //       )),
  //     ),
  //   );
  // }

  SizedBox listImages() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: pathImageA.length,
        itemBuilder: (context, index) => Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      pathImageA[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String cutWord(String detailAritcles) {
  String resutl = detailAritcles;
  if (resutl.length >= 400) {
    resutl = resutl.substring(0, 200);
    resutl = '$resutl ....';
  }
  return resutl;
}

String cutWordH(String titleAritcles) {
  String resutl = titleAritcles;
  if (resutl.length >= 40) {
    resutl = resutl.substring(0, 70);
    resutl = '$resutl ....';
  }
  return resutl;
}
