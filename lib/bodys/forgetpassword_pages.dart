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
import 'package:thanyarak/bodys/API/api_findByCitizenId.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/login/editprofile_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';

class forgetpassword_pages extends StatefulWidget {
  forgetpassword_pages({Key key}) : super(key: key);

  @override
  _forgetpassword_pagesState createState() => _forgetpassword_pagesState();
}

String cid, token, phone, OTPRef = '', numOTP, pid;
bool tel = false;
bool mobileerr = false;

class _forgetpassword_pagesState extends State<forgetpassword_pages> {
  TextEditingController input_cidForget = TextEditingController();
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getDATA();
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      token = per.getString('tokens');
      print('token : ${token}');
    });
  }

  Future<FindByCitizenId> getcid({String txtcid, txttoken}) async {
    var url = '${apiurl().url}/patient/findByCitizenId/${txtcid}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
    });
    if (response.statusCode == 200) {
      print('Status Getcid : ${response.statusCode}');

      jsonRes = convert.jsonDecode(response.body);

      getUserID(userId: txtcid, tel: jsonRes['mobile']);
      pid = jsonRes['pid'];

      // return FindByCitizenId.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      print('Status Getcid : ${response.statusCode}');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    } else if (response.statusCode == 404) {
      print('Status Getcid : ${response.statusCode}');
      _Dialog('ข้อมูลไม่ถูกต้อง');
    } else {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => loadingPage()));
      print('Status Getcid : ${response.statusCode}');
    }
  }

  Future<void> getUserID({String userId, tel}) async {
    SessionManager ssr = SessionManager();
    var url = '${apiurl().urlapi}/user.php?userId=${userId}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        ssr.setCIDOTP('${userId}');
        ssr.setPhoneOTP('${tel}');
      });

      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => otp_pages()));
    } else {
      _Dialog('ข้อมูลไม่ถูกต้อง');
    }
  }

  int _selectedchoice = 0;
  int choice = 0;
  final _formKey = GlobalKey<FormBuilderState>();

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
            child: Container(
              child: Stack(
                children: [
                  //พื้นหลัง
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          image:
                                              AssetImage("images/userlock.png"),
                                          alignment: Alignment.topCenter)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    //color: Colors.amber,
                                    image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
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
                      height: MediaQuery.of(context).size.height / 2,
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
                          "ลืมรหัสผ่าน",
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
                          "กรุณากรอกเบอร์โทรศัพท์ เพื่อขอรหัสผ่านใหม่",
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
                                  tel = hasFocus;
                                  mobileerr = false;
                                },
                                child: FormBuilderTextField(
                                  name: 'cid',
                                  controller: input_cidForget,
                                  maxLength: 13,
                                  style: GoogleFonts.kanit(fontSize: 14),
                                  keyboardType: TextInputType.phone,
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
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'images/barcode.png',
                                          alignment: Alignment.center,
                                          scale: 1.5,
                                          color: mobileerr == true
                                              ? Colors.red
                                              : tel == true
                                                  ? Colors.blue
                                                  : Colors.grey.shade300,
                                        ),
                                      ),
                                      hintText: 'เลขบัตรประชาชน',
                                      hintStyle: TextStyle(
                                        color: mobileerr == true
                                            ? Colors.red
                                            : tel == true
                                                ? Colors.blue
                                                : Colors.grey.shade300,
                                      ),
                                      fillColor: mobileerr == true
                                          ? Colors.red[50]
                                          : tel == true
                                              ? Colors.blue[50]
                                              : Colors.white,
                                      filled: true),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        mobileerr = true;
                                      });
                                      return 'กรุณาระบุเลขบัตรประชาชนให้ถูกต้อง';
                                    } else if (value.length < 13) {
                                      setState(() {
                                        mobileerr = true;
                                      });

                                      return 'กรุณาระบุจำนวนให้ถูกต้อง';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            getcid(
                                txtcid: input_cidForget.text, txttoken: token);
                            // print(input_cidForget.text);
                            // Navigator.push(
                            //     context,
                            //     CupertinoPageRoute(
                            //         builder: (context) => otp_pages()));
                          } else {
                            print("validation failed");
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
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Dialog(txt) {
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
                  title: txt,
                  detail: '',
                ));
  }
}
