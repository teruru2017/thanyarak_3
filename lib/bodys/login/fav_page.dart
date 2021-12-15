import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/donate_widget.dart';

class fav_page extends StatefulWidget {
  fav_page({Key? key}) : super(key: key);

  @override
  _fav_pageState createState() => _fav_pageState();
}

class _fav_pageState extends State<fav_page> {
  final double avatarRadius = 70.0;
  final double cameraRadius = 20.0;

  bool txt = true;
  Color bar1 = Colors.white;
  Color bar2 = Colors.transparent;
  Color font1 = Colors.blue;
  Color font2 = Colors.white;

  @override
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
                            //color: Colors.amber,
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
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1,
                                        image: AssetImage("images/back01.png"),
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
                                          'ที่บันทึกไว้',
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
                                              // Navigator.push(
                                              //     context,
                                              //     CupertinoPageRoute(
                                              //         builder: (context) =>
                                              //             MenuPage()));
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
                          Container(
                            //color: Colors.amber,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 15, right: 15),
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
                      padding:
                          const EdgeInsets.only(top: 150, left: 15, right: 15),
                      child: Column(
                        children: [bar1 == Colors.white ? article() : donate()],
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
    );
  }

  Container article() {
    return Container(
      child: articleWidget(),
    );
  }

  Container donate() {
    return Container(
      child: DonateWidget(),
    );
  }
}
