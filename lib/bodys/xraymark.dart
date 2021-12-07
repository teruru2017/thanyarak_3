//@dart=2.9
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/detaildonate_pages.dart';
import 'package:thanyarak/bodys/detaildonate_pagesB.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class xrayMark_page extends StatefulWidget {
  xrayMark_page({Key key}) : super(key: key);
  @override
  _xrayMark_pageState createState() => _xrayMark_pageState();
}

int btck = 0;
bool bt2 = true, page1 = false;
enum SingingCharacter { buse01, buse02, buse03, buse04, buse05, buse06, buse07 }
enum SingingCharacterV { have, donthave }
enum SingingCharacterCD { have, donthave }

SingingCharacter _character = SingingCharacter.buse01;
SingingCharacterV _characterV2 = SingingCharacterV.have;
SingingCharacterCD _characterCD = SingingCharacterCD.have;

class _xrayMark_pageState extends State<xrayMark_page> {
//

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
                      padding: EdgeInsets.all(10),
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
                                  padding: EdgeInsets.only(top: 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.center,
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'เลือกวันนัด',
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
                      padding: const EdgeInsets.only(top: 70),
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
                          top: 90, left: 15, right: 15, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 200,
                            padding: EdgeInsets.all(10),
                            color: Colors.black,
                          ),
                          Text(
                            'เวลานัด',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red[100],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:00 น.',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (bt2 == false) {
                                        } else {
                                          btck = 2;

                                          print(btck);
                                        }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: bt2 == false
                                              ? Border.all(
                                                  color: Colors.transparent)
                                              : Border.all(color: Colors.grey),
                                          color: bt2 == false
                                              ? Colors.red[100]
                                              : btck == 2
                                                  ? Colors.blue
                                                  : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: bt2 == false
                                                  ? Colors.red
                                                  : btck == 2
                                                      ? Colors.white
                                                      : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red[100],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:00 น.',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red[100],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:00 น.',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red[100],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:00 น.',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red[100],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:00 น.',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red[100],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:00 น.',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // if (bt2 == false) {
                                        // } else {
                                        //   btck = 2;

                                        //   print(btck);
                                        // }
                                      });
                                    },
                                    child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              // bt2 == false
                                              //     ? Border.all(
                                              //         color: Colors.transparent)
                                              //     : Border.all(color: Colors.grey)
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          // bt2 == false
                                          //     ? Colors.red[100]
                                          //     : btck == 2
                                          //         ? Colors.blue
                                          //         : Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '10:30 น.',
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                                // bt2 == false
                                                //     ? Colors.red
                                                //     : btck == 2
                                                //         ? Colors.white
                                                //         : Colors.black,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'เบอร์ติดต่อ',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          FormBuilderTextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            name: 'phnoe',
                            style: GoogleFonts.kanit(),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10),
                                  ),
                                ),
                                hintText: 'เบอร์โทรศัพท์',
                                fillColor: Color(0xfff3f3f4),
                                filled: false),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showGeneralDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    barrierLabel:
                                        MaterialLocalizations.of(context)
                                            .modalBarrierDismissLabel,
                                    barrierColor: Colors.transparent,
                                    transitionDuration:
                                        Duration(milliseconds: 200),
                                    pageBuilder: (BuildContext context,
                                            Animation frist,
                                            Animation second) =>
                                        CustomDialog());
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
                                gradient: btck == 0
                                    ? LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.grey[100],
                                          Colors.grey[100]
                                        ],
                                      )
                                    : LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xff0088C6),
                                          Color(0xff43CEF8)
                                        ],
                                      ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'นัดหมาย',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        btck == 0 ? Colors.grey : Colors.white,
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
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(),
    );
  }
}

