import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/conditions_page.dart';
import 'package:thanyarak/bodys/editpassword_page.dart';
import 'package:thanyarak/bodys/editprofile_page.dart';
import 'package:thanyarak/bodys/estimate_page.dart';
import 'package:thanyarak/bodys/fav_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/setting_page.dart';

class menumember_pages extends StatefulWidget {
  menumember_pages({Key? key}) : super(key: key);

  @override
  _menumember_pagesState createState() => _menumember_pagesState();
}

class _menumember_pagesState extends State<menumember_pages> {
  final double topWidgetHeight = 120.0;
  final double avatarRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("images/bg_menu.png"),
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(children: [
                        Container(
                          height: topWidgetHeight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(top: 30, left: 25),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'สมาชิก',
                                      style: GoogleFonts.kanit(
                                        fontSize: 24,
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
                                    margin: EdgeInsets.only(top: 35),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            height: 20,
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
                        Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.transparent,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),

                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 60),
                                  child: Text(
                                    'จอร์นาธาน วิคตอร์เรีย',
                                    style: GoogleFonts.kanit(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    padding: EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      editprofile_page()));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.blue.shade50,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 0),
                                                  )
                                                ]),
                                            height: 60,
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/1.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                              Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'ตั้งค่าข้อมูลส่วนตัว',
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/0.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                            ])),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      editpassword_page()));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                left: BorderSide(
                                                  color: Colors.blue.shade50,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.blue.shade50,
                                                ),
                                                bottom: BorderSide(
                                                  color: Colors.blue.shade50,
                                                ),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 5),
                                                )
                                              ]),
                                          height: 60,
                                          child: Row(children: <Widget>[
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'images/2.png'),
                                                          scale: 1.5)),
                                                  // color: Colors.green,
                                                )),
                                            Expanded(
                                                flex: 8,
                                                child: Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'แก้ไขรหัสผ่าน',
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'images/0.png'),
                                                          scale: 1.5)),
                                                  // color: Colors.green,
                                                )),
                                          ]),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      fav_page()));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  left: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  right: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  bottom: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 5),
                                                  )
                                                ]),
                                            height: 60,
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/3.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                              Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'ที่บันทึกไว้',
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/0.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                            ])),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      setting_page()));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  left: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  right: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  bottom: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 5),
                                                  )
                                                ]),
                                            height: 60,
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/4.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                              Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'ตั้งค่า',
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/0.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                            ])),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      ConditionsPage()));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  left: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  right: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 5),
                                                  )
                                                ]),
                                            height: 60,
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/5.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                              Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'ข้อกำหนดและเงื่อนไข',
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/0.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                            ])),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      estimate_page()));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.blue.shade50,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 5),
                                                  )
                                                ]),
                                            height: 60,
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/6.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                              Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'ออกจากระบบ',
                                                        style:
                                                            GoogleFonts.kanit(
                                                                fontSize: 18,
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                    ),
                                                  )),
                                            ])),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            //เนื้อหาตรงแดงๆ
                            // child: ListView(
                            //   padding: EdgeInsets.only(
                            //       top: 60, left: 20, right: 20),
                            //   children: <Widget>[
                            //     Container(
                            //       height: 50,
                            //       color: Colors.amber[600],
                            //       child: Center(child: Text('Entry A')),
                            //     ),
                            //     Container(
                            //       height: 50,
                            //       color: Colors.amber[500],
                            //       child: Center(child: Text('Entry B')),
                            //     ),
                            //     Container(
                            //       height: 50,
                            //       color: Colors.amber[100],
                            //       child: Center(child: Text('Entry C')),
                            //     ),
                            //   ],
                            // ),
                          ),
                        )
                      ]))
                ],
              ),
              Positioned(
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: AssetImage('images/Member_login.png'),
                ),
                left: (MediaQuery.of(context).size.width / 2) - avatarRadius,
                top: topWidgetHeight - avatarRadius,
              )
            ],
          ),
        ),
      ),
    );
  }
}
