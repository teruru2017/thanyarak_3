//@dart = 2.9
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:thanyarak/bodys/API/api_article_detail.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/show_title.dart';

class ArticleDetailsPage extends StatefulWidget {
  final String urlget;
  ArticleDetailsPage({Key key, this.urlget}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

String url;

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  Future<List<ardetail>> fetchData() async {
    final response = await http.get(Uri.parse('${widget.urlget}'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((data) => new ardetail.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<ardetail>> futureData;
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    futureData = fetchData();
  }

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
  bool txt = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;
    if (width <= 414) {
      _w = 2;
      _f = 1;
    }

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
                            // color: Colors.amber,
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  // color: Colors.amber,
                                  margin: EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.topLeft,
                                      )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: _f,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Container(
                                      height: 40,
                                      //color: Colors.red,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'รายละเอียดบทความ',
                                          style: GoogleFonts.kanit(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Container(
                                    // color: Colors.amber,
                                    height: 40,

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
                                              // Navigator.push(
                                              //     context,
                                              //     CupertinoPageRoute(
                                              //         builder: (context) =>
                                              //             NotiPage()));
                                            },
                                            child: Container(
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/Share.png'))),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          GestureDetector(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     CupertinoPageRoute(
                                              //         builder: (context) =>
                                              //             MenuPage()));
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/fav.png'))),
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
                      padding: const EdgeInsets.only(top: 90),
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
                          top: 110, left: 15, right: 15, bottom: 20),
                      child: FutureBuilder<List<ardetail>>(
                        future: futureData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<ardetail> ardetaildata = snapshot.data;
                            return Column(
                              children: <Widget>[
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    //color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),

                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            ardetaildata[index].urlpicpath)),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Align(
                                    child: Text(
                                      '${ardetaildata[index].subject}',
                                      // 'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                                      maxLines: 2,

                                      style: GoogleFonts.kanit(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0088C6),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidClock,
                                      size: 12,
                                      color: Color(0xff0088C6),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      DateFormat('dd/MM/').format(
                                              ardetaildata[index].createdate) +
                                          DateFormat('yyyy').format(
                                            ardetaildata[index].createdate.add(
                                                  Duration(days: 198195),
                                                ),
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidEye,
                                      size: 12,
                                      color: Color(0xff0088C6),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ardetaildata[index].view.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Html(
                                      data:
                                          '<body>${ardetaildata[index].html}</body>',
                                      style: {
                                        // "h3": Style(
                                        //     maxLines: txt ? 10 : 5,
                                        //     backgroundColor: Color.fromARGB(
                                        //         0x50, 0xee, 0xee, 0xee),
                                        //     fontSize: FontSize.em(2)),
                                        "body": Style(
                                          maxLines: txt ? 10 : 5,
                                          fontFamily: 'kanit',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      },
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      txt = !txt;
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(txt ? 'ย่อลง' : 'อ่านต่อ',
                                        style: GoogleFonts.kanit(
                                          fontSize: 16,
                                          color: Colors.red.shade300,
                                        )),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('แกลอรี่',
                                      style: GoogleFonts.kanit(
                                        fontSize: 18,
                                        color: Colors.black,
                                      )),
                                ),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                        // width: MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          right: 10,
                                        ),
                                        //color: Colors.red,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/1150.png')),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                              ),
                                              SizedBox(width: 10),
                                              Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/1150.png')),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                              ),
                                              SizedBox(width: 10),
                                              Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/1150.png')),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                              ),
                                              SizedBox(width: 10),
                                              Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/1150.png')),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                              ),
                                            ])))
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          // By default show a loading spinner.
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(
        actionGet: 3,
      ),
    );
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
