//@dart=2.9
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_donate.dart';
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
  DonatePage({Key key}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

String cid = '';

class _DonatePageState extends State<DonatePage> {
  Future<List<apiDonate>> donateData() async {
    final response =
        await http.get(Uri.parse('https://truethanyarak.com/api/Do_List.php'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((data) => new apiDonate.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      // print(cid);
    });
  }

  Future<List<apiDonate>> futureData;
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getDATA();
    futureData = donateData();
  }

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
    return WillPopScope(
      child: Scaffold(
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
                                                            cid == '' ||
                                                                    cid == null
                                                                ? NotiPage()
                                                                : alert_page()));
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/notimenu.png'))),
                                                  ),
                                                  Visibility(
                                                    visible:
                                                        cid == '' || cid == null
                                                            ? false
                                                            : true,
                                                    child: Positioned(
                                                      left: 10,
                                                      top: 6,
                                                      child: Container(
                                                        height: 10,
                                                        width: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: HexColor(
                                                                  '#31BCEB')),
                                                          color: HexColor(
                                                              '#F291A3'),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(50),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
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
                              FutureBuilder<List<apiDonate>>(
                                future: futureData,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<apiDonate> donateData = snapshot.data;
                                    return Container(
                                      child: Column(
                                        children: donateData
                                            .map(
                                              (e) => GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              detaildonate_pages(
                                                                urlget:
                                                                    '${e.id}',
                                                              )));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      // width: 380,
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.2),
                                                              spreadRadius: 1,
                                                              blurRadius: 10,
                                                              offset:
                                                                  Offset(0, 8),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          40))),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 160,
                                                            decoration:
                                                                BoxDecoration(
                                                              // color: Colors.white,
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(
                                                                      e.urlpicpath)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        40),
                                                                topRight: Radius
                                                                    .circular(
                                                                        40),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 150,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          40),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          40),
                                                                ),
                                                              ),
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 10,
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(e.subject,
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: GoogleFonts.kanit(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: Color(0xff0088C6))),
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Text(
                                                                        e.title,
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: GoogleFonts.kanit(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.black)),
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidClock,
                                                                          size:
                                                                              12,
                                                                          color:
                                                                              Color(0xff0088C6),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            DateFormat('dd/MM/').format(e.createdate) +
                                                                                DateFormat('yyyy').format(
                                                                                  e.createdate.add(
                                                                                    Duration(days: 198195),
                                                                                  ),
                                                                                ),
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: GoogleFonts.kanit(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.grey,
                                                                            )),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidEye,
                                                                          size:
                                                                              12,
                                                                          color:
                                                                              Color(0xff0088C6),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          '10',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              GoogleFonts.kanit(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color:
                                                                                Colors.grey,
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
                                                    SizedBox(
                                                      height: 20,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  // By default show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                              ),
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
        bottomNavigationBar: NavigagitonBar(actionGet: 3),
      ),
      onWillPop: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/mainHome', (Route<dynamic> route) => false);
      },
    );
  }
}
