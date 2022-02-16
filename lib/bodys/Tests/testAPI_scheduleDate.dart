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
import 'package:thanyarak/bodys/API/api_rights.dart';
import 'package:thanyarak/bodys/API/api_scheduleDate.dart';
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

class TestAPIscheduleDatePage extends StatefulWidget {
  TestAPIscheduleDatePage({
    Key key,
  }) : super(key: key);

  @override
  _TestAPIPageState createState() => _TestAPIPageState();
}

bool num1 = false;
String txt;
List<ScheduleDate> users;
String Token;

class _TestAPIPageState extends State<TestAPIscheduleDatePage> {
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
      // fetchData();
    });
  }

  // Future<List<ScheduleDate>> fetchData() async {
  //   var url = '${apiurl().url}/scheduleDate/1/2022-02';
  //   final response = await http.get(Uri.parse(url), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${Token}',
  //   });
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     print(response.body);

  //     return jsonResponse
  //         .map((data) => new ScheduleDate.fromJson(data))
  //         .toList();
  //   } else {
  //     print(response.statusCode);
  //     print(url);
  //   }
  // }

  // Future<List<Map<String, RightsAPI>>> fetchData() async {
  //   var url = '${apiurl().url}/rights';
  //   final response = await http.get(Uri.parse(url), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${Token}',
  //   });
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return List<Map<String, RightsAPI>>.from(json.decode(response.body)['membre']);
  //   } else {
  //     print(response.statusCode);
  //     print(url);
  //   }
  // }

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
              // Expanded(
              //     // child: FutureBuilder<RightsAPI>(
              //     //   future: fetchData(),
              //     //   builder: (context, snapshot) {
              //     //     if (snapshot.hasData) {
              //     //       List scheduleDate = snapshot.data;

              //     //       return ListView.builder(
              //     //         itemCount: scheduleDate.length,
              //     //         itemBuilder: (context, i) {
              //     //           print(scheduleDate.length);
              //     //           return Container(
              //     //             child: scheduleDate.length != 0
              //     //                 ? Column(
              //     //                     children: [
              //     //                       Text('${scheduleDate[i].id}'),
              //     //                     ],
              //     //                   )
              //     //                 : Container(),
              //     //           );
              //     //         },
              //     //       );
              //     //     } else if (snapshot.hasError) {
              //     //       return Text("${snapshot.error}");
              //     //     }
              //     //     return Align(
              //     //         alignment: Alignment.center,
              //     //         child: CircularProgressIndicator());
              //     //   },
              //     // ),
              //     ),
            ],
          ),
        ),
      ),
    );
  }
}
