//@dart=2.9
import 'dart:convert';
//import 'dart:html';
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
import 'package:page_transition/page_transition.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/detailcheck.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/hitstoryDetail.dart';
import 'package:thanyarak/bodys/mark_procedure.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:json_helpers/json_helpers.dart';
//import 'package:group_button/group_button.dart';
import 'package:thanyarak/models/mark_model.dart';

import 'package:thanyarak/widgets/NavigationBar.dart';

import 'package:http/http.dart' as http;
import 'package:thanyarak/widgets/mark_widget.dart';
import 'package:thanyarak/bodys/xray.dart';

class hitstory_pages extends StatefulWidget {
  hitstory_pages({Key key}) : super(key: key);
  @override
  _hitstory_pages_pagesState createState() => _hitstory_pages_pagesState();
}

int countMark = 1;
bool isCheckcked = false;
bool isCheckckedBT = true;
bool BT = false;
double _countCheckbox = 0;

final List<Marks> ListMarkLast = Marks.generateMarksLast();

class _hitstory_pages_pagesState extends State<hitstory_pages> {
  final CarouselController _controller = CarouselController();

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
                            padding:
                                EdgeInsets.only(top: 20, left: 0, right: 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5, right: 10),
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.center,
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Container(
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'ประวัติการตรวจ',
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
                                Expanded(
                                  flex: _w,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: dating_page()),
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF43CEF8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        // child: FlatButton.icon(
                                        //   icon: Image.asset('images/calen.png',
                                        //       scale: 1.2),
                                        //   label: Flexible(
                                        //     child: Text(
                                        //       'ตารางนัดหมาย',
                                        //       overflow: TextOverflow.ellipsis,
                                        //       style: GoogleFonts.kanit(
                                        //           color: Colors.white),
                                        //     ),
                                        //   ),
                                        // ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Wrap(
                                            spacing: 2,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              Image.asset('images/calen.png',
                                                  scale: 2),
                                              Text(
                                                'ประวัติการตรวจ',
                                                style: GoogleFonts.kanit(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            if (isCheckckedBT == false) {
                                              BT = false;
                                            } else {
                                              if (_countCheckbox >= 1) {
                                                BT = true;
                                              }
                                            }
                                            isCheckckedBT = !isCheckckedBT;
                                            isCheckcked = !isCheckcked;
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
                                                  Icons.check_box_outlined,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                Text(
                                                  'เลือก',
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
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: ListMarkLast.map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                hitstorydetail_page()));
                                  },
                                  child: Container(
                                    height: 90,
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
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
                                              left: 20, bottom: 15, top: 15),
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            gradient: e.type == 'cancel'
                                                ? LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                        Colors.red,
                                                        Colors.red
                                                      ])
                                                : e.type == 'succ'
                                                    ? LinearGradient(
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                        colors: [
                                                            Color(0xFF88D31D),
                                                            Color(0xFF88D31D)
                                                          ])
                                                    : LinearGradient(
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.topCenter,
                                                        colors: [
                                                            Color(0xff0088C6),
                                                            Color(0xff43CEF8)
                                                          ]),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: Image.asset(
                                              'images/history__outline.png',
                                              scale: 2),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
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
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(e.name,
                                                              style: GoogleFonts
                                                                  .kanit(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: isCheckckedBT,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                CupertinoPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            hitstorydetail_page()));
                                                          },
                                                          icon: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey.shade50,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: const Icon(
                                                              Icons
                                                                  .navigate_next,
                                                              color: Color(
                                                                  0xff0088C6),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: isCheckcked,
                                                        child: Checkbox(
                                                          value: e.value,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              e.value =
                                                                  !e.value;
                                                              if (e.value ==
                                                                  true) {
                                                                _countCheckbox++;
                                                              } else {
                                                                _countCheckbox =
                                                                    _countCheckbox -
                                                                        1;
                                                              }
                                                              if (_countCheckbox >=
                                                                  1) {
                                                                BT = true;
                                                              } else {
                                                                BT = false;
                                                              }
                                                              print(
                                                                  _countCheckbox);
                                                            });
                                                          },
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
                                                        color:
                                                            Color(0xff0088C6),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Flexible(
                                                        child: Container(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              e.date +
                                                                  ' | ' +
                                                                  e.time,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .kanit(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .grey[400],
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
                                ),
                              ).toList(),
                            ),
                          ),
                          // Container(
                          //   height: 500,
                          //   padding: EdgeInsets.all(10),
                          //   color: Colors.black,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: BT,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.transparent,
                    child: GestureDetector(
                      //หน้ายิงยังผิด
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => detailcheck_page()));
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
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
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(),
    );
  }
}
