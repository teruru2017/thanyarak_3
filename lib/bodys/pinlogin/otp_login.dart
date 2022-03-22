//@dart=2.9
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
import 'package:thanyarak/bodys/API/api_otp.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/forgetpassword_pages.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/newpassword_pages.dart';
import 'package:thanyarak/bodys/pinlogin/newpass.dart';
import 'package:thanyarak/bodys/registerdata_pages.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:thanyarak/widgets/msgBox_widget.dart';

String cid, token, phone, OTPRef = '', numOTP;

class OtpLoging_pages extends StatefulWidget {
  OtpLoging_pages({Key key}) : super(key: key);

  @override
  OtpLoging_pagesState createState() => OtpLoging_pagesState();
}

class OtpLoging_pagesState extends State<OtpLoging_pages> {
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getDATA();
  }

  Future<FindByCitizenId> futureFindByCitizenId;
  Future<OtpGet> futureOtpGet;
  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      token = per.getString('tokens');
      print('cid : ${cid}');
      print('token : ${token}');
      futureFindByCitizenId = getcid(txtcid: cid, txttoken: token);
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
      var jsonResponse = json.decode(response.body);

      // print(jsonResponse);
      getOTP(txtphone: jsonResponse['mobile']);
      phone = jsonResponse['mobile'];

      return FindByCitizenId.fromJson(jsonDecode(response.body));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
      print('Status Getcid : ${response.statusCode}');
    }
  }

  Future<OtpGet> getOTP({String txtphone}) async {
    var url = '${apiurl().urlapi}/otp.php?phoneNumber=${txtphone}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      jsonRes = convert.jsonDecode(response.body);
      print(response.body);

      setState(() {
        OTPRef = jsonRes['OTPRef'];
      });

      return OtpGet.fromJson(jsonDecode(response.body));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
      print('Status getOTP : ${response.statusCode}');
    }
  }

  Future<void> putOTP({String txtphone, txtOTP, txtRef}) async {
    var url = '${apiurl().urlapi}/otp.php';
    final response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          "phoneNumber": "${txtphone}",
          "OTPReference": "${txtRef}",
          "OTP": "${txtOTP}"
        }));
    if (response.statusCode == 200) {
      print('Status getOTP : ${response.statusCode}');
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => OTPpassword_pages()));
    } else if (response.statusCode == 401) {
      print('Status getOTP : ${response.statusCode}');
      _Dialog('กรอกรหัส OTP ผิด กรุณากรอกใหม่อีกครั้ง');
      otpPIN1.clear();
      otpPIN2.clear();
      otpPIN3.clear();
      otpPIN4.clear();
    } else if (response.statusCode == 403) {
      print('Status getOTP : ${response.statusCode}');
      _Dialog('กรอกรหัสผ่านผิดเกินจำนวนกรุณาขอ OTP ใหม่อีกครั้ง');
      otpPIN1.clear();
      otpPIN2.clear();
      otpPIN3.clear();
      otpPIN4.clear();
    } else if (response.statusCode == 410) {
      print('Status getOTP : ${response.statusCode}');
      _Dialog('กรุณาขอ OTP ใหม่อีกครั้ง');
      otpPIN1.clear();
      otpPIN2.clear();
      otpPIN3.clear();
      otpPIN4.clear();
    } else {
      print('Status getOTP : ${response.statusCode} ${txtphone}');
      print('Status getOTP : ${response.body}');
    }
  }

  final double topWidgetHeight = 180.0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;
    if (width <= 414) {
      _w = 2;
      _f = 1;
    }
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                  "images/userlock.png"),
                                              alignment: Alignment.topCenter)),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();

                                    Future.delayed(Duration(seconds: 1), () {
                                      Navigator.pop(context);
                                    });
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
                              "ยืนยัน OTP",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff0088C6),
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          FutureBuilder<FindByCitizenId>(
                            future: futureFindByCitizenId,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Align(
                                  alignment: Alignment(-1, -1),
                                  child: Text(
                                    "รหัส OTP ส่งไปที่เบอร์โทรศัพท์ ${snapshot.data.mobile}",
                                    style: GoogleFonts.kanit(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 16,
                                      color: Color(0xffB7B7B7),
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              return CircularProgressIndicator();
                            },
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment(0, 0),
                            child: Text(
                              "เลขอ้างอิง OTP #${OTPRef} ภายในเวลา 5 นาที",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 14,
                                color: Colors.black,
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _textFieldOTP(
                                      first: true, last: false, txt: otpPIN1),
                                  _textFieldOTP(
                                      first: false, last: false, txt: otpPIN2),
                                  _textFieldOTP(
                                      first: false, last: false, txt: otpPIN3),
                                  _textFieldOTP(
                                      first: false, last: true, txt: otpPIN4),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    futureFindByCitizenId =
                                        getcid(txtcid: cid, txttoken: token);
                                  });
                                },
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: Text(
                                    "ขอรหัส OTP ใหม่",
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
                              ),
                              Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  "หากไม่ได้รับ OTP กรุณาติดต่อ โทร. 02-4115657-9",
                                  style: GoogleFonts.kanit(
                                    textStyle:
                                        Theme.of(context).textTheme.headline4,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  "หรือ Line@ : @thanyarak หรือ Webpage",
                                  style: GoogleFonts.kanit(
                                    textStyle:
                                        Theme.of(context).textTheme.headline4,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  numOTP = otpPIN1.text +
                                      otpPIN2.text +
                                      otpPIN3.text +
                                      otpPIN4.text;

                                  if (numOTP.length == 4) {
                                    setState(() {
                                      putOTP(
                                          txtOTP: numOTP,
                                          txtRef: OTPRef,
                                          txtphone: phone);
                                    });
                                  } else {
                                    _Dialog('กรุณาใส่รหัส OTP ให้ครบ 4 หลัก');
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
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xff0088C6),
                                          Color(0xff43CEF8)
                                        ]),
                                  ),
                                  child: Text(
                                    "ถัดไป",
                                    style: GoogleFonts.kanit(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF),
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                            ]),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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

  TextEditingController otpPIN1 = TextEditingController();
  TextEditingController otpPIN2 = TextEditingController();
  TextEditingController otpPIN3 = TextEditingController();
  TextEditingController otpPIN4 = TextEditingController();
  Widget _textFieldOTP({first, last, txt}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.75,
        child: TextField(
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          controller: txt,
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xFF0088C6)),
                borderRadius: BorderRadius.circular(12)),
            fillColor: Colors.grey[50],
            filled: true,
            hoverColor: Colors.lightBlue[50],
          ),
        ),
      ),
    );
  }
}
