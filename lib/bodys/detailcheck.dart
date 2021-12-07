//@dart=2.9
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/slipMark.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class detailcheck_page extends StatefulWidget {
  detailcheck_page({Key key}) : super(key: key);
  @override
  _detailcheck_pageState createState() => _detailcheck_pageState();
}

enum SingingCharacter { buse01, buse02, buse03 }
enum SingingCharacterV { email, phone }
SingingCharacterV _characterV2 = SingingCharacterV.email;
SingingCharacter _character = SingingCharacter.buse01;

int _ck = 0;
int _ckbar = 0;

class _detailcheck_pageState extends State<detailcheck_page> {
//

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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.center,
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
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'รายละเอียดการนัดหมาย',
                                          overflow: TextOverflow.ellipsis,
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
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Container(
                        //ถ้าจอดล้นมาลบ -170 ออก
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
                          top: 90, left: 15, right: 15, bottom: 20),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 2) // changes position of shadow
                                      ),
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //เนื้อหาข้างใน
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'ขอผลการตรวจ',
                                            style: GoogleFonts.kanit(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff0088C6),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.grey[100]),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 0.8,
                                                  child:
                                                      Radio<SingingCharacter>(
                                                    activeColor:
                                                        Color(0xff0088C6),
                                                    value:
                                                        SingingCharacter.buse01,
                                                    groupValue: _character,
                                                    onChanged: (SingingCharacter
                                                        value) {
                                                      setState(() {
                                                        _character = value;
                                                        _ckbar = 0;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'ดาวน์โหลดผลการตรวจ',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Icon(
                                                    Icons.text_snippet,
                                                    color: Color(0xff0088C6),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              height: 10,
                                              thickness: 1,
                                            ),
                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 0.8,
                                                  child:
                                                      Radio<SingingCharacter>(
                                                    activeColor:
                                                        Color(0xff0088C6),
                                                    value:
                                                        SingingCharacter.buse02,
                                                    groupValue: _character,
                                                    onChanged: (SingingCharacter
                                                        value) {
                                                      setState(() {
                                                        _character = value;
                                                        _ckbar = 1;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Copy CD',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Icon(
                                                    Icons.album,
                                                    color: Color(0xff0088C6),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              height: 10,
                                              thickness: 1,
                                            ),
                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 0.8,
                                                  child:
                                                      Radio<SingingCharacter>(
                                                    activeColor:
                                                        Color(0xff0088C6),
                                                    value:
                                                        SingingCharacter.buse03,
                                                    groupValue: _character,
                                                    onChanged: (SingingCharacter
                                                        value) {
                                                      setState(() {
                                                        _character = value;
                                                        _ckbar = 2;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'ขอผลหัตถการ',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Icon(
                                                    Icons.note_alt_rounded,
                                                    color: Color(0xff0088C6),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: _ckbar == 0 ? true : false,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Transform.scale(
                                              scale: 0.8,
                                              child: Radio<SingingCharacterV>(
                                                activeColor: Color(0xff0088C6),
                                                value: SingingCharacterV.email,
                                                groupValue: _characterV2,
                                                onChanged:
                                                    (SingingCharacterV valueV) {
                                                  setState(() {
                                                    _characterV2 = valueV;
                                                    _ck = 0;
                                                  });
                                                },
                                              ),
                                            ),
                                            Text(
                                              'อีเมล์',
                                              style: GoogleFonts.kanit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Transform.scale(
                                              scale: 0.8,
                                              child: Radio<SingingCharacterV>(
                                                activeColor: Color(0xff0088C6),
                                                value: SingingCharacterV.phone,
                                                groupValue: _characterV2,
                                                onChanged:
                                                    (SingingCharacterV valueV) {
                                                  setState(() {
                                                    _characterV2 = valueV;
                                                    _ck = 1;
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                              'เบอร์โทรศัพท์',
                                              style: GoogleFonts.kanit(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                              ),
                                            )),
                                          ],
                                        ),
                                        FormBuilderTextField(
                                          keyboardType: TextInputType.number,
                                          name: _ck == 0 ? 'email' : 'phone',
                                          style: GoogleFonts.kanit(),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  const Radius.circular(10),
                                                ),
                                              ),
                                              hintText: _ck == 0
                                                  ? 'อีเมล์'
                                                  : 'เบอร์โทรศัพท์',
                                              fillColor: Color(0xfff3f3f4),
                                              filled: false),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _ckbar == 1 ? true : false,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ที่อยู่จัดส่ง',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        FormBuilderTextField(
                                          keyboardType: TextInputType.number,
                                          name: 'address',
                                          style: GoogleFonts.kanit(),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  const Radius.circular(10),
                                                ),
                                              ),
                                              hintText: 'ที่อยู่จัดส่ง',
                                              fillColor: Color(0xfff3f3f4),
                                              filled: false),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _ckbar == 0
                                      ? true
                                      : _ckbar == 1
                                          ? true
                                          : false,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff43CEF8),
                                            Color(0xff0088C6)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 10, bottom: 5),
                                        child: Text(
                                          _ckbar == 0
                                              ? 'Mammogram Ultrasound : 16-06-2564'
                                              : _ckbar == 1
                                                  ? 'รายละเอียด : ย้อนหลัง 3 ปีจากการตรวจครั้งล่าสุด'
                                                  : '',
                                          style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                                Visibility(
                                  visible: _ckbar == 2 ? true : false,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showGeneralDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    barrierLabel:
                                        MaterialLocalizations.of(context)
                                            .modalBarrierDismissLabel,
                                    barrierColor: Colors.transparent,
                                    transitionDuration:
                                        Duration(milliseconds: 200),
                                    pageBuilder: (BuildContext context,
                                            Animation frist,
                                            Animation second) =>
                                        _ckbar == 0
                                            ? sucess()
                                            : _ckbar == 1
                                                ? payDialog()
                                                : sucessV3());
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 30),
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
                                  ],
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'ขอผลตรวจ',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(),
    );
  }

  Text getText(String txt, double size, Color color, FontWeight getW) {
    return Text(
      txt,
      style: GoogleFonts.kanit(
        fontSize: size,
        fontWeight: getW,
        color: color,
      ),
    );
  }

  Text getTextcontent(String txt) {
    return Text(
      txt,
      style: GoogleFonts.kanit(
        fontSize: 14,
        fontWeight: FontWeight.w200,
        color: Colors.grey,
      ),
    );
  }
}

class sucess extends StatefulWidget {
  sucess({Key key}) : super(key: key);

  @override
  _sucessState createState() => _sucessState();
}

class _sucessState extends State<sucess> {
  @override
  int getAction = 1;
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: true,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 15),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/mailsuc.png'))),
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              "ผลการตรวจ",
                              style: GoogleFonts.kanit(
                                  color: Color(0xff0088C6), fontSize: 22),
                            ),
                            Text(
                              "ผลการตรวจจะถูกส่งไปยัง",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "E-mail : xxxxxx@xxx.com เรียบร้อยแล้ว",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "กรุณาตรวจสอบ E-mail ของท่าน",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            )
                            //ปุ่ม
                            ,
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: dating_page()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
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
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'เสร็จสิ้น',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);

        return true;
      });
  BoxShadow BoxShadow1(double _offset1, _offset2, _blur, _spread) {
    return BoxShadow(
      color: Colors.blue[100],
      offset: Offset(
        _offset1,
        _offset2,
      ),
      blurRadius: _blur,
      spreadRadius: _spread,
    );
  }

  BoxShadow BoxShadow2() {
    return BoxShadow(
      color: Colors.white,
      offset: const Offset(0.0, 0.0),
      blurRadius: 0.0,
      spreadRadius: 0.0,
    );
  } //BoxShadow

}