class CustomDialog extends StatefulWidget {
  CustomDialog({Key key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    print(height);
    return Visibility(
      visible: !page1,
      child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(top: 80),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'สิทธิการรักษา และค่าบริการตรวจ',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacter>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacter.buse01,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'สิทธิเบิกจ่ายตรง กรมบัญชีกลาง',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacter>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacter.buse02,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'สิทธิเบิกราชการอื่นๆ',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacter>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacter.buse03,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'สิทธิประกันสังคม (รพ.ศิริราช)',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacter>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacter.buse04,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'สิทธิประกันสังคม (รพ.อื่น)',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacter>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacter.buse05,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'สิทธิหลักประกันคุณภาพ 30 บาท (บัตรทอง) (รพ.ศิริราช)',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacter>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacter.buse06,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'สิทธิหลักประกันคุณภาพ 30 บาท (บัตรทอง) (รพ.อื่น)',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacter>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacter.buse07,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'สิทธิหลักประกันคุณภาพ 30 บาท (บัตรทอง) (สิทธิว่าง)',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ค่าบริการ',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '1.ค่าบริการ 160 บาท',
                              style: GoogleFonts.kanit(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '2.ค่าเอ็กซ์เรย์ 999 บาท',
                              style: GoogleFonts.kanit(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '3.ค่ายารักษา 999 บาท',
                              style: GoogleFonts.kanit(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'เอกสารที่เกี่ยวข้อง',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ใบส่งตรวจวินิจฉัย',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacterV>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacterV.have,
                                  groupValue: _characterV2,
                                  onChanged: (SingingCharacterV valueV) {
                                    setState(() {
                                      _characterV2 = valueV;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'มี',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacterV>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacterV.donthave,
                                  groupValue: _characterV2,
                                  onChanged: (SingingCharacterV valueV) {
                                    setState(() {
                                      _characterV2 = valueV;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                'ไม่มี',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ผลการตรวจ, CD โรงพยาบาลอื่น',
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacterCD>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacterCD.have,
                                  groupValue: _characterCD,
                                  onChanged: (SingingCharacterCD valueV) {
                                    setState(() {
                                      _characterCD = valueV;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'มี',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: Radio<SingingCharacterCD>(
                                  activeColor: Color(0xff0088C6),
                                  value: SingingCharacterCD.donthave,
                                  groupValue: _characterCD,
                                  onChanged: (SingingCharacterCD valueV) {
                                    setState(() {
                                      _characterCD = valueV;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'ไม่มี',
                                  style: GoogleFonts.kanit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // height: 100,
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  showGeneralDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      barrierLabel:
                                          MaterialLocalizations.of(context)
                                              .modalBarrierDismissLabel,
                                      barrierColor: Colors.transparent,
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      pageBuilder: (BuildContext context,
                                              Animation frist,
                                              Animation second) =>
                                          SuscesDialog());
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
                                    'นัดหมาย',
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: NavigagitonBar()),
    );
  }
}

class SuscesDialog extends StatefulWidget {
  SuscesDialog({Key key}) : super(key: key);

  @override
  _SuscesDialogState createState() => _SuscesDialogState();
}

class _SuscesDialogState extends State<SuscesDialog> {
  @override
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/estimate.png'))),
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              "นัดตรวจสำเร็จ",
                              style: GoogleFonts.kanit(
                                  color: Color(0xff0088C6), fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'ชื่อ-สกุล',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'จอร์นาธาน วิคตอเรีย',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'ID No.',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'TYR123456759',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'HN',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'HN0012345',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'วันที่',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '20 มิถุนายน 2564',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'เวลา',
                                    style: GoogleFonts.kanit(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '09.40 น.',
                                        style: GoogleFonts.kanit(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'เอกสารที่เกี่ยวข้อง',
                                style: GoogleFonts.kanit(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '1.ใบส่งตรวจวินิจฉัย (ถ้ามี)',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '2.ผลการตรวจ , CD โรงพยาบาลอื่น (ถ้ามี)',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '3.เอกสารรับรองสิทธิการรักษา (ถ้ามี)',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '4.เอกสารการเปลี่ยนชื่อ - สกุล (ถ้ามี)',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '5.บัตรประจำตัวประชาชน',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "แก้ไขวันนัดหมาย",
                                style: GoogleFonts.kanit(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff0088C6),
                                    fontSize: 16),
                              ),
                            ),

                            //ปุ่ม

                            GestureDetector(
                              //หน้ายิงยังผิด
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: dating_page()),
                                );
                                setState(() {});
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
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
        // showGeneralDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     barrierLabel:
        //         MaterialLocalizations.of(context).modalBarrierDismissLabel,
        //     barrierColor: Colors.transparent,
        //     transitionDuration: Duration(milliseconds: 200),
        //     pageBuilder:
        //         (BuildContext context, Animation frist, Animation second) =>
        //             detaildonate_pages());
        return true;
      });
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
