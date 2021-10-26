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

  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/header3.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: 400,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 1.5,
                                  image: AssetImage("images/circle.png"),
                                  alignment: Alignment.center)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 1.8,
                                  image: AssetImage("images/userdata.png"),
                                  alignment: Alignment(0, 0.2))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    scale: 1.3,
                                    image: AssetImage("images/back01.png"),
                                    alignment: Alignment(-0.9, -0.7))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 700,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
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
                  SizedBox(height: 80),
                  Container(
                    // color: Colors.amber,
                    height: 136,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AnimatedContainer(
                          width: _bigger ? 136 : 80,
                          child: Image.asset('images/usernew.png'),
                          duration: Duration(seconds: 1),
                        ),
                        // Container(
                        //     width: 136,
                        //     height: 136,
                        //     decoration: BoxDecoration(
                        //         image: DecorationImage(
                        //       image: AssetImage('images/usernew.png'),
                        //     ))),
                        SizedBox(width: 80),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    width: userold ? 80 : 136,
                                    child: Image.asset('images/userold.png'),
                                    duration: Duration(seconds: 1),
                                  ),
                                  // Container(
                                  //     width: 80,
                                  //     height: 80,
                                  //     decoration: BoxDecoration(
                                  //         image: DecorationImage(
                                  //       image: AssetImage('images/userold.png'),
                                  //     ))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                      child: Row(
                    children: [
                      SizedBox(width: 25),
                      GestureDetector(
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
                          alignment: Alignment(-0.8, 0),
                          child: Text(
                            "ผู้มาตรวจ รายใหม่",
                            style: GoogleFonts.kanit(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 16,
                              color: _bigger
                                  ? Color(0xff272727)
                                  : Color(0xffB7B7B7),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 70),
                      GestureDetector(
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
                          alignment: Alignment(-0.8, 0),
                          child: Text(
                            "ผู้มาตรวจ รายเก่า",
                            style: GoogleFonts.kanit(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 16,
                              color: userold
                                  ? Color(0xffB7B7B7)
                                  : Color(0xff272727),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(height: 100),
                  GestureDetector(
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
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
