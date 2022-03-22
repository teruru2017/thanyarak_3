//@dart = 2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/login/menumember_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/newpassword_pages.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';
import 'package:thanyarak/widgets/msgBoxsucc_widget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

String cid;

class editpassword_page extends StatefulWidget {
  editpassword_page({Key key}) : super(key: key);

  @override
  _editpassword_pageState createState() => _editpassword_pageState();
}

class _editpassword_pageState extends State<editpassword_page> {
  bool showpasswordole = false,
      showpasswordnew = false,
      showpasswordnewAg = false;
  bool txt = true;
  bool oldpass = false;
  bool newpass = false;
  bool cfpass = false;
  final _formKey = GlobalKey<FormBuilderState>();

  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();

    getCID();
  }

  Future getCID() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
    });
  }

  Future<void> ValidateUser({String cid, passwordOla, passwordNew}) async {
    var url = '${apiurl().urlapi}/user.php';
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          <String, String>{"userId": "${cid}", "password": "${passwordOla}"}),
    );

    if (response.statusCode == 200) {
      UpdateValidateUser(cid: cid, passwordNew: passwordNew);
    } else if (response.statusCode == 401) {
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  MSGBoxWidget(title: 'รหัสผ่านเดิมไม่ถูกต้อง', detail: ''));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    }
    print('adduserPassword Status APi: ' + response.statusCode.toString());
  }

  Future<void> UpdateValidateUser({String cid, passwordNew}) async {
    var url = '${apiurl().urlapi}/user.php';
    final response = await http.patch(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "userId": "${cid}",
        "newPassword": "${passwordNew}"
      }),
    );

    if (response.statusCode == 200) {
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
                    title: 'แก้ไขรหัสผ่านเสร็จเรียบร้อย',
                    detail: '',
                    part: '/menuHome',
                  ));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    }
    print(response.body);
    print('adduserPassword Status APi: ' + response.statusCode.toString());
  }

  TextEditingController oldpassword = TextEditingController();

  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/menuHome',
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          scale: 1,
                                          image:
                                              AssetImage("images/back01.png"),
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
                                            'แก้ไขรหัสผ่าน',
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
                      FormBuilder(
                        key: _formKey,
                        onWillPop: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 110, left: 30, right: 30, bottom: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'รหัสผ่านเดิม',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 14,
                                                      color: Colors.grey[500],
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: FormBuilderTextField(
                                                obscureText:
                                                    showpasswordole == false
                                                        ? true
                                                        : false,
                                                controller: oldpassword,
                                                readOnly: false,
                                                maxLength: 4,
                                                name: 'oldpassword',
                                                keyboardType:
                                                    TextInputType.number,
                                                style: GoogleFonts.kanit(
                                                    fontSize: 14),
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade100,
                                                          width: 0),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade100,
                                                          width: 0),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    //border: InputBorder.none,

                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        const Radius.circular(
                                                            10),
                                                      ),
                                                    ),
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          showpasswordole =
                                                              !showpasswordole;
                                                        });
                                                      },
                                                      child: Icon(
                                                        showpasswordole == false
                                                            ? Icons
                                                                .visibility_off_outlined
                                                            : Icons
                                                                .visibility_outlined,
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                    ),
                                                    fillColor: Colors.grey[50],
                                                    filled: true),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    setState(() {
                                                      oldpass = true;
                                                    });
                                                    return 'กรุณาระบุรหัสผ่านให้ถูกต้อง';
                                                  } else if (value.length !=
                                                      4) {
                                                    setState(() {
                                                      oldpass = true;
                                                    });

                                                    return 'กรุณาระบุรหัสผ่าน 4 หลัก';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'รหัสผ่านใหม่',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 14,
                                                      color: Colors.grey[500],
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: FormBuilderTextField(
                                                obscureText:
                                                    showpasswordnew == false
                                                        ? true
                                                        : false,
                                                controller: password1,
                                                readOnly: false,
                                                name: 'newpassword',
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 4,
                                                style: GoogleFonts.kanit(
                                                    fontSize: 14),
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade100,
                                                          width: 0),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade100,
                                                          width: 0),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    //border: InputBorder.none,

                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        const Radius.circular(
                                                            10),
                                                      ),
                                                    ),
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          showpasswordnew =
                                                              !showpasswordnew;
                                                        });
                                                      },
                                                      child: Icon(
                                                        showpasswordnew == false
                                                            ? Icons
                                                                .visibility_off_outlined
                                                            : Icons
                                                                .visibility_outlined,
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                    ),
                                                    fillColor: Colors.grey[50],
                                                    filled: true),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    setState(() {
                                                      newpass = true;
                                                    });
                                                    return 'กรุณาระบุรหัสผ่านให้ถูกต้อง';
                                                  } else if (value.length !=
                                                      4) {
                                                    setState(() {
                                                      newpass = true;
                                                    });

                                                    return 'กรุณาระบุรหัสผ่าน 4 หลัก';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'ยืนยันรหัสผ่าน',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 14,
                                                      color: Colors.grey[500],
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: FormBuilderTextField(
                                                obscureText:
                                                    showpasswordnewAg == false
                                                        ? true
                                                        : false,
                                                controller: password2,
                                                readOnly: false,
                                                maxLength: 4,
                                                name: 're-newpassword',
                                                keyboardType:
                                                    TextInputType.number,
                                                style: GoogleFonts.kanit(
                                                    fontSize: 14),
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade100,
                                                          width: 0),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade100,
                                                          width: 0),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          showpasswordnewAg =
                                                              !showpasswordnewAg;
                                                        });
                                                      },
                                                      child: Icon(
                                                        showpasswordnewAg ==
                                                                false
                                                            ? Icons
                                                                .visibility_off_outlined
                                                            : Icons
                                                                .visibility_outlined,
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                    ),
                                                    //border: InputBorder.none,

                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        const Radius.circular(
                                                            10),
                                                      ),
                                                    ),
                                                    fillColor: Colors.grey[50],
                                                    filled: true),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    setState(() {
                                                      cfpass = true;
                                                    });
                                                    return 'กรุณาระบุรหัสผ่านให้ถูกต้อง';
                                                  } else if (value.length !=
                                                      4) {
                                                    setState(() {
                                                      cfpass = true;
                                                    });

                                                    return 'กรุณาระบุรหัสผ่าน 4 หลัก';
                                                  } else if (password1.text !=
                                                      password2.text) {
                                                    setState(() {
                                                      cfpass = true;
                                                    });

                                                    return 'กรุณาระบุให้รหัสผ่านให้ตรงกัน';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      // color: Colors.green,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: GestureDetector(
                                                onTap: () {
                                                  _formKey.currentState.save();
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    ValidateUser(
                                                        cid: cid,
                                                        passwordNew:
                                                            password1.text,
                                                        passwordOla:
                                                            oldpassword.text);
                                                  }
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Color(0xffE6EFFE),
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        colors: [
                                                          Color(0xff0088C6),
                                                          Color(0xff43CEF8)
                                                        ]),
                                                  ),
                                                  child: Text(
                                                    "แก้ไขรหัสผ่าน",
                                                    style: GoogleFonts.kanit(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline4,
                                                      fontSize: 16,
                                                      color: Color(0xffFFFFFF),
                                                      // fontStyle: FontStyle.italic,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
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
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigagitonBar(actionGet: 5),
      ),
      onWillPop: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/menuHome', (Route<dynamic> route) => false);
      },
    );
  }
}
