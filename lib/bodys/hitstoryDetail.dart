//@dart=2.9
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/detailcheck.dart';
import 'package:thanyarak/bodys/slipMark.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class hitstorydetail_page extends StatefulWidget {
  hitstorydetail_page({Key key}) : super(key: key);
  @override
  _hitstorydetail_pageState createState() => _hitstorydetail_pageState();
}

class _hitstorydetail_pageState extends State<hitstorydetail_page> {
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
                                          'รายละเอียดประวัติการตรวจ',
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
                          top: 90, left: 15, right: 15, bottom: 20),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 0, bottom: 0, top: 0, right: 0),
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
                                            colors: [
                                              Color(0xff0088C6),
                                              Color(0xff43CEF8)
                                            ]),
                                      ),
                                      child: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
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
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Mammogram Ultrasound',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
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
                                                        '11:30 | 12:30 น',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.grey[400],
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
                                                          '16-06-2564',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 16,
                                                            color: Colors.black,
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
                              14,
                              Colors.black,
                              FontWeight.normal),
                          SizedBox(
                            height: 10,
                          ),
                          getText(
                              'ตรวจวินิจฉัยโรคเต้านม ด้วยเครื่องมือแพทย์และเทคนิคที่ทันสมัย มีระบบประกันคุณภาพ เพื่อให้มีประสิทธิภาพที่ดี',
                              14,
                              Colors.black,
                              FontWeight.normal),
                          SizedBox(
                            height: 10,
                          ),
                          getText(
                              'ผลตรวจ', 14, Colors.black, FontWeight.normal),
                          SizedBox(
                            height: 10,
                          ),
                          getTextcontent(
                            'พัฒนาวิทยาการด้านการตรวจวินิจฉัยเต้านม โดยการฝึกอบรมรังสีแพทย์และนักรังสีการแพทย์ให้มีทักษะเชี่ยวชาญทางด้านนี้',
                          ),
                          getTextcontent(
                            'ตรวจวินิจฉัยโรคเต้านม ด้วยเครื่องมือแพทย์และเทคนิคที่ทันสมัย มีระบบประกันคุณภาพ เพื่อให้มีประสิทธิภาพที่ดี',
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            detailcheck_page()));
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
                                  'ขอผลตรวจ',
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
        fontSize: 14,
        fontWeight: FontWeight.w200,
        color: Colors.grey,
      ),
    );
  }
}
