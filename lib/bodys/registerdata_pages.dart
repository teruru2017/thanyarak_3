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
import 'package:thanyarak/bodys/API/gettoken.dart';
import 'package:thanyarak/bodys/login/setting_page.dart';
import 'package:thanyarak/bodys/newtype_pages.dart';
import 'package:thanyarak/bodys/passwordNewUser_page.dart';
import 'package:thanyarak/bodys/password_pages.dart';
import 'package:thanyarak/bodys/register1_pages.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';

class registerdata_pages extends StatefulWidget {
  String checktype;
  int checkstatus;
  registerdata_pages({Key key, this.checktype, this.checkstatus})
      : super(key: key);

  @override
  _registerdata_pagesState createState() => _registerdata_pagesState();
}

var focusNode = FocusNode();
var textField = TextField(focusNode: focusNode);

bool id = false;
bool _id = false;
bool prefix = false;
bool _prefixerr = false;
bool name = false;
bool _nameerr = false;
bool hbd = false;
bool _hbderr = false;
bool tel = false;
bool _tel = false;
bool address = false;
bool _addresserr = false;
bool email = false;
bool _emailerr = false;
bool sub_district = false;
bool _suberr = false;
bool district = false;
bool _districterr = false;
bool province = false;
bool _provinceerr = false;
bool zip = false;
bool _ziperr = false;
bool surname = false;
bool _surerr = false;

String pid;
String cid_login;

String birthDateInString;
DateTime birthDate;

bool a = false;
bool b = false;
String Token = '';
var jsonRes;
String apiStatus, hn, cid, cklogin;
TextEditingController input_id = TextEditingController();
TextEditingController input_prefix = TextEditingController();
TextEditingController input_name = TextEditingController();
TextEditingController input_hbd = TextEditingController();
TextEditingController input_age = TextEditingController();
TextEditingController input_tel = TextEditingController();
TextEditingController input_address = TextEditingController();
TextEditingController input_sub_district = TextEditingController();
TextEditingController input_province = TextEditingController();
TextEditingController input_zip = TextEditingController();
TextEditingController input_email = TextEditingController();
TextEditingController input_surname = TextEditingController();
TextEditingController input_district = TextEditingController();
TextEditingController input_congenital = TextEditingController();
TextEditingController input_allergic = TextEditingController();
var now = DateTime.now();
var format = new DateFormat('yyyy');

