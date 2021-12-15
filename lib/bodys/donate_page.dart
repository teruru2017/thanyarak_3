import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/alert_page.dart';
import 'package:thanyarak/bodys/detaildonate_pages.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';

import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/donate_widget.dart';
import 'package:thanyarak/widgets/show_circular.dart';
import 'package:thanyarak/widgets/show_title.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

String checklogin = '';

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
                                Expanded(
                                  flex: _f,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Container(
                                      height: 40,
                                      // color: Colors.red,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'บริจาค',
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
                                                          checklogin == '' ||
                                                                  checklogin ==
                                                                      null
                                                              ? NotiPage()
                                                              : alert_page()));
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
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            DonateWidget()
                            // GestureDetector(
                            //   onTap: () => Navigator.push(
                            //       context,
                            //       CupertinoPageRoute(
                            //           builder: (context) =>
                            //               detaildonate_pages())),
                            //   child: Container(
                            //     // width: 380,
                            //     decoration: BoxDecoration(
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: Colors.grey.withOpacity(0.2),
                            //             spreadRadius: 1,
                            //             blurRadius: 10,
                            //             offset: Offset(0, 8),
                            //           )
                            //         ],
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(40))),
                            //     child: Column(
                            //       children: [
                            //         Container(
                            //           width: MediaQuery.of(context).size.width,
                            //           height: 160,
                            //           decoration: BoxDecoration(
                            //             // color: Colors.white,
                            //             image: DecorationImage(
                            //                 fit: BoxFit.cover,
                            //                 image:
                            //                     AssetImage('images/1150.png')),
                            //             borderRadius: BorderRadius.only(
                            //               topLeft: Radius.circular(40),
                            //               topRight: Radius.circular(40),
                            //             ),
                            //           ),
                            //         ),
                            //         Container(
                            //             width:
                            //                 MediaQuery.of(context).size.width,
                            //             height: 150,
                            //             decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               borderRadius: BorderRadius.only(
                            //                 bottomLeft: Radius.circular(40),
                            //                 bottomRight: Radius.circular(40),
                            //               ),
                            //             ),
                            //             child: Container(
                            //               padding: EdgeInsets.only(
                            //                   top: 10, left: 20, right: 20),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text(
                            //                       'บริษัท ฟิลิป เวน(ประเทศไทย) จำกัด ได้นำรายได้จากการจัดกิจกรรมต้านภัยมะเร็งเต้านม มอบให้มูลนิธิถันยรักษ์ฯ',
                            //                       maxLines: 2,
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       style: GoogleFonts.kanit(
                            //                           fontSize: 16,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color:
                            //                               Color(0xff0088C6))),
                            //                   SizedBox(height: 5),
                            //                   Text(
                            //                       'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                            //                       maxLines: 2,
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       style: GoogleFonts.kanit(
                            //                           fontSize: 14,
                            //                           color: Colors.black)),
                            //                   SizedBox(height: 5),
                            //                   Row(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.start,
                            //                     children: [
                            //                       FaIcon(
                            //                         FontAwesomeIcons.solidClock,
                            //                         size: 12,
                            //                         color: Color(0xff0088C6),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 5,
                            //                       ),
                            //                       Text(
                            //                         "16-06-2564",
                            //                         overflow:
                            //                             TextOverflow.ellipsis,
                            //                         style: GoogleFonts.kanit(
                            //                           fontSize: 12,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color: Colors.grey,
                            //                         ),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 10,
                            //                       ),
                            //                       FaIcon(
                            //                         FontAwesomeIcons.solidEye,
                            //                         size: 12,
                            //                         color: Color(0xff0088C6),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 5,
                            //                       ),
                            //                       Text(
                            //                         "50,000",
                            //                         overflow:
                            //                             TextOverflow.ellipsis,
                            //                         style: GoogleFonts.kanit(
                            //                           fontSize: 12,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color: Colors.grey,
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ],
                            //               ),
                            //             )),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                            // GestureDetector(
                            //   onTap: () => Navigator.push(
                            //       context,
                            //       CupertinoPageRoute(
                            //           builder: (context) =>
                            //               detaildonate_pages())),
                            //   child: Container(
                            //     // width: 380,
                            //     decoration: BoxDecoration(
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: Colors.grey.withOpacity(0.2),
                            //             spreadRadius: 1,
                            //             blurRadius: 10,
                            //             offset: Offset(0, 8),
                            //           )
                            //         ],
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(40))),
                            //     child: Column(
                            //       children: [
                            //         Container(
                            //           width: MediaQuery.of(context).size.width,
                            //           height: 160,
                            //           decoration: BoxDecoration(
                            //             // color: Colors.white,
                            //             image: DecorationImage(
                            //                 fit: BoxFit.cover,
                            //                 image:
                            //                     AssetImage('images/1150.png')),
                            //             borderRadius: BorderRadius.only(
                            //               topLeft: Radius.circular(40),
                            //               topRight: Radius.circular(40),
                            //             ),
                            //           ),
                            //         ),
                            //         Container(
                            //             width:
                            //                 MediaQuery.of(context).size.width,
                            //             height: 150,
                            //             decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               borderRadius: BorderRadius.only(
                            //                 bottomLeft: Radius.circular(40),
                            //                 bottomRight: Radius.circular(40),
                            //               ),
                            //             ),
                            //             child: Container(
                            //               padding: EdgeInsets.only(
                            //                   top: 10, left: 20, right: 20),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text(
                            //                       'บริษัท ฟิลิป เวน(ประเทศไทย) จำกัด ได้นำรายได้จากการจัดกิจกรรมต้านภัยมะเร็งเต้านม มอบให้มูลนิธิถันยรักษ์ฯ',
                            //                       maxLines: 2,
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       style: GoogleFonts.kanit(
                            //                           fontSize: 16,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color:
                            //                               Color(0xff0088C6))),
                            //                   SizedBox(height: 5),
                            //                   Text(
                            //                       'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                            //                       maxLines: 2,
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       style: GoogleFonts.kanit(
                            //                           fontSize: 14,
                            //                           color: Colors.black)),
                            //                   SizedBox(height: 5),
                            //                   Row(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.start,
                            //                     children: [
                            //                       FaIcon(
                            //                         FontAwesomeIcons.solidClock,
                            //                         size: 12,
                            //                         color: Color(0xff0088C6),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 5,
                            //                       ),
                            //                       Text(
                            //                         "16-06-2564",
                            //                         overflow:
                            //                             TextOverflow.ellipsis,
                            //                         style: GoogleFonts.kanit(
                            //                           fontSize: 12,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color: Colors.grey,
                            //                         ),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 10,
                            //                       ),
                            //                       FaIcon(
                            //                         FontAwesomeIcons.solidEye,
                            //                         size: 12,
                            //                         color: Color(0xff0088C6),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 5,
                            //                       ),
                            //                       Text(
                            //                         "50,000",
                            //                         overflow:
                            //                             TextOverflow.ellipsis,
                            //                         style: GoogleFonts.kanit(
                            //                           fontSize: 12,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color: Colors.grey,
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ],
                            //               ),
                            //             )),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                            // GestureDetector(
                            //   onTap: () => Navigator.push(
                            //       context,
                            //       CupertinoPageRoute(
                            //           builder: (context) =>
                            //               detaildonate_pages())),
                            //   child: Container(
                            //     // width: 380,
                            //     decoration: BoxDecoration(
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: Colors.grey.withOpacity(0.2),
                            //             spreadRadius: 1,
                            //             blurRadius: 10,
                            //             offset: Offset(0, 8),
                            //           )
                            //         ],
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(40))),
                            //     child: Column(
                            //       children: [
                            //         Container(
                            //           width: MediaQuery.of(context).size.width,
                            //           height: 160,
                            //           decoration: BoxDecoration(
                            //             // color: Colors.white,
                            //             image: DecorationImage(
                            //                 fit: BoxFit.cover,
                            //                 image:
                            //                     AssetImage('images/1150.png')),
                            //             borderRadius: BorderRadius.only(
                            //               topLeft: Radius.circular(40),
                            //               topRight: Radius.circular(40),
                            //             ),
                            //           ),
                            //         ),
                            //         Container(
                            //             width:
                            //                 MediaQuery.of(context).size.width,
                            //             height: 150,
                            //             decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               borderRadius: BorderRadius.only(
                            //                 bottomLeft: Radius.circular(40),
                            //                 bottomRight: Radius.circular(40),
                            //               ),
                            //             ),
                            //             child: Container(
                            //               padding: EdgeInsets.only(
                            //                   top: 10, left: 20, right: 20),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text(
                            //                       'บริษัท ฟิลิป เวน(ประเทศไทย) จำกัด ได้นำรายได้จากการจัดกิจกรรมต้านภัยมะเร็งเต้านม มอบให้มูลนิธิถันยรักษ์ฯ',
                            //                       maxLines: 2,
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       style: GoogleFonts.kanit(
                            //                           fontSize: 16,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color:
                            //                               Color(0xff0088C6))),
                            //                   SizedBox(height: 5),
                            //                   Text(
                            //                       'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                            //                       maxLines: 2,
                            //                       overflow:
                            //                           TextOverflow.ellipsis,
                            //                       style: GoogleFonts.kanit(
                            //                           fontSize: 14,
                            //                           color: Colors.black)),
                            //                   SizedBox(height: 5),
                            //                   Row(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.start,
                            //                     children: [
                            //                       FaIcon(
                            //                         FontAwesomeIcons.solidClock,
                            //                         size: 12,
                            //                         color: Color(0xff0088C6),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 5,
                            //                       ),
                            //                       Text(
                            //                         "16-06-2564",
                            //                         overflow:
                            //                             TextOverflow.ellipsis,
                            //                         style: GoogleFonts.kanit(
                            //                           fontSize: 12,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color: Colors.grey,
                            //                         ),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 10,
                            //                       ),
                            //                       FaIcon(
                            //                         FontAwesomeIcons.solidEye,
                            //                         size: 12,
                            //                         color: Color(0xff0088C6),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 5,
                            //                       ),
                            //                       Text(
                            //                         "50,000",
                            //                         overflow:
                            //                             TextOverflow.ellipsis,
                            //                         style: GoogleFonts.kanit(
                            //                           fontSize: 12,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           color: Colors.grey,
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ],
                            //               ),
                            //             )),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
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
}
