import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';

class setting_page extends StatefulWidget {
  setting_page({Key? key}) : super(key: key);

  @override
  _setting_pageState createState() => _setting_pageState();
}

bool value = true;

class _setting_pageState extends State<setting_page> {
  bool isSwitched = false;
  final double topWidgetHeight = 90.0;
  final double avatarRadius = 70.0;
  final double cameraRadius = 20.0;

  bool txt = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                                EdgeInsets.only(top: 20, left: 15, right: 15),
                            child: Row(
                              children: <Widget>[
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
                                          'ตั้งค่า',
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
                      padding: const EdgeInsets.only(top: 90),
                      child: Container(
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
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.only(
                                    top: 30,
                                    left: 20,
                                    right: 20,
                                  ),
                                  children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.blue.shade50,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        height: 100,
                                        child: Row(children: <Widget>[
                                          Expanded(
                                              flex: 8,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'แจ้งเตือน',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          isSwitched == false
                                                              ? 'ปิด'
                                                              : 'เปิด',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 18,
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Expanded(
                                              flex: 2, child: buildSwitch()),
                                        ])),
                                    SizedBox(height: 20),
                                    // Container(
                                    //     decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         border: Border.all(
                                    //           color: Colors.blue.shade50,
                                    //         ),
                                    //         boxShadow: [
                                    //           BoxShadow(
                                    //             color: Colors.grey
                                    //                 .withOpacity(0.1),
                                    //             spreadRadius: 2,
                                    //             blurRadius: 2,
                                    //             offset: Offset(0, 2),
                                    //           )
                                    //         ],
                                    //         borderRadius: BorderRadius.all(
                                    //             Radius.circular(20))),
                                    //     height: 100,
                                    //     child: Row(children: <Widget>[
                                    //       Expanded(
                                    //           flex: 8,
                                    //           child: Container(
                                    //             padding:
                                    //                 EdgeInsets.only(left: 10),
                                    //             child: Column(
                                    //               mainAxisAlignment:
                                    //                   MainAxisAlignment.center,
                                    //               children: [
                                    //                 Container(
                                    //                   padding: EdgeInsets.only(
                                    //                       left: 10),
                                    //                   child: Align(
                                    //                     alignment: Alignment
                                    //                         .centerLeft,
                                    //                     child: Text(
                                    //                       'ภาษา',
                                    //                       style:
                                    //                           GoogleFonts.kanit(
                                    //                         fontSize: 14,
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //                 Container(
                                    //                   padding: EdgeInsets.only(
                                    //                       left: 10),
                                    //                   child: Align(
                                    //                     alignment: Alignment
                                    //                         .centerLeft,
                                    //                     child: Text(
                                    //                       'ไทย',
                                    //                       style:
                                    //                           GoogleFonts.kanit(
                                    //                         fontSize: 18,
                                    //                         color: Colors.blue,
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //           )),
                                    //       Expanded(
                                    //           flex: 2,
                                    //           child: Container(
                                    //             decoration: BoxDecoration(
                                    //                 image: DecorationImage(
                                    //                     image: AssetImage(
                                    //                         'images/0.png'),
                                    //                     scale: 1.5)),
                                    //             // color: Colors.green,
                                    //           )),
                                    //     ])),
                                    SizedBox(height: 20),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.blue.shade50,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        height: 100,
                                        child: Row(children: <Widget>[
                                          Expanded(
                                              flex: 8,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'เวอร์ชั่น',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          '1.00.00',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 18,
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                  // decoration: BoxDecoration(
                                                  //     image: DecorationImage(
                                                  //         image: AssetImage(
                                                  //             'images/0.png'),
                                                  //         scale: 1.5)),
                                                  // color: Colors.green,
                                                  )),
                                        ])),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(actionGet: 5),
    );
  }

  Widget buildSwitch() => Transform.scale(
        scale: 1,
        child: Switch.adaptive(
          activeColor: Colors.white,
          activeTrackColor: Colors.green.shade400,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          splashRadius: 20,
          value: isSwitched,
          onChanged: (value) => setState(() {
            setState(() {
              isSwitched = value;
            });
          }),
        ),
      );
}
