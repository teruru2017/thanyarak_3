//@dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/alert_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';

import 'package:http/http.dart' as http;
import 'package:thanyarak/widgets/msgBox_widget.dart';

class estimate_page extends StatefulWidget {
  estimate_page({Key key, this.notiId, this.pageto}) : super(key: key);
  int notiId;
  String pageto;
  @override
  _estimate_pageState createState() => _estimate_pageState();
}

String pagetogo;

class _estimate_pageState extends State<estimate_page> {
  TextEditingController comment = TextEditingController();
  String Q1, Q2, Q3, Q4, Q5, Q6, Q7;
  String As1, As2, As3, As4, As5, As6, As7;

  String cid, pid, name, phone;
  void initState() {
    Q1 = 'ช่องทางการติดต่อนัดหมาย และการติดต่อสอบถามข้อมูล';
    Q2 = 'ขั้นตอนการเข้ารับบริการ';
    Q3 = 'การอธิบายและการแนะนำขั้นตอนการให้บริการต่างๆ';
    Q4 = 'สถานที่ อุปกรณ์ เทคโนโลยี สำหรับการบริการและการตรวจ';
    Q5 = 'การให้บริการของศูนย์ถันยรักษ์ในภาพรวม';
    Q6 = 'ท่านคิดว่าจะแนะนำผู้อื่นมาตรวจเอกซเรย์เต้านมที่ศูนย์ถันยรักษ์หรือไม่';
    Q7 = 'ข้อเสนอแนะ/ข้อควรปรับปรุงในการให้บริการ';

    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    pagetogo = '${widget.pageto}';
    getDATA();
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      pid = per.getString('pid');
      name = per.getString('name');
      phone = per.getString('call');
      print("${widget.notiId} ${phone} ${cid}");
    });
  }

  Future<void> assessment_add() async {
    var url = '${apiurl().urlapi}/assessment.php';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "notiId": widget.notiId,
        "cid": "${cid}",
        "fullname": "${name}",
        "phoneNumber": "${phone}",
        "q1": "${Q1}",
        "a1": "${As1}",
        "q2": "${Q2}",
        "a2": "${As2}",
        "q3": "${Q3}",
        "a3": "${As3}",
        "q4": "${Q4}",
        "a4": "${As4}",
        "q5": "${Q5}",
        "a5": "${As5}",
        "q6": "${Q6}",
        "a6": "${As6}",
        "q7": "${Q7}",
        "a7": "${As7}",
        "q8": "-",
        "a8": "-",
      }),
    );
    if (response.statusCode == 200) {
      print(response.body);
      print("${As1}, ${As2}, ${As3}, ${As4}, ${As5}, ${As6}, ${As7} ");
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  successDialog());
    } else {
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  MSGBoxWidget(
                    title: 'เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง',
                    detail: '',
                  ));
    }
  }

  final double topWidgetHeight = 90.0;
  final double avatarRadius = 70.0;
  final double cameraRadius = 20.0;
  final double her = 10, herBottom = 150, herbt = 20;
  ScrollController _controller = new ScrollController();

  bool txt = true;
  bool value = true;
  bool well01 = false,
      well02 = false,
      well03 = false,
      well04 = false,
      well05 = false,
      well06 = false,
      well07 = false;
  bool good01 = false,
      good02 = false,
      good03 = false,
      good04 = false,
      good05 = false,
      good06 = false,
      good07 = false;
  bool fair01 = false,
      fair02 = false,
      fair03 = false,
      fair04 = false,
      fair05 = false,
      fair06 = false,
      fair07 = false,
      fair08 = false;
  bool bad01 = false,
      bad02 = false,
      bad03 = false,
      bad04 = false,
      bad05 = false,
      bad06 = false,
      bad07 = false;
  String textwell = 'images/well.png';
  String textwellcolor = 'images/well011.png';
  String textgood = 'images/good.png';
  String textgoodcolor = 'images/good011.png';
  String textfair = 'images/fair.png';
  String textfaircolor = 'images/fair011.png';
  String textbad = 'images/bad.png';
  String textbadcolor = 'images/bad011.png';

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
                        padding: EdgeInsets.only(top: 20, right: 15, left: 15),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    alert_page(
                                                      pageto: "${pagetogo}",
                                                    )));
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
                                      width: 200,
                                      child: Container(
                                        //color: Colors.red,
                                        //margin: EdgeInsets.only(top: 35),
                                        // padding: EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(width: 20),
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     // Navigator.push(
                                            //     //     context,
                                            //     //     CupertinoPageRoute(
                                            //     //         builder: (context) =>
                                            //     //             MenuPage()));
                                            //   },
                                            //   child: Container(
                                            //     width: 20,
                                            //     height: 20,
                                            //     decoration: BoxDecoration(
                                            //         image: DecorationImage(
                                            //             image: AssetImage(
                                            //                 'images/bin.png'))),
                                            //   ),
                                            // ),
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
                            top: 110, left: 15, right: 15),
                        child: Column(
                          children: [
                            //01
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue.shade50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 200,
                                child: Row(children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 10, right: 10),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${Q1}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          well01 = !well01;
                                                          good01 = false;
                                                          fair01 = false;
                                                          bad01 = false;
                                                          As1 = 'ดีมาก';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                alignment:
                                                                    Alignment(0,
                                                                        -0.2),
                                                                scale: 1.5,
                                                                image: AssetImage(well01
                                                                    ? textwellcolor
                                                                    : textwell))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          good01 = !good01;
                                                          well01 = false;
                                                          fair01 = false;
                                                          bad01 = false;
                                                          As1 = 'ดี';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                scale: 1.5,
                                                                image: AssetImage(good01
                                                                    ? textgoodcolor
                                                                    : textgood))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          fair01 = !fair01;
                                                          good01 = false;
                                                          well01 = false;
                                                          bad01 = false;
                                                          As1 = 'พอใช้';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(fair01
                                                                    ? textfaircolor
                                                                    : textfair))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          bad01 = !bad01;
                                                          good01 = false;
                                                          fair01 = false;
                                                          well01 = false;
                                                          As1 = 'ปรับปรุง';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(bad01
                                                                    ? textbadcolor
                                                                    : textbad))),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: well01,
                                                      child: Text(
                                                        'ดีมาก',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: good01,
                                                      child: Text(
                                                        'ดี',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: fair01,
                                                      child: Text(
                                                        'พอใช้',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: bad01,
                                                      child: Text(
                                                        'ปรับปรุง',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  //Expanded(flex: 2, child: buildSwitch()),
                                ])),
                            SizedBox(height: her),
                            //02
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue.shade50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 200,
                                child: Row(children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 10, right: 10),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${Q2}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          well02 = !well02;
                                                          good02 = false;
                                                          fair02 = false;
                                                          bad02 = false;
                                                          As2 = 'ดีมาก';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                alignment:
                                                                    Alignment(0,
                                                                        -0.2),
                                                                scale: 1.5,
                                                                image: AssetImage(well02
                                                                    ? textwellcolor
                                                                    : textwell))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          good02 = !good02;
                                                          well02 = false;
                                                          fair02 = false;
                                                          bad02 = false;
                                                          As2 = 'ดี';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                scale: 1.5,
                                                                image: AssetImage(good02
                                                                    ? textgoodcolor
                                                                    : textgood))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          fair02 = !fair02;
                                                          good02 = false;
                                                          well02 = false;
                                                          bad02 = false;
                                                          As2 = 'พอใช้';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(fair02
                                                                    ? textfaircolor
                                                                    : textfair))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          bad02 = !bad02;
                                                          good02 = false;
                                                          fair02 = false;
                                                          well02 = false;
                                                          As2 = 'ปรับปรุง';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(bad02
                                                                    ? textbadcolor
                                                                    : textbad))),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: well02,
                                                      child: Text(
                                                        'ดีมาก',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: good02,
                                                      child: Text(
                                                        'ดี',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: fair02,
                                                      child: Text(
                                                        'พอใช้',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: bad02,
                                                      child: Text(
                                                        'ปรับปรุง',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  //Expanded(flex: 2, child: buildSwitch()),
                                ])),
                            SizedBox(height: her),
                            //03
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue.shade50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 200,
                                child: Row(children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 10, right: 10),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${Q3}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          well03 = !well03;
                                                          good03 = false;
                                                          fair03 = false;
                                                          bad03 = false;
                                                          As3 = 'ดีมาก';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                alignment:
                                                                    Alignment(0,
                                                                        -0.2),
                                                                scale: 1.5,
                                                                image: AssetImage(well03
                                                                    ? textwellcolor
                                                                    : textwell))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          good03 = !good03;
                                                          well03 = false;
                                                          fair03 = false;
                                                          bad03 = false;
                                                          As3 = 'ดี';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                scale: 1.5,
                                                                image: AssetImage(good03
                                                                    ? textgoodcolor
                                                                    : textgood))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          fair03 = !fair03;
                                                          good03 = false;
                                                          well03 = false;
                                                          bad03 = false;
                                                          As3 = 'พอใช้';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(fair03
                                                                    ? textfaircolor
                                                                    : textfair))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          bad03 = !bad03;
                                                          good03 = false;
                                                          fair03 = false;
                                                          well03 = false;
                                                          As3 = 'ปรับปรุง';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(bad03
                                                                    ? textbadcolor
                                                                    : textbad))),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: well03,
                                                      child: Text(
                                                        'ดีมาก',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: good03,
                                                      child: Text(
                                                        'ดี',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: fair03,
                                                      child: Text(
                                                        'พอใช้',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: bad03,
                                                      child: Text(
                                                        'ปรับปรุง',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  //Expanded(flex: 2, child: buildSwitch()),
                                ])),
                            SizedBox(height: her),
                            //04
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue.shade50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 200,
                                child: Row(children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 10, right: 10),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${Q4}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          well04 = !well04;
                                                          good04 = false;
                                                          fair04 = false;
                                                          bad04 = false;
                                                          As4 = 'ดีมาก';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                alignment:
                                                                    Alignment(0,
                                                                        -0.2),
                                                                scale: 1.5,
                                                                image: AssetImage(well04
                                                                    ? textwellcolor
                                                                    : textwell))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          good04 = !good04;
                                                          well04 = false;
                                                          fair04 = false;
                                                          bad04 = false;
                                                          As4 = 'ดี';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                scale: 1.5,
                                                                image: AssetImage(good04
                                                                    ? textgoodcolor
                                                                    : textgood))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          fair04 = !fair04;
                                                          good04 = false;
                                                          well04 = false;
                                                          bad04 = false;
                                                          As4 = 'พอใช้';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(fair04
                                                                    ? textfaircolor
                                                                    : textfair))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          bad04 = !bad04;
                                                          good04 = false;
                                                          fair04 = false;
                                                          well04 = false;
                                                          As4 = 'ปรับปรุง';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(bad04
                                                                    ? textbadcolor
                                                                    : textbad))),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: well04,
                                                      child: Text(
                                                        'ดีมาก',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: good04,
                                                      child: Text(
                                                        'ดี',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: fair04,
                                                      child: Text(
                                                        'พอใช้',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: bad04,
                                                      child: Text(
                                                        'ปรับปรุง',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  //Expanded(flex: 2, child: buildSwitch()),
                                ])),
                            SizedBox(height: her),
                            //05
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue.shade50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 200,
                                child: Row(children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 10, right: 10),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${Q5}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          well05 = !well05;
                                                          good05 = false;
                                                          fair05 = false;
                                                          bad05 = false;
                                                          As5 = 'ดีมาก';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                alignment:
                                                                    Alignment(0,
                                                                        -0.2),
                                                                scale: 1.5,
                                                                image: AssetImage(well05
                                                                    ? textwellcolor
                                                                    : textwell))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          good05 = !good05;
                                                          well05 = false;
                                                          fair05 = false;
                                                          bad05 = false;
                                                          As5 = 'ดี';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                scale: 1.5,
                                                                image: AssetImage(good05
                                                                    ? textgoodcolor
                                                                    : textgood))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          fair05 = !fair05;
                                                          good05 = false;
                                                          well05 = false;
                                                          bad05 = false;
                                                          As5 = 'พอใช้';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(fair05
                                                                    ? textfaircolor
                                                                    : textfair))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          bad05 = !bad05;
                                                          good05 = false;
                                                          fair05 = false;
                                                          well05 = false;
                                                          As5 = 'ปรับปรุง';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(bad05
                                                                    ? textbadcolor
                                                                    : textbad))),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: well05,
                                                      child: Text(
                                                        'ดีมาก',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: good05,
                                                      child: Text(
                                                        'ดี',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: fair05,
                                                      child: Text(
                                                        'พอใช้',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Visibility(
                                                      visible: bad05,
                                                      child: Text(
                                                        'ปรับปรุง',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  //Expanded(flex: 2, child: buildSwitch()),
                                ])),
                            SizedBox(height: her),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue.shade50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 200,
                                child: Row(children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 10, right: 10),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${Q6}',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          well06 = !well06;
                                                          good06 = false;
                                                          fair06 = false;
                                                          bad06 = false;
                                                          As6 = 'แนะนำ';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                alignment:
                                                                    Alignment(0,
                                                                        -0.2),
                                                                scale: 1.5,
                                                                image: AssetImage(well06
                                                                    ? textwellcolor
                                                                    : textwell))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 70,
                                                      width: 70,
                                                      //color: Colors.amber,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'แนะนำ',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 14,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          fair06 = !fair06;
                                                          good06 = false;
                                                          well06 = false;
                                                          bad06 = false;
                                                          As6 = 'ไม่แนะนำ';
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(fair06
                                                                    ? textfaircolor
                                                                    : textfair))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'ไม่แนะนำ',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 14,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: her,
                                            ),
                                          ],
                                        ),
                                      )),
                                  //Expanded(flex: 2, child: buildSwitch()),
                                ])),
                            SizedBox(
                              height: her,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.blue.shade50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 200,
                                child: Row(children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FormBuilderTextField(
                                                name: 'comment',
                                                controller: comment,
                                                minLines: 5,
                                                maxLines: 5,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                style: GoogleFonts.kanit(),
                                                decoration: InputDecoration(
                                                    hintText: '${Q7}',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    )),
                                              ),
                                            ]),
                                      )),
                                  //Expanded(flex: 2, child: buildSwitch()),
                                ])),

                            SizedBox(height: her),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      if (As1 == null ||
                                          As2 == null ||
                                          As3 == null ||
                                          As4 == null ||
                                          As5 == null ||
                                          As6 == null) {
                                        print('มีค่าว่าง');
                                        showGeneralDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            barrierLabel:
                                                MaterialLocalizations.of(
                                                        context)
                                                    .modalBarrierDismissLabel,
                                            barrierColor: Colors.transparent,
                                            transitionDuration:
                                                Duration(milliseconds: 200),
                                            pageBuilder: (BuildContext context,
                                                    Animation frist,
                                                    Animation second) =>
                                                MSGBoxWidget(
                                                  title:
                                                      'กรุณาทำแบบสอบถามก่อนส่ง',
                                                  detail: '',
                                                ));
                                      } else {
                                        As7 = comment.text;
                                        if (As7.length <= 0) {
                                          As7 = "-";
                                        }

                                        assessment_add();
                                      }
                                      // showGeneralDialog(
                                      //     context: context,
                                      //     barrierDismissible: false,
                                      //     barrierLabel:
                                      //         MaterialLocalizations.of(context)
                                      //             .modalBarrierDismissLabel,
                                      //     barrierColor: Colors.transparent,
                                      //     transitionDuration:
                                      //         Duration(milliseconds: 200),
                                      //     pageBuilder: (BuildContext context,
                                      //             Animation frist,
                                      //             Animation second) =>
                                      //         successDialog());
                                    },
                                  );
                                },
                                child: Container(
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
                                  child: Text(
                                    "ส่งแบบสอบถาม",
                                    style: GoogleFonts.kanit(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF),
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: herbt),
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
        // bottomNavigationBar: NavigagitonBar(),
      ),
      onWillPop: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => alert_page(
                      pageto: "${pagetogo}",
                    )));
      },
    );
  }
}

class successDialog extends StatefulWidget {
  successDialog({Key key}) : super(key: key);

  @override
  _successDialogState createState() => _successDialogState();
}

bool success = false;

class _successDialogState extends State<successDialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
          visible: !success,
          child: Scaffold(
              backgroundColor: Colors.black38,
              body: SingleChildScrollView(
                  child: Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  //height: 400,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(
                    top: 180,
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/success01.png'))),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ประเมินสำเร็จ',
                      style: GoogleFonts.kanit(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0088C6),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'ขอบคุณสำหรับการสละเวลาในการทำแบบสอบถามการให้บริการนี้ ความเห็นของท่านสำคัญต่อการพัฒนางานบริการ ให้ดียิ่งขึ้นต่อไป',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        //fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(height: 20),
                    //เสร็จสิ้น
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => alert_page(
                                        pageto: "${pagetogo}",
                                      )));
                        });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
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
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'เสร็จสิ้น',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ]),
                ),
              ])))),
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
                    NotiPage());
        return true;
      });
}
