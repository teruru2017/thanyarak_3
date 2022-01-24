//@dart = 2.9
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
import 'package:thanyarak/bodys/forgetpassword_pages.dart';
import 'package:thanyarak/bodys/login/main_login_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/newtype_pages.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/session.dart';

import 'package:thanyarak/states/main_home.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';

class PinPage extends StatefulWidget {
  PinPage({Key key, this.length, this.onChange}) : super(key: key);

  @override
  _PinPageState createState() => _PinPageState();
  final int length;
  final Function onChange;
}

bool num1 = false;
String txt;
String pin;

class _PinPageState extends State<PinPage> {
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getpin();
  }

  Future getpin() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      pin = per.getString('password');
      print(pin);
    });
  }

  String number = '';
  setValue(String val) {
    if (number.length < 4) {
      setState(() {
        number += val;
        if (number.length == 4) {
          if (number == pin) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MainPage()));
          } else if (number != pin) {
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
                          title: 'รหัสผ่านไม่ถูกต้อง',
                          detail: '',
                        ));
            number = "";
          }
        }
      });
    }
  }

  backspace(String text) {
    if (text.length > 0) {
      setState(() {
        number = text.split('').sublist(0, text.length - 1).join('');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double pinshow = 20;
    double pinnum = 80;

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/bg_menu.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Container(
                    height: height * 0.3,
                    padding: EdgeInsets.only(
                        top: 30, left: 15, right: 15, bottom: 20),
                    child: Container(
                      //color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('กรุณากรอกรหัสผ่าน',
                              style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinshow,
                                height: pinshow,
                                decoration: BoxDecoration(
                                  color: number.length >= 1
                                      ? Colors.white
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinshow,
                                height: pinshow,
                                decoration: BoxDecoration(
                                  color: number.length >= 2
                                      ? Colors.white
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinshow,
                                height: pinshow,
                                decoration: BoxDecoration(
                                  color: number.length >= 3
                                      ? Colors.white
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinshow,
                                height: pinshow,
                                decoration: BoxDecoration(
                                  color: number.length >= 4
                                      ? Colors.white
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text('ลืมรหัสผ่าน',
                                style: GoogleFonts.kanit(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.7,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('1');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('1',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('2');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('2',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('3');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('3',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('4');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('4',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('5');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('5',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('6');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('6',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('7');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('7',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('8');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('8',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('9');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('9',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide: BorderSide(color: Colors.white),
                                  padding: EdgeInsets.all(10.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    setState(() {
                                      setValue('0');
                                      print(number);
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('0',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.kanit(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: pinnum,
                                height: pinnum,
                                child: OutlineButton(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  padding: EdgeInsets.all(0.0),
                                  shape: CircleBorder(),
                                  onPressed: () {
                                    backspace(number);
                                    print(number);
                                  },
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.backspace,
                                        size: 30,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
      onWillPop: () {
        SystemNavigator.pop();
        exit(0);
      },
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool haveBorder;
  final Function onPressed;
  const NumpadButton(
      {Key key, this.text, this.icon, this.haveBorder = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle =
        TextStyle(fontSize: 22.0, color: Theme.of(context).primaryColor);
    Widget label = icon != null
        ? Icon(
            icon,
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            size: 35.0,
          )
        : Text(this.text ?? '', style: buttonStyle);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: OutlineButton(
        borderSide:
            haveBorder ? BorderSide(color: Colors.grey[400]) : BorderSide.none,
        // highlightedBorderColor: icon != null
        //     ? Colors.transparent
        //     : Theme.of(context).primaryColor.withOpacity(0.3),
        // splashColor: icon != null
        //     ? Colors.transparent
        //     : Theme.of(context).primaryColor.withOpacity(0.1),
        padding: EdgeInsets.all(20.0),
        shape: CircleBorder(),
        onPressed: () {},
        child: label,
      ),
    );
  }
}
