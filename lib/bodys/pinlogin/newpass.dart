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
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/pin.dart';
import 'package:thanyarak/bodys/success_pages.dart';
import 'package:thanyarak/models/session.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:thanyarak/widgets/msgBoxsucc_widget.dart';

class OTPpassword_pages extends StatefulWidget {
  OTPpassword_pages({Key key}) : super(key: key);

  @override
  _password_pagesState createState() => _password_pagesState();
}

bool password = false;
bool cfpassword = false;
bool showpassword = false;
bool showcfpassword = false;
bool _password = false;
bool _cfpassword = false;

TextEditingController password1 = TextEditingController();
TextEditingController password2 = TextEditingController();
SessionManager ssr = SessionManager();
String cid, phone;

class _password_pagesState extends State<OTPpassword_pages> {
  SessionManager ssr = SessionManager();
  GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    setState(() {
      password1.clear();
      password2.clear();
      _password = false;
      _cfpassword = false;
    });
    getlogin();
  }

  Future getlogin() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      phone = per.getString('PHONE_LOGIN');
    });
  }

  Future<void> UpdateuserPassword({String txtpid, txtpass}) async {
    var url = '${apiurl().urlapi}/user.php';
    final response = await http.patch(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          <String, String>{"userId": "${txtpid}", "newPassword": "${txtpass}"}),
    );

    if (response.statusCode == 200) {
      setState(() {
        ssr.setCID("${txtpid}");
      });
      Future.delayed(Duration(seconds: 1), () {
        showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder:
                (BuildContext context, Animation frist, Animation second) =>
                    MSGBoxsuccWidget(
                      title: '?????????????????????????????????????????????????????????????????????????????????',
                      detail: '',
                      part: '/pin',
                    ));
      });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    }
    print('UpdateuserPassword Status APi: ' + response.statusCode.toString());
  }

  int _selectedchoice = 0;
  int choice = 0;
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Stack(
                    children: [
                      //????????????????????????
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
                                                  "images/userdata.png"),
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
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PinPage()));
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

                      //?????????????????????????????????????????????
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
                      //?????????????????????
                      FormBuilder(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 220, left: 15, right: 15, bottom: 20),
                          child: Column(children: [
                            Align(
                              alignment: Alignment(-1, -1),
                              child: Text(
                                "???????????????????????????",
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
                            Align(
                              alignment: Alignment(-1, -1),
                              child: Text(
                                "?????????????????????????????????????????????????????????????????????",
                                style: GoogleFonts.kanit(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 16,
                                  color: Color(0xffB7B7B7),
                                  // fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              //color: Colors.amber,
                              //margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Focus(
                                    onFocusChange: (hasfocus) {
                                      setState(() {
                                        password = hasfocus;
                                        _password = false;
                                      });
                                    },
                                    child: FormBuilderTextField(
                                      name: 'password',
                                      controller: password1,
                                      obscureText:
                                          showpassword == true ? false : true,
                                      maxLength: 4,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.kanit(fontSize: 14),
                                      decoration: InputDecoration(
                                          counterText: '',
                                          focusedErrorBorder:
                                              OutlineInputBorder(
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
                                            color: _password == true
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
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                              color: _password == true
                                                  ? Colors.red
                                                  : password == true
                                                      ? Colors.blue
                                                      : Colors.grey.shade300,
                                            ),
                                          ),
                                          hintText: '????????????????????????',
                                          hintStyle: TextStyle(
                                            color: _password == true
                                                ? Colors.red
                                                : password == true
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                          ),
                                          fillColor: _password == true
                                              ? Colors.red[50]
                                              : password == true
                                                  ? Colors.blue[50]
                                                  : Colors.white,
                                          filled: true),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          setState(() {
                                            _password = true;
                                          });
                                          return '??????????????????????????????????????????????????? 4 ????????????';
                                        } else if (value.length != 4) {
                                          setState(() {
                                            _password = true;
                                          });
                                          return '???????????????????????????????????????????????????????????? 4 ????????????';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Focus(
                                    onFocusChange: (hasfocus) {
                                      setState(() {
                                        cfpassword = hasfocus;
                                        _cfpassword = false;
                                      });
                                    },
                                    child: FormBuilderTextField(
                                      name: 'confirmpassword',
                                      controller: password2,
                                      obscureText:
                                          showcfpassword == true ? false : true,
                                      maxLength: 4,
                                      keyboardType: TextInputType.number,
                                      style: GoogleFonts.kanit(fontSize: 14),
                                      decoration: InputDecoration(
                                          counterText: '',
                                          focusedErrorBorder:
                                              OutlineInputBorder(
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
                                            color: _cfpassword == true
                                                ? Colors.red
                                                : cfpassword == true
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                          ),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                showcfpassword =
                                                    !showcfpassword;
                                              });
                                            },
                                            child: Icon(
                                              showcfpassword == false
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                              color: _cfpassword == true
                                                  ? Colors.red
                                                  : cfpassword == true
                                                      ? Colors.blue
                                                      : Colors.grey.shade300,
                                            ),
                                          ),
                                          hintText: '????????????????????????',
                                          hintStyle: TextStyle(
                                            color: _cfpassword == true
                                                ? Colors.red
                                                : cfpassword == true
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                          ),
                                          fillColor: _cfpassword == true
                                              ? Colors.red[50]
                                              : cfpassword == true
                                                  ? Colors.blue[50]
                                                  : Colors.white,
                                          filled: true),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          setState(() {
                                            _cfpassword = true;
                                          });
                                          return '??????????????????????????????????????????????????? 4 ????????????';
                                        } else if (value.length != 4) {
                                          setState(() {
                                            _cfpassword = true;
                                          });

                                          return '???????????????????????????????????????????????????????????? 4 ????????????';
                                        } else if (password1.text !=
                                            password2.text) {
                                          setState(() {
                                            _cfpassword = true;
                                          });

                                          return '???????????????????????????????????????????????????????????????????????????????????????';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                _formKey.currentState.save();
                                if (_formKey.currentState.validate()) {
                                  print(_formKey.currentState.value);
                                  setState(() {
                                    UpdateuserPassword(
                                        txtpass: password1.text, txtpid: cid);
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
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
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff0088C6),
                                        Color(0xff43CEF8)
                                      ]),
                                ),
                                child: Text(
                                  "??????????????????",
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
                          ]),
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
      onWillPop: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => PinPage()));
      },
    );
  }
}

mixin Token {}
