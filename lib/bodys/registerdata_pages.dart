import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/password_pages.dart';
import 'package:thanyarak/bodys/signin_page.dart';

class registerdata_pages extends StatefulWidget {
  registerdata_pages({Key? key}) : super(key: key);

  @override
  _registerdata_pagesState createState() => _registerdata_pagesState();
}

bool id = false;
bool prefix = false;
bool name = false;
bool hbd = false;
bool tel = false;
bool address = false;
bool email = false;
bool a = false;
bool b = false;

class _registerdata_pagesState extends State<registerdata_pages> {
  int _selectedchoice = 0;
  int choice = 0;
  final double topWidgetHeight = 180.0;

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
                                                "images/userdata.png"),
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
                          Container(
                            child: Column(children: [
                              Align(
                                alignment: Alignment(-1, -1),
                                child: Text(
                                  "ลงทะเบียน",
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
                                  "กรุณากรอกข้อมูลของคุณ เพื่อลงทะเบียน",
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
                                          id = hasfocus;
                                        });
                                      },
                                      child: FormBuilderTextField(
                                        name: 'id',
                                        style: GoogleFonts.kanit(fontSize: 14),
                                        autofocus: true,
                                        decoration: InputDecoration(
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
                                                color: id
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                            hintText: 'รหัสผ่าน',
                                            hintStyle: TextStyle(
                                                color: id
                                                    ? Colors.blue
                                                    : Colors.grey.shade300),
                                            fillColor: id
                                                ? Colors.blue[50]
                                                : Colors.white,
                                            filled: true),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Focus(
                                      onFocusChange: (hasfocus) {
                                        setState(() {
                                          prefix = hasfocus;
                                        });
                                      },
                                      child: FormBuilderTextField(
                                        name: 'prefixname',
                                        style: GoogleFonts.kanit(fontSize: 14),
                                        decoration: InputDecoration(
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
                                                color: prefix
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                            hintText: 'คำนำหน้าชื่อ',
                                            hintStyle: TextStyle(
                                                color: prefix
                                                    ? Colors.blue
                                                    : Colors.grey.shade300),
                                            fillColor: prefix
                                                ? Colors.blue[50]
                                                : Colors.white,
                                            filled: true),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Focus(
                                      onFocusChange: (hasfocus) {
                                        setState(() {
                                          name = hasfocus;
                                        });
                                      },
                                      child: FormBuilderTextField(
                                        name: 'name',
                                        style: GoogleFonts.kanit(fontSize: 14),
                                        decoration: InputDecoration(
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
                                                'images/people.png',
                                                alignment: Alignment.center,
                                                scale: 1.5,
                                                color: name
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                            hintText: 'ชื่อ-นามสกุล',
                                            hintStyle: TextStyle(
                                                color: name
                                                    ? Colors.blue
                                                    : Colors.grey.shade300),
                                            fillColor: name
                                                ? Colors.blue[50]
                                                : Colors.white,
                                            filled: true),
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
                                                  });
                                                },
                                                child: FormBuilderTextField(
                                                  name: 'birthday',
                                                  style: GoogleFonts.kanit(
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.blue,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade300,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15)),
                                                      ),
                                                      prefixIcon: Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Image.asset(
                                                          'images/hbd.png',
                                                          alignment:
                                                              Alignment.center,
                                                          scale: 1.5,
                                                          color: hbd
                                                              ? Colors.blue
                                                              : Colors.grey
                                                                  .shade300,
                                                        ),
                                                      ),
                                                      hintText:
                                                          'วัน/เดือน/ปีเกิด',
                                                      hintStyle: TextStyle(
                                                          color: hbd
                                                              ? Colors.blue
                                                              : Colors.grey
                                                                  .shade300),
                                                      fillColor: hbd
                                                          ? Colors.blue[50]
                                                          : Colors.white,
                                                      filled: true),
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
                                                style: GoogleFonts.kanit(
                                                    fontSize: 14),
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade300,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade300,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    hintText: 'อายุ',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey),
                                                    fillColor:
                                                        Colors.grey.shade200,
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
                                        });
                                      },
                                      child: FormBuilderTextField(
                                        name: 'tel',
                                        style: GoogleFonts.kanit(fontSize: 14),
                                        decoration: InputDecoration(
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
                                                'images/phone.png',
                                                alignment: Alignment.center,
                                                scale: 1.5,
                                                color: tel
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                            hintText: 'เบอร์โทรศัพท์',
                                            hintStyle: TextStyle(
                                                color: tel
                                                    ? Colors.blue
                                                    : Colors.grey.shade300),
                                            fillColor: tel
                                                ? Colors.blue[50]
                                                : Colors.white,
                                            filled: true),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Focus(
                                      onFocusChange: (hasfocus) {
                                        setState(() {
                                          address = hasfocus;
                                        });
                                      },
                                      child: FormBuilderTextField(
                                        name: 'address',
                                        style: GoogleFonts.kanit(fontSize: 14),
                                        decoration: InputDecoration(
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
                                                'images/home.png',
                                                alignment: Alignment.center,
                                                scale: 1.5,
                                                color: address
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                            hintText: 'ที่อยู่',
                                            hintStyle: TextStyle(
                                                color: address
                                                    ? Colors.blue
                                                    : Colors.grey.shade300),
                                            fillColor: address
                                                ? Colors.blue[50]
                                                : Colors.white,
                                            filled: true),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Focus(
                                      onFocusChange: (hasfocus) {
                                        setState(() {
                                          email = hasfocus;
                                        });
                                      },
                                      child: FormBuilderTextField(
                                        name: 'email',
                                        style: GoogleFonts.kanit(fontSize: 14),
                                        decoration: InputDecoration(
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
                                                'images/email.png',
                                                alignment: Alignment.center,
                                                scale: 1.5,
                                                color: email
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                            hintText: 'อีเมลล์',
                                            hintStyle: TextStyle(
                                                color: email
                                                    ? Colors.blue
                                                    : Colors.grey.shade300),
                                            fillColor: email
                                                ? Colors.blue[50]
                                                : Colors.white,
                                            filled: true),
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
                                        style: GoogleFonts.kanit(fontSize: 14),
                                        decoration: InputDecoration(
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
                                                'images/อาการแพ้.png',
                                                alignment: Alignment.center,
                                                scale: 1.5,
                                                color: a
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                            hintText: 'โรคประจำตัว โปรดระบุ',
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
                                        style: GoogleFonts.kanit(fontSize: 14),
                                        decoration: InputDecoration(
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
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              password_pages()));
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
                            ]),
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
    );
  }
}
