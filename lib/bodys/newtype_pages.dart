import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/oldtype_pages.dart';
import 'package:thanyarak/bodys/register1_pages.dart';
import 'package:thanyarak/bodys/registerdata_pages.dart';

import 'dart:developer' as developer;

class newtype_pages extends StatefulWidget {
  newtype_pages({Key? key}) : super(key: key);

  @override
  _newtype_pagesState createState() => _newtype_pagesState();
}

class _newtype_pagesState extends State<newtype_pages> {
  bool _bigger = true;
  bool userold = true;

  final double topWidgetHeight = 180.0;

  int a = 0;
  @override
  Widget build(BuildContext context) {
    double x1 = MediaQuery.of(context).size.width * 0.2;
    double x2 = MediaQuery.of(context).size.width * 0.4;
    double x3 = (MediaQuery.of(context).size.width / 2) - 20;
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Container(
                        child: Stack(children: [
                          Container(
                            padding: EdgeInsets.only(top: 45),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(60),
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Color(0xff43CEF8),
                                              Color(0xff43CEF8),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70),
                                child: Container(
                                  padding: EdgeInsets.all(60),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          scale: 1.5,
                                          image:
                                              AssetImage("images/userdata.png"),
                                          alignment: Alignment.topCenter)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    //color: Colors.amber,
                                    image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.topLeft)),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),

                  //พื้นหลังเนื้อหา
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
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
                    padding:
                        const EdgeInsets.only(top: 220, left: 15, right: 15),
                    child: Column(children: [
                      Align(
                        alignment: Alignment(-1, -1),
                        child: Text(
                          "ลงทะเบียน",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff0088C6),
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-1, -1),
                        child: Text(
                          "กรุณาเลือกประเภทของคุณ",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            color: Color(0xffB7B7B7),
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 136,
                              width: x3 + x3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: AnimatedContainer(
                                        //width: _bigger ? x2 : x1,
                                        margin: EdgeInsets.all(
                                          _bigger ? 0 : 30,
                                        ),
                                        child:
                                            Image.asset('images/usernew.png'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: AnimatedContainer(
                                        //width: userold ? x1 : x2,
                                        margin: EdgeInsets.all(
                                          _bigger ? 30 : 0,
                                        ),
                                        child:
                                            Image.asset('images/userold.png'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: x3 + x3,
                              //color: Colors.amber,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => setState(() {
                                        a = 0;
                                        // developer.log(a.toString());
                                        _bigger = !_bigger;
                                        userold = !userold;

                                        // Navigator.push(
                                        //     context,
                                        //     CupertinoPageRoute(
                                        //         builder: (context) => oldtype_pages()));
                                      }),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ผู้มาตรวจ รายใหม่",
                                          style: GoogleFonts.kanit(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 16,
                                            color: _bigger
                                                ? Color(0xff272727)
                                                : Color(0xffB7B7B7),
                                            // fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => setState(() {
                                        a = 1;
                                        // developer.log(a.toString());
                                        userold = !userold;
                                        _bigger = !_bigger;

                                        // Navigator.push(
                                        //     context,
                                        //     CupertinoPageRoute(
                                        //         builder: (context) => oldtype_pages()));
                                      }),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ผู้มาตรวจ รายเก่า",
                                          style: GoogleFonts.kanit(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .headline4,
                                            fontSize: 16,
                                            color: userold
                                                ? Color(0xffB7B7B7)
                                                : Color(0xff272727),
                                            // fontStyle: FontStyle.italic,
                                          ),
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
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                if (a == 0) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => registerdata_pages()));
                } else if (a == 1) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => register1_pages()));
                }
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
                child: Text(
                  "ถัดไป",
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 16,
                    color: Color(0xffFFFFFF),
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
