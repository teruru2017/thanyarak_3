//@dart = 2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
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

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

bool cid = false;
bool _ciderr = false;
bool password = false;
bool _passerr = false;
bool showpassword = false;
String Token;
int counttxt = 0;
bool buttomck = false;
SessionManager ssr = SessionManager();
final texts = TextEditingController();
Future<void> setLog(String txt) async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  shared.setString('id', txt);
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController input_cid = TextEditingController();
  TextEditingController input_password = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getToken();
  }

  Future getToken() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
    });
  }

  Future<void> ValidateUser({String cid, pass}) async {
    var url = '${apiurl().urlapi}/user.php';
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          <String, String>{"userId": "${cid}", "password": "${pass}"}),
    );

    if (response.statusCode == 200) {
      print('Status APi: ' + response.statusCode.toString());
      ssr.setCID("${cid}");
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => MainPage()));
    } else if (response.statusCode == 401) {
      print('Status APi: ' + response.statusCode.toString());
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  MSGBoxWidget(
                    title: 'รหัสผ่านไม่ถูกต้อง กรุณากรอกใหม่อีกครัั้ง',
                    detail: '',
                  ));
    } else if (response.statusCode == 422) {
      print('Status APi: ' + response.statusCode.toString());
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  MSGBoxWidget(
                    title: 'กรุณาลงทะเบียนเพื่อเข้าสู่ระบบ',
                    detail: '',
                  ));
    } else if (response.statusCode == 403) {
      print('Status APi: ' + response.statusCode.toString());
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  MSGBoxWidget(
                    title:
                        'กรอกรหัสผ่านผิดเกินจำนวนที่กำหนด กรุณาลืมรหัสผ่านเพื่อตั้งรหัสผ่านใหม่',
                    detail: '',
                  ));
    } else {
      print('Status APi: ' + response.statusCode.toString());
    }
  }

  final double topWidgetHeight = 180.0;
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;
    if (width <= 414) {
      _w = 2;
      _f = 1;
    }
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            image: AssetImage(
                                                "images/iconlogin.png"),
                                            alignment: Alignment.bottomCenter)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              MainPage()));
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      //color: Colors.amber,
                                      image: DecorationImage(
                                          scale: 1.3,
                                          image:
                                              AssetImage("images/back01.png"),
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
                      padding: const EdgeInsets.only(
                          top: 220, left: 15, right: 15, bottom: 20),
                      child: Column(children: [
                        Align(
                          alignment: Alignment(-1, -1),
                          child: Text(
                            "เข้าสู่ระบบ",
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
                            "กรุณากรอกรหัสผ่าน เพื่อเข้าสู่ระบบ",
                            style: GoogleFonts.kanit(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 16,
                              color: Color(0xffB7B7B7),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        FormBuilder(
                          key: _formKey,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Focus(
                                  onFocusChange: (hasFocus) {
                                    setState(() {
                                      cid = hasFocus;
                                      _ciderr = false;
                                    });
                                  },
                                  child: FormBuilderTextField(
                                    controller: input_cid,
                                    name: 'cid',
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                    ),
                                    decoration: InputDecoration(
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'images/prefix.png',
                                            alignment: Alignment.center,
                                            scale: 1.5,
                                            color: _ciderr == true
                                                ? Colors.red
                                                : cid == true
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                          ),
                                        ),
                                        hintText: 'เลขประจำตัวบัตรประชาชน',
                                        hintStyle: TextStyle(
                                          color: _ciderr == true
                                              ? Colors.red
                                              : cid == true
                                                  ? Colors.blue
                                                  : Colors.grey.shade300,
                                        ),
                                        fillColor: _ciderr == true
                                            ? Colors.red[50]
                                            : cid == true
                                                ? Colors.blue[50]
                                                : Colors.white,
                                        filled: true),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setState(() {
                                          _ciderr = true;
                                        });
                                        return 'กรุณาระบุเลขประจำตัวบัตรประชาชนให้ถูกต้อง';
                                      } else if (value.length < 13) {
                                        setState(() {
                                          _ciderr = true;
                                        });
                                        return 'กรุณาระบุเลขประจำตัวบัตรประชาชนให้ถูกต้อง';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                Focus(
                                  onFocusChange: (hasFocus) {
                                    setState(() {
                                      password = hasFocus;
                                      _passerr = false;
                                    });
                                  },
                                  child: FormBuilderTextField(
                                    onChanged: (value) {
                                      if (value.length == 4) {
                                        buttomck = true;
                                      } else {
                                        buttomck = false;
                                      }
                                    },
                                    controller: input_password,
                                    name: 'password',
                                    maxLength: 4,
                                    obscureText:
                                        showpassword == true ? false : true,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                    ),
                                    decoration: InputDecoration(
                                        counterText: '',
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock_outline_rounded,
                                          color: _passerr == true
                                              ? Colors.red
                                              : password == true
                                                  ? Colors.blue
                                                  : Colors.grey.shade300,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showpassword = !showpassword;
                                            });
                                          },
                                          child: Icon(
                                            showpassword == false
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            color: _passerr == true
                                                ? Colors.red
                                                : password == true
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                          ),
                                        ),
                                        hintText: 'รหัสผ่าน',
                                        hintStyle: TextStyle(
                                          color: _passerr == true
                                              ? Colors.red
                                              : password == true
                                                  ? Colors.blue
                                                  : Colors.grey.shade300,
                                        ),
                                        fillColor: _passerr == true
                                            ? Colors.red[50]
                                            : password == true
                                                ? Colors.blue[50]
                                                : Colors.white,
                                        filled: true),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setState(() {
                                          _passerr = true;
                                        });
                                        return 'กรุณาระบุรหัสผ่าน 4 หลัก';
                                      } else if (value.length < 4) {
                                        setState(() {
                                          _passerr = true;
                                        });

                                        return 'กรุณาระบุรหัสผ่านให้ครบ 4 หลัก';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            clstxt();
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        forgetpassword_pages()));
                          },
                          child: Align(
                            alignment: Alignment(1, 0),
                            child: Text(
                              "ลืมรหัสผ่าน?",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 16,

                                color: Colors.black,
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              // print(_formKey.currentState.value);
                              setState(() {
                                ValidateUser(
                                    cid: input_cid.text,
                                    pass: input_password.text);
                              });
                            } else {
                              print("validation failed");
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xffE6EFFE),
                              gradient: buttomck == true
                                  ? LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                          Color(0xff0088C6),
                                          Color(0xff43CEF8)
                                        ])
                                  : LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                          Color(0xffE6EFFE),
                                          Color(0xffE6EFFE),
                                        ]),
                            ),
                            child: Text(
                              "เข้าสู่ระบบ",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 16,
                                color: buttomck == true
                                    ? Colors.white
                                    : Color(0xffB7B7B7),

                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "ไม่มีบัญชี คลิกที่นี้เพื่อ",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffB7B7B7),
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                clstxt();
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => newtype_pages()));
                              },
                              child: Text(
                                "ลงทะเบียน",
                                style: GoogleFonts.kanit(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff0088C6),
                                  // fontStyle: FontStyle.italic,
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
          ),
        ]),
      ),
      onWillPop: () {
        clstxt();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => MainPage()));
      },
    );
  }

  Widget clstxt() {
    input_cid.clear();
    input_password.clear();
  }
}
