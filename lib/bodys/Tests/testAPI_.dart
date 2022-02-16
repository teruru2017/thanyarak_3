//@dart = 2.9
import 'dart:convert';

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
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/bodys/forgetpassword_pages.dart';
import 'package:thanyarak/bodys/login/main_login_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/newtype_pages.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/session.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:thanyarak/states/main_home.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';

class TestAPIPage extends StatefulWidget {
  TestAPIPage({
    Key key,
  }) : super(key: key);

  @override
  _TestAPIPageState createState() => _TestAPIPageState();
}

bool num1 = false;
String txt;
List<Appointments> users;
String Token;

class _TestAPIPageState extends State<TestAPIPage> {
  void initState() {
    getpin();
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
  }

  Future getpin() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
    });
  }

  Future<List<Appointments>> fetchData() async {
    var url = '${apiurl().url}/patient/appointments/100002';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.body);

      return jsonResponse
          .map((data) => new Appointments.fromJson(data))
          .toList();
    } else {
      print(response.statusCode);
      print(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            txt = 'success';
                          });
                        },
                        child: Text('success')),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            txt = 'fail';
                          });
                        },
                        child: Text('fail')),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Appointments>>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Appointments> apps = snapshot.data;

                      return ListView.builder(
                        itemCount: apps.length,
                        itemBuilder: (context, i) {
                          return apps[i].status == txt
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                detailMark_page()));
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
                                            gradient: apps[i].status == 'fail'
                                                ? LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                        Colors.red,
                                                        Colors.red
                                                      ])
                                                : apps[i].status == 'success'
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
                                                          child: Text(
                                                              apps[i]
                                                                  .location
                                                                  .name,
                                                              style: GoogleFonts
                                                                  .kanit(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {},
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
                                                            Icons.navigate_next,
                                                            color: Color(
                                                                0xff0088C6),
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
                                                              apps[i].datetime,
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
                                )
                              : Container();
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
            ],
          ),
        ),
      ),
    );
  }
}