class _registerdata_pagesState extends State<registerdata_pages> {
  int _selectedchoice = 0;
  int choice = 0;
  final double topWidgetHeight = 180.0;
  final _formKey = GlobalKey<FormBuilderState>();

  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    if (widget.checkstatus == 1) {}
    getToken();
  }

  Future<void> getcid(var data) async {
    var url = '${apiurl().url}/patient/findByCitizenId/${data['id']}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      print("Status checkCID: ${response.statusCode}");
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
                    title: 'ท่านได้เคยลงทะเบียนไว้กับทางเราแล้ว',
                    detail: '',
                  ));
    } else if (response.statusCode == 404) {
      print("Status checkCID: ${response.statusCode}");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => passwordNewUser_pages(
                    dateSet: data,
                  )));
    } else {
      print("Status checkCID: ${response.statusCode}");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => newtype_pages()));
    }
  }

  Future getToken() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
    });
  }

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
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                newtype_pages()));
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
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FormBuilder(
                              key: _formKey,
                              child: Container(
                                child: Column(children: [
                                  Align(
                                    alignment: Alignment(-1, -1),
                                    child: Text(
                                      "ลงทะเบียน",
                                      style: GoogleFonts.kanit(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
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
                                      "กรุณากรอกข้อมูลของคุณ เพื่อลงทะเบียน",
                                      style: GoogleFonts.kanit(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              id = hasfocus;
                                              _id = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'id',
                                            focusNode: focusNode,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            controller: input_id,
                                            keyboardType: TextInputType.number,
                                            maxLength: 13,
                                            decoration: InputDecoration(
                                                counterText: '',
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/barcode.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _id == true
                                                        ? Colors.red
                                                        : id == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText:
                                                    'เลขประจำตัวบัตรประชาชน',
                                                hintStyle: TextStyle(
                                                  color: _id == true
                                                      ? Colors.red
                                                      : id == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _id == true
                                                    ? Colors.red[50]
                                                    : id == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _id = true;
                                                });
                                                return 'กรุณาระบุเลขประจำตัวบัตรประชาชน';
                                              } else if (value.length != 13) {
                                                setState(() {
                                                  _id = true;
                                                });

                                                return 'กรุณาระบุเลขประจำตัวบัตรประชาชนให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              prefix = hasfocus;
                                              _prefixerr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'prefixname',
                                            controller: input_prefix,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/prefix.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _prefixerr == true
                                                        ? Colors.red
                                                        : prefix == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                    // ? Colors.red
                                                    // : _prefixerr == false ||
                                                    //         prefix
                                                    //     ? Colors.blue
                                                    //     : Colors
                                                    //         .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'คำนำหน้าชื่อ',
                                                hintStyle: TextStyle(
                                                  color: _prefixerr == true
                                                      ? Colors.red
                                                      : prefix == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _prefixerr == true
                                                    ? Colors.red[50]
                                                    : prefix == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _prefixerr = true;
                                                  print(_prefixerr);
                                                });
                                                return 'กรุณาระบุคำนำหน้าชื่อ';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              name = hasfocus;
                                              _nameerr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'name',
                                            controller: input_name,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/people.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _nameerr == true
                                                        ? Colors.red
                                                        : name == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'ชื่อ',
                                                hintStyle: TextStyle(
                                                  color: _nameerr == true
                                                      ? Colors.red
                                                      : name == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _nameerr == true
                                                    ? Colors.red[50]
                                                    : name == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _nameerr = true;
                                                });
                                                return 'กรุณาระบุชื่อ';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              surname = hasfocus;
                                              _surerr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'surname',
                                            controller: input_surname,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/people.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _surerr == true
                                                        ? Colors.red
                                                        : surname == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'นามสกุล',
                                                hintStyle: TextStyle(
                                                  color: _surerr == true
                                                      ? Colors.red
                                                      : surname == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _surerr == true
                                                    ? Colors.red[50]
                                                    : surname == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _surerr = true;
                                                });
                                                return 'กรุณาระบุนามสกุล';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  child: Focus(
                                                    onFocusChange: (hasfocus) {
                                                      setState(() {
                                                        hbd = hasfocus;
                                                        _hbderr = false;
                                                      });
                                                    },
                                                    child: FormBuilderTextField(
                                                      name: 'birthday',
                                                      controller: input_hbd,
                                                      readOnly: true,
                                                      style: GoogleFonts.kanit(
                                                          fontSize: 14),
                                                      decoration:
                                                          InputDecoration(
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 1),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15)),
                                                              ),
                                                              errorStyle:
                                                                  TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 14,
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            Colors
                                                                                .red,
                                                                        width:
                                                                            1),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15)),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 1),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15)),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    width: 1),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15)),
                                                              ),
                                                              prefixIcon:
                                                                  Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                child:
                                                                    Image.asset(
                                                                  'images/hbd.png',
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  scale: 1.5,
                                                                  color: _hbderr ==
                                                                          true
                                                                      ? Colors
                                                                          .red
                                                                      : hbd ==
                                                                              true
                                                                          ? Colors
                                                                              .blue
                                                                          : Colors
                                                                              .grey
                                                                              .shade300,
                                                                ),
                                                              ),
                                                              suffixIcon:
                                                                  GestureDetector(
                                                                      child:
                                                                          new Icon(
                                                                        Icons
                                                                            .edit_outlined,
                                                                        size:
                                                                            20,
                                                                        color: hbd
                                                                            ? Colors.blue
                                                                            : Colors.grey.shade300,
                                                                      ),
                                                                      onTap:
                                                                          () async {
                                                                        final datePick = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                new DateTime.now(),
                                                                            firstDate: new DateTime(1900),
                                                                            lastDate: new DateTime(2100));
                                                                        if (datePick !=
                                                                                null &&
                                                                            datePick !=
                                                                                birthDate) {
                                                                          setState(
                                                                              () {
                                                                            birthDate =
                                                                                datePick;

                                                                            input_hbd.text =
                                                                                "${birthDate.day}-${birthDate.month}-${birthDate.year}";

                                                                            var age =
                                                                                int.parse(format.format(now)) - birthDate.year;
                                                                            input_age.text =
                                                                                age.toString();
                                                                          });
                                                                        }
                                                                      }),
                                                              hintText:
                                                                  'วัน/เดือน/ปีเกิด',
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: _hbderr ==
                                                                        true
                                                                    ? Colors.red
                                                                    : hbd ==
                                                                            true
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .grey
                                                                            .shade300,
                                                              ),
                                                              fillColor: _hbderr ==
                                                                      true
                                                                  ? Colors
                                                                      .red[50]
                                                                  : hbd == true
                                                                      ? Colors.blue[
                                                                          50]
                                                                      : Colors
                                                                          .white,
                                                              filled: true),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          setState(() {
                                                            _hbderr = true;
                                                          });
                                                          return 'กรุณาระบุวันเดือนปีเกิด';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: FormBuilderTextField(
                                                    name: 'age',
                                                    controller: input_age,
                                                    style: GoogleFonts.kanit(
                                                        fontSize: 14),
                                                    readOnly: true,
                                                    decoration: InputDecoration(
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300,
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300,
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                        hintText: 'อายุ',
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey),
                                                        fillColor: Colors
                                                            .grey.shade200,
                                                        filled: true),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              tel = hasfocus;
                                              _tel = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'tel',
                                            controller: input_tel,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/phone.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _tel == true
                                                        ? Colors.red
                                                        : tel == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'เบอร์โทรศัพท์',
                                                hintStyle: TextStyle(
                                                  color: _tel == true
                                                      ? Colors.red
                                                      : tel == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _tel == true
                                                    ? Colors.red[50]
                                                    : tel == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _tel = true;
                                                });

                                                return 'กรุณาระบุเบอร์โทรศัพท์';
                                              } else if (value.length != 10) {
                                                setState(() {
                                                  _tel = true;
                                                });

                                                return 'กรุณาระบุเบอร์โทรศัพท์ให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              address = hasfocus;
                                              _addresserr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'address',
                                            controller: input_address,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/home.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _addresserr == true
                                                        ? Colors.red
                                                        : address == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'ที่อยู่',
                                                hintStyle: TextStyle(
                                                  color: _addresserr == true
                                                      ? Colors.red
                                                      : address == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _addresserr == true
                                                    ? Colors.red[50]
                                                    : address == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _addresserr = true;
                                                });
                                                return 'กรุณาระบุที่อยู่';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              sub_district = hasfocus;
                                              _suberr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'sub_district',
                                            controller: input_sub_district,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/home.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _suberr == true
                                                        ? Colors.red
                                                        : sub_district == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'ตำบล',
                                                hintStyle: TextStyle(
                                                  color: _suberr == true
                                                      ? Colors.red
                                                      : sub_district == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _suberr == true
                                                    ? Colors.red[50]
                                                    : sub_district == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _suberr = true;
                                                });
                                                return 'กรุณาระบุตำบล';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              district = hasfocus;
                                              _districterr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'district',
                                            controller: input_district,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/home.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _districterr == true
                                                        ? Colors.red
                                                        : district == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'อำเภอ',
                                                hintStyle: TextStyle(
                                                  color: _districterr == true
                                                      ? Colors.red
                                                      : district == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _districterr == true
                                                    ? Colors.red[50]
                                                    : district == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _districterr = true;
                                                });
                                                return 'กรุณาระบุอำเภอ';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              province = hasfocus;
                                              _provinceerr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'province',
                                            controller: input_province,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/home.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _provinceerr == true
                                                        ? Colors.red
                                                        : province == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'จังหวัด',
                                                hintStyle: TextStyle(
                                                  color: _provinceerr == true
                                                      ? Colors.red
                                                      : province == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _provinceerr == true
                                                    ? Colors.red[50]
                                                    : province == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _provinceerr = true;
                                                });
                                                return 'กรุณาระบุจังหวัด';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              zip = hasfocus;
                                              _ziperr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'zip',
                                            controller: input_zip,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/home.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _ziperr == true
                                                        ? Colors.red
                                                        : zip == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'รหัสไปรษณีย์',
                                                hintStyle: TextStyle(
                                                  color: _ziperr == true
                                                      ? Colors.red
                                                      : zip == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _ziperr == true
                                                    ? Colors.red[50]
                                                    : zip == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _ziperr = true;
                                                });
                                                return 'กรุณาระบุรหัสไปรษณีย์';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              email = hasfocus;
                                              _emailerr = false;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'email',
                                            controller: input_email,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                errorStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/email.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: _emailerr == true
                                                        ? Colors.red
                                                        : email == true
                                                            ? Colors.blue
                                                            : Colors
                                                                .grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'อีเมลล์',
                                                hintStyle: TextStyle(
                                                  color: _emailerr == true
                                                      ? Colors.red
                                                      : email == true
                                                          ? Colors.blue
                                                          : Colors
                                                              .grey.shade300,
                                                ),
                                                fillColor: _emailerr == true
                                                    ? Colors.red[50]
                                                    : email == true
                                                        ? Colors.blue[50]
                                                        : Colors.white,
                                                filled: true),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  _emailerr = true;
                                                });
                                                return 'กรุณาระบุอีเมล์';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              a = hasfocus;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'congenital',
                                            controller: input_congenital,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/อาการแพ้.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: a
                                                        ? Colors.blue
                                                        : Colors.grey.shade300,
                                                  ),
                                                ),
                                                hintText:
                                                    'โรคประจำตัว โปรดระบุ',
                                                hintStyle: TextStyle(
                                                    color: a
                                                        ? Colors.blue
                                                        : Colors.grey.shade300),
                                                fillColor: a
                                                    ? Colors.blue[50]
                                                    : Colors.white,
                                                filled: true),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Focus(
                                          onFocusChange: (hasfocus) {
                                            setState(() {
                                              b = hasfocus;
                                            });
                                          },
                                          child: FormBuilderTextField(
                                            name: 'allergy',
                                            controller: input_allergic,
                                            style:
                                                GoogleFonts.kanit(fontSize: 14),
                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Image.asset(
                                                    'images/โรคประจำตัว.png',
                                                    alignment: Alignment.center,
                                                    scale: 1.5,
                                                    color: b
                                                        ? Colors.blue
                                                        : Colors.grey.shade300,
                                                  ),
                                                ),
                                                hintText: 'อาการแพ้ โปรดระบุ',
                                                hintStyle: TextStyle(
                                                    color: b
                                                        ? Colors.blue
                                                        : Colors.grey.shade300),
                                                fillColor: b
                                                    ? Colors.blue[50]
                                                    : Colors.white,
                                                filled: true),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     CupertinoPageRoute(
                                      //         builder: (context) =>
                                      //             password_pages()));
                                      _formKey.currentState.save();
                                      if (_formKey.currentState.validate()) {
                                        // print(_formKey.currentState.value);
                                        var jsonEn = jsonEncode(
                                            _formKey.currentState.value);
                                        var jsonDe = jsonDecode(jsonEn);

                                        getcid(jsonDe);
                                      } else {
                                        print("validation failed");
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onWillPop: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => newtype_pages()));
      },
    );
  }
}
