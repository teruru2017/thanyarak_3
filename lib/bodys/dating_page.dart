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
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_appointments.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/hitstoryCk_page.dart';
import 'package:thanyarak/bodys/hitstoryDetail.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/mark_procedure.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
//import 'package:json_helpers/json_helpers.dart';

import 'package:thanyarak/widgets/NavigationBar.dart';

import 'package:http/http.dart' as http;
import 'package:thanyarak/widgets/mark_widget.dart';
import 'package:thanyarak/bodys/xray.dart';

String Token;

class dating_page extends StatefulWidget {
  dating_page({Key key}) : super(key: key);
  @override
  _dating_pageState createState() => _dating_pageState();
}

int countMark = 1;

String txt, pid;

class _dating_pageState extends State<dating_page> {
  final CarouselController _controller = CarouselController();
  void initState() {
    getpin();
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
  }

  Future<List<Appointments>> futureData;
  Future getpin() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
      pid = per.getString('pid');
      futureData = fetchData(pid);
    });
  }

  Future<List<Appointments>> fetchData(String pidSET) async {
    var url = '${apiurl().url}/patient/appointments/${pidSET}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // print(response.body);

      return jsonResponse
          .map((data) => new Appointments.fromJson(data))
          .toList();
    } else if (response.statusCode == 401) {
      print('Status Getcid : ${response.statusCode}');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    } else {
      print(response.statusCode);
    }
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
                              padding:
                                  EdgeInsets.only(top: 0, left: 0, right: 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      // color: Colors.amber,
                                      margin: EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      MainPage()));
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
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Container(
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'การนัดหมาย',
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
                                  SizedBox(width: 10),
                                  Expanded(
                                    flex: _w,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  hitstory_pages())),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 25),
                                        child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff43CEF8),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Wrap(
                                                spacing: 2,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      'images/history__outline.png',
                                                      scale: 3),
                                                  Text(
                                                    'ประวัติการตรวจ',
                                                    style: GoogleFonts.kanit(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: _w,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 25),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
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
                                                      Addmark());
                                            },
                                          );
                                        },
                                        child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff69E6E7),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Wrap(
                                                spacing: 2,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .add_circle_outline_outlined,
                                                      color: Colors.white),
                                                  Text(
                                                    'เพิ่มนัดหมาย',
                                                    style: GoogleFonts.kanit(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 30,
                              margin: EdgeInsets.only(left: 0, right: 0),
                              decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          countMark = 1;

                                          print("SET ALL");
                                          txt = 'all';
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: countMark == 1
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'ทั้งหมด',
                                            style: GoogleFonts.kanit(
                                                color: countMark == 1
                                                    ? Color(0xff0088C6)
                                                    : Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          countMark = 2;
                                          print("SET NULL");
                                          txt = null;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: countMark == 2
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text('วันที่นัดล่าสุด',
                                              style: GoogleFonts.kanit(
                                                  color: countMark == 2
                                                      ? Color(0xff0088C6)
                                                      : Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          countMark = 3;
                                          print("SET success");
                                          txt = 'success';
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: countMark == 3
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text('ผ่านแล้ว',
                                              style: GoogleFonts.kanit(
                                                  color: countMark == 3
                                                      ? Color(0xff0088C6)
                                                      : Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          countMark = 4;
                                          print("SET cancel & fail ");
                                          txt = 'fail';
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: countMark == 4
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text('ยกเลิก',
                                              style: GoogleFonts.kanit(
                                                  color: countMark == 4
                                                      ? Color(0xff0088C6)
                                                      : Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      //พื้นหลังเนื้อหา
                      Padding(
                        padding: const EdgeInsets.only(top: 130),
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
                            top: 130, left: 15, right: 15, bottom: 20),
                        child: Container(
                          child: FutureBuilder<List<Appointments>>(
                            future: futureData,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<Appointments> apps = snapshot.data;

                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: apps.length,
                                  itemBuilder: (context, i) {
                                    return txt == null
                                        ? apps[i].status == txt
                                            ? GestureDetector(
                                                onTap: () {
                                                  final splitted = apps[i]
                                                      .datetime
                                                      .split(' ');
                                                  print(splitted[0]);
                                                  final dateMM =
                                                      splitted[0].split('-');
                                                  print(splitted[1]);

                                                  String strDAY =
                                                      "${dateMM[2].toString()}-${dateMM[1].toString()}-${dateMM[0].toString()}";
                                                  String strTIME =
                                                      "${splitted[1]}";

                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                      builder: (context) =>
                                                          detailMark_page(
                                                        dateTimeGET: strTIME,
                                                        dateDAYGET: strDAY,
                                                        idGET: apps[i].id,
                                                        statusGET:
                                                            apps[i].status,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 90,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.1),
                                                          spreadRadius: 1,
                                                          blurRadius: 10,
                                                          offset: Offset(0,
                                                              2) // changes position of shadow
                                                          ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 20,
                                                            bottom: 15,
                                                            top: 15),
                                                        height: 60,
                                                        width: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient: apps[i]
                                                                      .status ==
                                                                  'fail'
                                                              ? LinearGradient(
                                                                  begin: Alignment
                                                                      .bottomCenter,
                                                                  end: Alignment.topCenter,
                                                                  colors: [
                                                                      Colors
                                                                          .red,
                                                                      Colors.red
                                                                    ])
                                                              : apps[i].status ==
                                                                      'success'
                                                                  ? LinearGradient(
                                                                      begin:
                                                                          Alignment.bottomCenter,
                                                                      end: Alignment.topCenter,
                                                                      colors: [
                                                                          Color(
                                                                              0xFF88D31D),
                                                                          Color(
                                                                              0xFF88D31D)
                                                                        ])
                                                                  : LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment.topCenter,
                                                                      colors: [
                                                                          Color(
                                                                              0xff0088C6),
                                                                          Color(
                                                                              0xff43CEF8)
                                                                        ]),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(15),
                                                          ),
                                                        ),
                                                        child: Image.asset(
                                                            'images/history__outline.png',
                                                            scale: 2),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 20,
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
                                                                        child:
                                                                            Text(
                                                                          "",
                                                                          style:
                                                                              GoogleFonts.kanit(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {},
                                                                      icon:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade50,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .navigate_next,
                                                                          color:
                                                                              Color(0xff0088C6),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .access_time_filled,
                                                                      size: 14,
                                                                      color: Color(
                                                                          0xff0088C6),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            apps[i].datetime,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                GoogleFonts.kanit(
                                                                              fontSize: 14,
                                                                              color: Colors.grey[400],
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
                                              )
                                            : Container()
                                        : txt == 'fail'
                                            ? apps[i].status == txt
                                                ? GestureDetector(
                                                    onTap: () {
                                                      const string =
                                                          'Hello world!';
                                                      final splitted = apps[i]
                                                          .datetime
                                                          .split(' ');
                                                      print(splitted[0]);

                                                      final dateMM = splitted[0]
                                                          .split('-');
                                                      print(splitted[1]);

                                                      String strDAY =
                                                          "${dateMM[2].toString()}-${dateMM[1].toString()}-${dateMM[0].toString()}";
                                                      String strTIME =
                                                          "${splitted[1]}";

                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                          builder: (context) =>
                                                              detailMark_page(
                                                            dateTimeGET:
                                                                strTIME,
                                                            dateDAYGET: strDAY,
                                                            idGET: apps[i].id,
                                                            statusGET:
                                                                apps[i].status,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 90,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 10,
                                                              offset: Offset(0,
                                                                  2) // changes position of shadow
                                                              ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    bottom: 15,
                                                                    top: 15),
                                                            height: 60,
                                                            width: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient: apps[i]
                                                                          .status ==
                                                                      'fail'
                                                                  ? LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment.topCenter,
                                                                      colors: [
                                                                          Colors
                                                                              .red,
                                                                          Colors
                                                                              .red
                                                                        ])
                                                                  : apps[i].status ==
                                                                          'success'
                                                                      ? LinearGradient(
                                                                          begin:
                                                                              Alignment.bottomCenter,
                                                                          end: Alignment.topCenter,
                                                                          colors: [
                                                                              Color(0xFF88D31D),
                                                                              Color(0xFF88D31D)
                                                                            ])
                                                                      : LinearGradient(
                                                                          begin:
                                                                              Alignment.bottomCenter,
                                                                          end: Alignment.topCenter,
                                                                          colors: [
                                                                              Color(0xff0088C6),
                                                                              Color(0xff43CEF8)
                                                                            ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    15),
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                                'images/history__outline.png',
                                                                scale: 2),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 20,
                                                                      right: 10,
                                                                      bottom:
                                                                          15,
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
                                                                            child: Text("",
                                                                                style: GoogleFonts.kanit(
                                                                                  fontSize: 18,
                                                                                  color: Colors.black,
                                                                                )),
                                                                          ),
                                                                        ),
                                                                        IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.grey.shade50,
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            child:
                                                                                const Icon(
                                                                              Icons.navigate_next,
                                                                              color: Color(0xff0088C6),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .access_time_filled,
                                                                          size:
                                                                              14,
                                                                          color:
                                                                              Color(0xff0088C6),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Align(
                                                                              alignment: Alignment.centerLeft,
                                                                              child: Text(
                                                                                apps[i].datetime,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: GoogleFonts.kanit(
                                                                                  fontSize: 14,
                                                                                  color: Colors.grey[400],
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
                                                  )
                                                : Container()
                                            : txt == 'success'
                                                ? apps[i].status == txt
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          const string =
                                                              'Hello world!';
                                                          final splitted =
                                                              apps[i]
                                                                  .datetime
                                                                  .split(' ');
                                                          print(splitted[0]);
                                                          final dateMM =
                                                              splitted[0]
                                                                  .split('-');
                                                          print(splitted[1]);

                                                          String strDAY =
                                                              "${dateMM[2].toString()}-${dateMM[1].toString()}-${dateMM[0].toString()}";
                                                          String strTIME =
                                                              "${splitted[1]}";

                                                          Navigator.push(
                                                            context,
                                                            CupertinoPageRoute(
                                                              builder: (context) =>
                                                                  detailMark_page(
                                                                dateTimeGET:
                                                                    strTIME,
                                                                dateDAYGET:
                                                                    strDAY,
                                                                idGET:
                                                                    apps[i].id,
                                                                statusGET:
                                                                    apps[i]
                                                                        .status,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 90,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  20),
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.1),
                                                                  spreadRadius:
                                                                      1,
                                                                  blurRadius:
                                                                      10,
                                                                  offset: Offset(
                                                                      0,
                                                                      2) // changes position of shadow
                                                                  ),
                                                            ],
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20,
                                                                        bottom:
                                                                            15,
                                                                        top:
                                                                            15),
                                                                height: 60,
                                                                width: 60,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient: apps[i]
                                                                              .status ==
                                                                          'fail'
                                                                      ? LinearGradient(
                                                                          begin:
                                                                              Alignment.bottomCenter,
                                                                          end: Alignment.topCenter,
                                                                          colors: [
                                                                              Colors.red,
                                                                              Colors.red
                                                                            ])
                                                                      : apps[i].status ==
                                                                              'success'
                                                                          ? LinearGradient(
                                                                              begin: Alignment.bottomCenter,
                                                                              end: Alignment.topCenter,
                                                                              colors: [
                                                                                  Color(0xFF88D31D),
                                                                                  Color(0xFF88D31D)
                                                                                ])
                                                                          : LinearGradient(
                                                                              begin: Alignment.bottomCenter,
                                                                              end: Alignment.topCenter,
                                                                              colors: [
                                                                                  Color(0xff0088C6),
                                                                                  Color(0xff43CEF8)
                                                                                ]),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                                  ),
                                                                ),
                                                                child: Image.asset(
                                                                    'images/history__outline.png',
                                                                    scale: 2),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: 20,
                                                                      right: 10,
                                                                      bottom:
                                                                          15,
                                                                      top: 15),
                                                                  child: Column(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Align(
                                                                                alignment: Alignment.centerLeft,
                                                                                child: Text("",
                                                                                    style: GoogleFonts.kanit(
                                                                                      fontSize: 18,
                                                                                      color: Colors.black,
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                            IconButton(
                                                                              onPressed: () {},
                                                                              icon: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.grey.shade50,
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                ),
                                                                                child: const Icon(
                                                                                  Icons.navigate_next,
                                                                                  color: Color(0xff0088C6),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.access_time_filled,
                                                                              size: 14,
                                                                              color: Color(0xff0088C6),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Flexible(
                                                                              child: Container(
                                                                                child: Align(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  child: Text(
                                                                                    apps[i].datetime,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    style: GoogleFonts.kanit(
                                                                                      fontSize: 14,
                                                                                      color: Colors.grey[400],
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
                                                      )
                                                    : Container()
                                                : GestureDetector(
                                                    onTap: () {
                                                      const string =
                                                          'Hello world!';
                                                      final splitted = apps[i]
                                                          .datetime
                                                          .split(' ');
                                                      print(splitted[0]);
                                                      final dateMM = splitted[0]
                                                          .split('-');
                                                      print(splitted[1]);

                                                      String strDAY =
                                                          "${dateMM[2].toString()}-${dateMM[1].toString()}-${dateMM[0].toString()}";
                                                      String strTIME =
                                                          "${splitted[1]}";

                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                          builder: (context) =>
                                                              detailMark_page(
                                                            dateTimeGET:
                                                                strTIME,
                                                            dateDAYGET: strDAY,
                                                            idGET: apps[i].id,
                                                            statusGET:
                                                                apps[i].status,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 90,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.1),
                                                              spreadRadius: 1,
                                                              blurRadius: 10,
                                                              offset: Offset(0,
                                                                  2) // changes position of shadow
                                                              ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 20,
                                                                    bottom: 15,
                                                                    top: 15),
                                                            height: 60,
                                                            width: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient: apps[i]
                                                                          .status ==
                                                                      'fail'
                                                                  ? LinearGradient(
                                                                      begin: Alignment
                                                                          .bottomCenter,
                                                                      end: Alignment.topCenter,
                                                                      colors: [
                                                                          Colors
                                                                              .red,
                                                                          Colors
                                                                              .red
                                                                        ])
                                                                  : apps[i].status ==
                                                                          'success'
                                                                      ? LinearGradient(
                                                                          begin:
                                                                              Alignment.bottomCenter,
                                                                          end: Alignment.topCenter,
                                                                          colors: [
                                                                              Color(0xFF88D31D),
                                                                              Color(0xFF88D31D)
                                                                            ])
                                                                      : LinearGradient(
                                                                          begin:
                                                                              Alignment.bottomCenter,
                                                                          end: Alignment.topCenter,
                                                                          colors: [
                                                                              Color(0xff0088C6),
                                                                              Color(0xff43CEF8)
                                                                            ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    15),
                                                              ),
                                                            ),
                                                            child: Image.asset(
                                                                'images/history__outline.png',
                                                                scale: 2),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 20,
                                                                      right: 10,
                                                                      bottom:
                                                                          15,
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
                                                                            child: Text("",
                                                                                style: GoogleFonts.kanit(
                                                                                  fontSize: 18,
                                                                                  color: Colors.black,
                                                                                )),
                                                                          ),
                                                                        ),
                                                                        IconButton(
                                                                          onPressed:
                                                                              () {},
                                                                          icon:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.grey.shade50,
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            child:
                                                                                const Icon(
                                                                              Icons.navigate_next,
                                                                              color: Color(0xff0088C6),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .access_time_filled,
                                                                          size:
                                                                              14,
                                                                          color:
                                                                              Color(0xff0088C6),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Align(
                                                                              alignment: Alignment.centerLeft,
                                                                              child: Text(
                                                                                apps[i].datetime,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: GoogleFonts.kanit(
                                                                                  fontSize: 14,
                                                                                  color: Colors.grey[400],
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
                                                  );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ),
                        // MarkWidget(
                        //   id: countMark == 1
                        //       ? 'all'
                        //       : countMark == 2
                        //           ? 'last'
                        //           : countMark == 3
                        //               ? 'succ'
                        //               : 'cancel',
                        // ),
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
            context, CupertinoPageRoute(builder: (context) => MainPage()));
      },
    );
  }
}

class Addmark extends StatefulWidget {
  Addmark({Key key}) : super(key: key);

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
                                              : Colors.grey[300],
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
                                              : Colors.grey[300],
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