class payDialog extends StatefulWidget {
  payDialog({Key key}) : super(key: key);

  @override
  _payDialoglogState createState() => _payDialoglogState();
}

class _payDialoglogState extends State<payDialog> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    print(height);
    return Visibility(
      child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(top: 200),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'ชำระเงิน',
                              style: GoogleFonts.kanit(
                                  fontSize: 22, color: Color(0xff0088C6)),
                            ),
                          ),
                          //logoscb
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.purple[900],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/scb01.png'))),
                            height: 80,
                            width: 80,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'ธนาคารไทยพาณิชย์',
                              style: GoogleFonts.kanit(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'เลขที่บัญชี : 016-296034-0',
                              style: GoogleFonts.kanit(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'สาขา : ศิริราช',
                              style: GoogleFonts.kanit(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'จำนวน 160 บาท',
                              style: GoogleFonts.kanit(
                                  fontSize: 18, color: Color(0xff0088C6)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 30),
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'แนบสลิปการชำระเงิน',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff0088C6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pop(context);
                                showGeneralDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    barrierLabel:
                                        MaterialLocalizations.of(context)
                                            .modalBarrierDismissLabel,
                                    barrierColor: Colors.transparent,
                                    transitionDuration:
                                        Duration(milliseconds: 200),
                                    pageBuilder: (BuildContext context,
                                            Animation frist,
                                            Animation second) =>
                                        sucessV2());
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
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
                                  ],
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'ขอผลตรวจ',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
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
            ],
          ),
          bottomNavigationBar: NavigagitonBar()),
    );
  }
}

class sucessV3 extends StatefulWidget {
  sucessV3({Key key}) : super(key: key);

  @override
  _sucessV3State createState() => _sucessV3State();
}

class _sucessV3State extends State<sucessV3> {
  @override
  int getAction = 1;
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: true,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 15),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/mailsuc.png'))),
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              "ผลการตรวจ",
                              style: GoogleFonts.kanit(
                                  color: Color(0xff0088C6), fontSize: 22),
                            ),

                            Text(
                              "รอสรุปจากทีมพยาบาล",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            //ปุ่ม

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: dating_page()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
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
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'เสร็จสิ้น',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);

        return true;
      });
}

class sucessV2 extends StatefulWidget {
  sucessV2({Key key}) : super(key: key);

  @override
  _sucessV2State createState() => _sucessV2State();
}

class _sucessV2State extends State<sucessV2> {
  @override
  int getAction = 1;
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: true,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 15),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/mailsuc.png'))),
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              "ผลการตรวจ",
                              style: GoogleFonts.kanit(
                                  color: Color(0xff0088C6), fontSize: 22),
                            ),
                            Text(
                              "ผลการตรวจจะถูกส่งไปตามที่อยู่นี้",
                              style: GoogleFonts.kanit(
                                  color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              "555 สายไหม 99 ถนนสายไหม แขวงสายไหม",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "เขตสายไหม กรุงเทพฯ 10220",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //ปุ่ม

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "แก้ไขที่อยู่จัดส่ง",
                                style: GoogleFonts.kanit(
                                    color: Color(0xff0088C6), fontSize: 18),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: dating_page()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
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
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'เสร็จสิ้น',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);

        return true;
      });
}
