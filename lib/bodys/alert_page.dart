//@dart=2.9
import 'dart:convert';

import 'package:collection/collection.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_notification.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/hitstoryCk_page.dart';
import 'package:thanyarak/bodys/hitstoryDetail.dart';
import 'package:thanyarak/bodys/login/estimate_page.dart';
import 'package:thanyarak/bodys/login/menumember_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/mark_procedure.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thanyarak/models/alert_model.dart';

import 'package:thanyarak/widgets/NavigationBar.dart';

import 'package:http/http.dart' as http;
import 'package:thanyarak/widgets/mark_widget.dart';
import 'package:thanyarak/bodys/xray.dart';

final List<alert> ListAlert = alert.generateAlert();

class alert_page extends StatefulWidget {
  alert_page({Key key, this.pageto}) : super(key: key);
  String pageto;
  @override
  _alert_pageState createState() => _alert_pageState();
}

int countMark = 1;

class _alert_pageState extends State<alert_page> {
  String cid, pid;
  final CarouselController _controller = CarouselController();

  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();

    getDATA();
  }

  Future<List<notification>> notificationDATA;
  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      pid = per.getString('pid');
      notificationDATA = notificationAPI(cid);
      print('to ${widget.pageto}');
    });
  }

  Future<List<notification>> notificationAPI(String txtpid) async {
    var url = '${apiurl().urlapi}/notification.php?userId=${txtpid}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse
          .map((data) => new notification.fromJson(data))
          .toList();
    } else {
      print(response.body);
    }
  }

  Future<List<notification>> notificationAPI_Up(int notiId) async {
    var url = '${apiurl().urlapi}/notification.php';
    final response = await http.patch(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{"notiId": notiId, "status": "Read"}),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }

  Future<List<notification>> notificationAPI_Del(String userId) async {
    var url = '${apiurl().urlapi}/notification.php';
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "userId": "${userId}",
      }),
    );
    if (response.statusCode == 200) {
      print('notificationAPI_Del ${response.body}');
      setState(() {
        notificationDATA = notificationAPI(userId);
      });
    } else {
      print('notificationAPI_Del ${response.body}');
    }
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;
    if (width <= 414) {
      _w = 2;
      _f = 1;
    }
    // print(_w);

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
                                  Container(
                                    width: 30,
                                    height: 30,
                                    // color: Colors.amber,
                                    margin: EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.pop(context);

                                        if (widget.pageto == '/mainHome') {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainPage()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } else if (widget.pageto ==
                                            '/artclePage') {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainPage()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } else if (widget.pageto ==
                                            '/donatePage') {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              DonatePage()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } else if (widget.pageto ==
                                            '/aboutPage') {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AboutPage()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } else if (widget.pageto ==
                                            '/menuHome') {
                                          Navigator.of(
                                                  context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          menumember_pages()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } else {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainPage()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          scale: 1,
                                          image:
                                              AssetImage("images/back01.png"),
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
                                        // color: Colors.red,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'แจ้งเตือน',
                                            overflow: TextOverflow.ellipsis,
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
                                            SizedBox(width: 20),
                                            GestureDetector(
                                              onTap: () {
                                                notificationAPI_Del(cid);
                                                print(cid);
                                              },
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'images/bin.png'))),
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
                            top: 80, left: 15, right: 15, bottom: 20),
                        child: Column(
                          children: [
                            Container(
                              //height: MediaQuery.of(context).size.height,

                              // color: Colors.amber,
                              child: FutureBuilder<List<notification>>(
                                future: notificationDATA,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<notification> data = snapshot.data;
                                    return ListView.separated(
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: 1,
                                          );
                                        },
                                        controller: ScrollController(),
                                        shrinkWrap: true,
                                        itemCount: data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          String namety, detail;
                                          if (data[index].notificationType ==
                                              "exam_complete") {
                                            namety =
                                                "เสร็จสิ้นการตรวจมะเร็งเต้านม";
                                            detail =
                                                "กรุณาให้ระดับความพึงพอใจในการมารับบริการครั้งนี้";
                                          } else {
                                            namety = "การแจ้งเตือนนัดหมาย";
                                            detail =
                                                "การนัดหมายเอกสาร เจ้าหน้าที่ได้รับเรื่องและดำเนินการเรียบร้อย";
                                          }
                                          return GestureDetector(
                                            onTap: () {
                                              if (data[index].status ==
                                                  "Unread") {
                                                notificationAPI_Up(
                                                    data[index].notiId);
                                                //update
                                              }

                                              if (data[index]
                                                      .notificationType ==
                                                  'exam_complete') {
                                                if (data[index].assessment ==
                                                    "Done") {
                                                } else {
                                                  print(
                                                      'Incomplete  ${data[index].notiId}');
                                                  Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              estimate_page(
                                                                notiId:
                                                                    data[index]
                                                                        .notiId,
                                                                pageto:
                                                                    '${widget.pageto}',
                                                              )));
                                                }
                                              }
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 90,
                                                  margin: EdgeInsets.only(
                                                      bottom: 0),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            bottom: 15,
                                                            top: 15),
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: HexColor(
                                                              '#0088C6'),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(50),
                                                          ),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Image.asset(
                                                                  'images/sms.png',
                                                                  scale: 1.3),
                                                            ),
                                                            Visibility(
                                                              visible: data[index]
                                                                          .status ==
                                                                      'Unread'
                                                                  ? true
                                                                  : false,
                                                              child: Positioned(
                                                                left: 35,
                                                                child:
                                                                    Container(
                                                                  height: 15,
                                                                  width: 15,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            2,
                                                                        color: Colors
                                                                            .white),
                                                                    color: HexColor(
                                                                        '#F291A3'),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius.circular(
                                                                          50),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  bottom: 15,
                                                                  top: 15),
                                                          child: Column(
                                                            children: [
                                                              Expanded(
                                                                flex: 2,
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        child: Text(
                                                                            "${namety}",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style: GoogleFonts.kanit(
                                                                              fontSize: 18,
                                                                              color: data[index].assessment == 'Incomplete' ? Colors.black : Colors.grey,
                                                                            )),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "${detail}",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                GoogleFonts.kanit(
                                                                              fontSize: 14,
                                                                              color: data[index].assessment == 'Incomplete' ? Colors.black : Colors.grey,
                                                                            ),
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 0,
                                                  thickness: 1,
                                                  indent: 0,
                                                  endIndent: 0,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  } else if (snapshot.hasData == false) {
                                    return Container();
                                  }
                                  // By default show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: NavigagitonBar(
        //     // actionGet: 3,
        //     ),
      ),
      onWillPop: () {
        if (widget.pageto == '/mainHome') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
              (Route<dynamic> route) => false);
        } else if (widget.pageto == '/artclePage') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
              (Route<dynamic> route) => false);
        } else if (widget.pageto == '/donatePage') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => DonatePage()),
              (Route<dynamic> route) => false);
        } else if (widget.pageto == '/aboutPage') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AboutPage()),
              (Route<dynamic> route) => false);
        } else if (widget.pageto == '/menuHome') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => menumember_pages()),
              (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainPage()),
              (Route<dynamic> route) => false);
        }
      },
    );
  }
}
