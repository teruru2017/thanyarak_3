//@dart=2.9
import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/slipMark.dart';
import 'package:thanyarak/bodys/xraymark.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat, Intl;

import 'API/api_url.dart';

class detailMark_page extends StatefulWidget {
  detailMark_page(
      {Key key, this.dateTimeGET, this.idGET, this.statusGET, this.dateDAYGET})
      : super(key: key);
  String dateTimeGET;
  String dateDAYGET;
  String statusGET;
  int idGET;

  @override
  _detailMarkk_pageState createState() => _detailMarkk_pageState();
}

int idGET;
String Token;

class _detailMarkk_pageState extends State<detailMark_page> {
//
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    idGET = widget.idGET;
    getDATA();
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
    });
  }

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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      dating_page()));
                                        });
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          scale: 1.3,
                                          image:
                                              AssetImage("images/back01.png"),
                                          alignment: Alignment.center,
                                        )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: _f,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Container(
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'รายละเอียดการนัดหมาย',
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),

                      //พื้นหลังเนื้อหา
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Container(
                          //ถ้าจอดล้นมาลบ -170 ออก
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //เนื้อหาข้างใน

                            Container(
                              child: Column(children: [
                                Container(
                                  height: 100,
                                  // color: Colors.red,
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 0,
                                              bottom: 0,
                                              top: 0,
                                              right: 0),
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            // color: Colors.blue[400],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: widget.statusGET == null
                                                    ? [
                                                        Color(0xff0088C6),
                                                        Color(0xff43CEF8)
                                                      ]
                                                    : widget.statusGET ==
                                                            'success'
                                                        ? [
                                                            Color(0xFF88D31D),
                                                            Color(0xFF88D31D)
                                                          ]
                                                        : [
                                                            Colors.red,
                                                            Colors.red
                                                          ]),
                                          ),
                                          child: Image.asset(
                                              'images/history__outline.png',
                                              scale: 1.3)),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              bottom: 0,
                                              top: 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                // height: 40,
                                                // color: Colors.amber,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    // 'Memmogram Ultrasound',
                                                    'นัดหมายเอกซเรย์เต้านม',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.access_time_filled,
                                                      size: 13,
                                                      color: Colors.blue[400],
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        child: Text(
                                                          '${widget.dateTimeGET} น.',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .grey[400],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  // color: Colors.black87,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.access_time,
                                                        size: 22,
                                                        color: Colors.blue[400],
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Flexible(
                                                        child: Container(
                                                          child: Text(
                                                            '${widget.dateDAYGET}',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .kanit(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),

                            getText(
                                'พัฒนาวิทยาการด้านการตรวจวินิจฉัยเต้านม โดยการฝึกอบรมรังสีแพทย์และนักรังสีการแพทย์ให้มีทักษะเชี่ยวชาญทางด้านนี้',
                                16,
                                Colors.black,
                                FontWeight.w300),
                            SizedBox(height: 10),
                            getText('การเตรียมตัวสำหรับผู้มาตรวจเอกซเรย์เต้านม',
                                16, Colors.black, FontWeight.w300),
                            getTextcontent(
                              '1.สวมเสื้อผ้าแยกชิ้น (เสื้อ กางเกง หรือเสื้อ กระโปรง)ไม่สวมชุดเดรส',
                            ),
                            getTextcontent(
                              '2.งดทาสารระงับกลิ่นกาย แป้ง บริเวณรักแร้ และเต้านม',
                            ),
                            getTextcontent(
                              '3.ทานอาหารตามปกติ',
                            ),
                            SizedBox(height: 10),
                            getText('เอกสารที่เกี่ยวข้อง', 16, Colors.black,
                                FontWeight.w300),
                            getTextcontent(
                              '1.ใบส่งตรวจวินิจฉัย (ถ้ามี)',
                            ),
                            getTextcontent(
                              '2.ผลการตรวจ , CD โรงพยาบาลอื่น (ถ้ามี)',
                            ),
                            getTextcontent(
                              '3.เอกสารรับรองสิทธิการรักษา (ถ้ามี)',
                            ),
                            getTextcontent(
                              '4.เอกสารการเปลี่ยนชื่อ - สกุล (ถ้ามี)',
                            ),
                            getTextcontent(
                              '5.บัตรประจำตัวประชาชน',
                            ),

                            Row(
                              children: [
                                getText('สถานะ', 16, Colors.black,
                                    FontWeight.normal),
                                SizedBox(
                                  width: 10,
                                ),
                                widget.statusGET == null
                                    ? Container()
                                    : widget.statusGET == 'success'
                                        ? status()
                                        : statusFail(),
                              ],
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                            widget.statusGET == null
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          xrayMark_page(
                                                            postpone: true,
                                                            ID_postpone: idGET,
                                                          )));
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 30),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
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
                                                'เลื่อนนัดหมาย',
                                                style: GoogleFonts.kanit(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
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
                                              showGeneralDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  barrierLabel:
                                                      MaterialLocalizations.of(
                                                              context)
                                                          .modalBarrierDismissLabel,
                                                  barrierColor:
                                                      Colors.transparent,
                                                  transitionDuration: Duration(
                                                      milliseconds: 200),
                                                  pageBuilder: (BuildContext
                                                              context,
                                                          Animation frist,
                                                          Animation second) =>
                                                      CancelMark());
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 30),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Color(0xffE6EFFE),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'ยกเลิกนัดหมาย',
                                                style: GoogleFonts.kanit(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff0088C6),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
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
        bottomNavigationBar: NavigagitonBar(),
      ),
      onWillPop: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => dating_page()));
      },
    );
  }

  Text getText(String txt, double size, Color color, FontWeight getW) {
    return Text(
      txt,
      style: GoogleFonts.kanit(
        fontSize: size,
        fontWeight: getW,
        color: color,
      ),
    );
  }

  Text getTextcontent(String txt) {
    return Text(
      txt,
      style: GoogleFonts.kanit(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
    );
  }

  Widget statusFail() {
    return Container(
      // height: 50,

      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
          ),
          Text(
            'ยกเลิก',
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.kanit(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget status() {
    return Container(
      // height: 50,

      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
          ),
          Text(
            'นัดหมายที่ผ่านแล้ว',
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.kanit(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

enum SingingCharacter { buse01, buse02, buse03, buse04, buse05, buse06 }

class CancelMark extends StatefulWidget {
  CancelMark({Key key}) : super(key: key);

  @override
  _CancelMarkState createState() => _CancelMarkState();
}

class _CancelMarkState extends State<CancelMark> {
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    print("DELETE ${idGET}");
  }

  Future<void> fetchData(int idSET) async {
    var url = '${apiurl().url}/appointment/${idSET}';
    final response = await http.delete(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      print('Status DELETE : ${response.statusCode}');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => dating_page()),
          (Route<dynamic> route) => false);
    } else if (response.statusCode == 401) {
      print('Status DELETE : ${response.statusCode}');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => dating_page()),
          (Route<dynamic> route) => false);
      print('Status DELETE : ${response.statusCode}');
      // print(url);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => loadingPage()));
    }
  }

  final TextEditingController _mark = new TextEditingController();
  SingingCharacter _character = SingingCharacter.buse01;
  bool txtck = false;
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
                                            AssetImage('images/cancel.png'))),
                                height: 80,
                                width: 80,
                              ),
                              Text(
                                "ยกเลิกนัดหมาย",
                                style: GoogleFonts.kanit(
                                    color: Colors.red, fontSize: 20),
                              ),
                              Text(
                                "คุณแน่ใจหรือไม่ว่าต้องการลบการนัดหมายนี้",
                                style: GoogleFonts.kanit(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1,
                                    child: Radio<SingingCharacter>(
                                      focusColor: Colors.amber,
                                      value: SingingCharacter.buse01,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                          txtck = false;
                                          _mark.text = '';
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    'ติดธุระ',
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1,
                                    child: Radio<SingingCharacter>(
                                      activeColor: Color(0xff0088C6),
                                      value: SingingCharacter.buse02,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                          txtck = false;
                                          _mark.text = '';
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    'เดินทางไม่สะดวก',
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1,
                                    child: Radio<SingingCharacter>(
                                      activeColor: Color(0xff0088C6),
                                      value: SingingCharacter.buse03,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                          txtck = false;
                                          _mark.text = '';
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    'เจ็บป่วย / ไม่สบาย',
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1,
                                    child: Radio<SingingCharacter>(
                                      activeColor: Color(0xff0088C6),
                                      value: SingingCharacter.buse04,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                          txtck = false;
                                          _mark.text = '';
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    'สิทธิรักษาไม่ส่งตัว',
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1,
                                    child: Radio<SingingCharacter>(
                                      activeColor: Color(0xff0088C6),
                                      value: SingingCharacter.buse05,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter value) {
                                        setState(() {
                                          _character = value;
                                          txtck = !txtck;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'ไม่สะดวกเนื่องจาก(เช่น สถานการณ์โควิท)',
                                      style: GoogleFonts.kanit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FormBuilderTextField(
                                enabled: txtck,
                                name: 'mark',
                                controller: _mark,
                                style: GoogleFonts.kanit(),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10),
                                      ),
                                    ),
                                    hintText: 'โปรดระบุสาเหตุ*',
                                    fillColor: Color(0xfff3f3f4),
                                    filled: false),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        fetchData(idGET);
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
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
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
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
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Color(0xffE6EFFE),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'ยกเลิก',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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

          return true;
        },
      );
  BoxShadow BoxShadow1(double _offset1, _offset2, _blur, _spread) {
    return BoxShadow(
      color: Colors.blue[100],
      offset: Offset(
        _offset1,
        _offset2,
      ),
      blurRadius: _blur,
      spreadRadius: _spread,
    );
  }

  BoxShadow BoxShadow2() {
    return BoxShadow(
      color: Colors.white,
      offset: const Offset(0.0, 0.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    );
  } //BoxShadow

}
