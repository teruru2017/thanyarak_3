import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/forgetpassword_pages.dart';
import 'package:thanyarak/bodys/login/main_login_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/newtype_pages.dart';
import 'package:thanyarak/bodys/notification_page.dart';

import 'package:thanyarak/states/main_home.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final double topWidgetHeight = 180.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(children: <Widget>[
        Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/bg_menu.png"),
                  alignment: Alignment.topCenter),
            ),
            child: Column(
              children: [
                Container(
                  height: topWidgetHeight,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 200,
                          child: Container(
                            //color: Colors.amber,

                            //margin: EdgeInsets.only(top: 35),
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            // color: Colors.pink,
                                            image: DecorationImage(
                                                scale: 1.5,
                                                image: AssetImage(
                                                    "images/circle.png"),
                                                alignment: Alignment.center)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                scale: 1.8,
                                                image: AssetImage(
                                                    "images/iconlogin.png"),
                                                alignment: Alignment(0, 0.8))),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      MainHome()));
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              //color: Colors.amber,
                                              image: DecorationImage(
                                                  scale: 1.3,
                                                  image: AssetImage(
                                                      "images/back01.png"),
                                                  alignment:
                                                      Alignment(-0.9, -0.7))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //หัว
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 30, left: 20, right: 20, bottom: 0),
                            child: Column(children: [
                              Align(
                                alignment: Alignment(-1, -1),
                                child: Text(
                                  "เข้าสู่ระบบ",
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
                                  "กรุณากรอกรหัสผ่าน เพื่อเข้าสู่ระบบ",
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
                                    FormBuilderTextField(
                                      name: 'password',
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      style: GoogleFonts.kanit(),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  const Radius.circular(10))),

                                          //border: InputBorder.none,
                                          //fontfamily: GoogleFonts.kanit(),
                                          prefixIcon: Icon(Icons.lock_rounded),
                                          labelText: 'รหัสผ่าน',
                                          //border: OutlineInputBorder(),
                                          fillColor: Color(0xfff3f3f4),
                                          filled: false),
                                      // valueTransformer: (text) => num.tryParse(text),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(context,
                                            errorText: 'กรุณากรอกรหัสผ่าน'),
                                        FormBuilderValidators.minLength(
                                            context, 8,
                                            errorText:
                                                'รหัสผ่านอย่างน้อย 8 ตัว'),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
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
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffB7B7B7),
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MainLoginPage()));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xffE6EFFE),
                                  ),
                                  child: Text(
                                    "เข้าสู่ระบบ",
                                    style: GoogleFonts.kanit(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 16,
                                      color: Color(0xffB7B7B7),
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
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  newtype_pages()));
                                    },
                                    child: Text(
                                      "ลงทะเบียน",
                                      style: GoogleFonts.kanit(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ])
      ])),
    );
  }
}
