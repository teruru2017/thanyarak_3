// ignore_for_file: prefer_const_constructors
//@dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/loading_api.dart';

import 'package:thanyarak/bodys/main_page.dart';

import 'package:thanyarak/bodys/pin.dart';

import 'package:thanyarak/models/session.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class loadingPage extends StatefulWidget {
  loadingPage({Key key}) : super(key: key);

  @override
  _loadingPageState createState() => _loadingPageState();
}

SessionManager ssr = SessionManager();
String cid;
String pass;

class _loadingPageState extends State<loadingPage> {
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getcid();
    loading();
  }

  Future getcid() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      pass = per.getString('password');
    });
  }

  Future<List<loadingapi>> loadingData;

  Future<loadingapi> loading() async {
    final response = await http.post(
      Uri.parse('http://118.174.183.82:52354/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': 'test',
        'password': 'test123',
        'name': 'test'
      }),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> dashboarddata =
          convert.jsonDecode(response.body);
      setState(() {
        ssr.setToken(dashboarddata['access_token']);
        if (cid != '' && cid != null) {
          Future.delayed(Duration(seconds: 3), () {
            //วิ่งหน้าpin
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => PinPage()));
          });
        } else {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => MainPage()));
        }
        print(cid);
      });

      print(dashboarddata['access_token']);

      // print(response.body);

      return loadingapi.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      //dialog แจ้งเตือน
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(
                  'เกิดข้อผิดพลาด',
                  style: GoogleFonts.kanit(),
                ),
                content: Text(
                  'ไม่สามารถเชื่อมต่อได้ในขณะนี้ กรุณาลองใหม่อีกครั้ง',
                  style: GoogleFonts.kanit(),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: Text('ตกลง', style: GoogleFonts.kanit()),
                  ),
                ]);
          });
    } else {
      //dialog แจ้งเตือน
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(
                  'เกิดข้อผิดพลาด',
                  style: GoogleFonts.kanit(),
                ),
                content: Text(
                  'ไม่สามารถเชื่อมต่อได้ในขณะนี้ กรุณาลองใหม่อีกครั้ง',
                  style: GoogleFonts.kanit(),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: Text('ตกลง', style: GoogleFonts.kanit()),
                  ),
                ]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/loading.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
