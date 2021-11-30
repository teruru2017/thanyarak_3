import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';

class fav_page extends StatefulWidget {
  fav_page({Key? key}) : super(key: key);

  @override
  _fav_pageState createState() => _fav_pageState();
}

class _fav_pageState extends State<fav_page> {
  final double topWidgetHeight = 130.0;
  final double avatarRadius = 70.0;
  final double cameraRadius = 20.0;

  bool txt = true;
  Color bar1 = Colors.white;
  Color bar2 = Colors.transparent;
  Color font1 = Colors.blue;
  Color font2 = Colors.white;

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
                          //color: Colors.green,
                          height: topWidgetHeight - 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.only(top: 45, left: 30),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.topLeft,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(top: 45),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'ที่บันทึกไว้',
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
                                  margin: EdgeInsets.only(top: 50, left: 25),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/bin.png"),
                                        alignment: Alignment.topLeft,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: topWidgetHeight - 80,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 25, right: 25),
                          child: Column(children: <Widget>[
                            Container(
                              height: 35,
                              padding: EdgeInsets.only(),
                              decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            //bar1 == bar1 ? bar2 : bar1;
                                            if (bar1 == Colors.white) {
                                            } else {
                                              bar1 == Colors.transparent
                                                  ? bar1 = Colors.white
                                                  : bar1 = Colors.transparent;

                                              font1 == Colors.white
                                                  ? font1 = Colors.blue
                                                  : font1 = Colors.white;

                                              bar2 == Colors.white
                                                  ? bar2 = Colors.transparent
                                                  : bar2 = Colors.white;
                                              font2 == Colors.blue
                                                  ? font2 = Colors.white
                                                  : font2 = Colors.blue;
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: bar1,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text('บทความ',
                                                style: GoogleFonts.kanit(
                                                    color: font1)),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    width: 1,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (bar2 == Colors.white) {
                                            } else {
                                              bar1 == Colors.transparent
                                                  ? bar1 = Colors.white
                                                  : bar1 = Colors.transparent;

                                              font1 == Colors.white
                                                  ? font1 = Colors.blue
                                                  : font1 = Colors.white;

                                              bar2 == Colors.white
                                                  ? bar2 = Colors.transparent
                                                  : bar2 = Colors.white;
                                              font2 == Colors.blue
                                                  ? font2 = Colors.white
                                                  : font2 = Colors.blue;
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: bar2,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text('บริจาค',
                                                style: GoogleFonts.kanit(
                                                    color: font2)),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ]),
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
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 30, left: 25, right: 25),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
