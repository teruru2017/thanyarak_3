//@dart=2.9
import 'dart:convert';
//import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/slipMark.dart';
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat, Intl;
import 'package:thanyarak/widgets/msgBox_widget.dart';

class detailcheck_page extends StatefulWidget {
  detailcheck_page({Key key, this.list_id}) : super(key: key);
  List<int> list_id;
  @override
  _detailcheck_pageState createState() => _detailcheck_pageState();
}

String cid, resultType, addressHis;
enum SingingCharacter { buse01, buse02, buse03 }
enum SingingCharacterV { email, phone }
SingingCharacterV _characterV2 = SingingCharacterV.email;
SingingCharacter _character = SingingCharacter.buse01;

String imgBase64;

int _ck = 0;
int _ckbar = 0;
String typeSend;
String stringList;

class _detailcheck_pageState extends State<detailcheck_page> {
  TextEditingController input_download = TextEditingController();
  TextEditingController input_cd = TextEditingController();
  List<int> listID;
  void initState() {
    imgBase64 = "";
    _ck = 0;
    _ckbar = 0;
    _character = SingingCharacter.buse01;
    _characterV2 = SingingCharacterV.email;
    print("_____________________________");
    print('this.page : detailcheck');
    Intl.defaultLocale = 'th';
    resultType = 'download';
    initializeDateFormatting();
    super.initState();
    getDATA();
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      listID = widget.list_id;
      // print(listID);
    });
  }

  Future<void> postHistory({
    String userId,
    String historyId,
    String resultType,
    String phoneNumber,
    String email,
    String address,
    String slipImage,
  }) async {
    var url = '${apiurl().urlapi}/history.php';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "userId": "${userId}",
        "historyId": "${historyId}",
        "resultType": "${resultType}",
        "phoneNumber": "${phoneNumber}",
        "email": "${email}",
        "address": "${address}",
        "slipImage": "${slipImage}",
      }),
    );
    if (response.statusCode == 200) {
      print('postHistory Status APi: ' + response.statusCode.toString());
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  sucess(
                    TypeSend: typeSend,
                    DetaiSend: input_download.text,
                  ));
    } else {
      print('postHistory Status APi: ' + response.statusCode.toString());
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
                    title: 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
                    detail: '',
                  ));
    }
  }

  Future<void> postProcedureHistory({
    String userId,
    String historyId,
    String resultType,
    String phoneNumber,
    String email,
    String address,
    String slipImage,
  }) async {
    var url = '${apiurl().urlapi}/history.php';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "userId": "${userId}",
        "historyId": "${historyId}",
        "resultType": "${resultType}",
        "phoneNumber": "${phoneNumber}",
        "email": "${email}",
        "address": "${address}",
        "slipImage": "${slipImage}",
      }),
    );
    if (response.statusCode == 200) {
      print('postHistory Status APi: ' + response.statusCode.toString());
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  sucessV3());
    } else {
      print('postHistory Status APi: ' + response.statusCode.toString());
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
                    title: 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
                    detail: '',
                  ));
    }
  }

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
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
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
                                    padding: EdgeInsets.only(top: 20),
                                    child: Container(
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '',
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
                      padding: const EdgeInsets.only(top: 90),
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
                          top: 110, left: 15, right: 15, bottom: 20),
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
                                              fontSize: 22,
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
                                                  scale: 1,
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
                                                        resultType = 'download';
                                                        input_cd.clear();
                                                        input_download.clear();
                                                        _ck = 0;
                                                        _characterV2 =
                                                            SingingCharacterV
                                                                .email;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'ดาวน์โหลดผลการตรวจ',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 16,
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
                                                  scale: 1,
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
                                                        resultType = 'CD';
                                                        input_cd.clear();
                                                        input_download.clear();
                                                        _ck = null;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Copy CD',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 16,
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
                                                  scale: 1,
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
                                                        resultType =
                                                            'procedure';
                                                        input_cd.clear();
                                                        input_download.clear();
                                                        _ck = null;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'ขอผลหัตถการ',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 16,
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
                                              scale: 1,
                                              child: Radio<SingingCharacterV>(
                                                activeColor: Color(0xff0088C6),
                                                value: SingingCharacterV.email,
                                                groupValue: _characterV2,
                                                onChanged:
                                                    (SingingCharacterV valueV) {
                                                  setState(() {
                                                    _characterV2 = valueV;
                                                    _ck = 0;

                                                    input_download.clear();
                                                  });
                                                },
                                              ),
                                            ),
                                            Text(
                                              'อีเมล์',
                                              style: GoogleFonts.kanit(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Transform.scale(
                                              scale: 1,
                                              child: Radio<SingingCharacterV>(
                                                activeColor: Color(0xff0088C6),
                                                value: SingingCharacterV.phone,
                                                groupValue: _characterV2,
                                                onChanged:
                                                    (SingingCharacterV valueV) {
                                                  setState(() {
                                                    _characterV2 = valueV;
                                                    _ck = 1;
                                                    input_download.clear();
                                                  });
                                                },
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                              'เบอร์โทรศัพท์',
                                              style: GoogleFonts.kanit(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ],
                                        ),
                                        FormBuilderTextField(
                                          keyboardType: TextInputType.text,
                                          controller: input_download,
                                          name: _ck == 0 ? 'email' : 'phone',
                                          style:
                                              GoogleFonts.kanit(fontSize: 14),
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1),
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
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  const Radius.circular(10),
                                                ),
                                              ),
                                              hintText: _ck == 0
                                                  ? 'อีเมล์'
                                                  : 'เบอร์โทรศัพท์',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
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
                                          keyboardType: TextInputType.text,
                                          name: 'address',
                                          controller: input_cd,
                                          style:
                                              GoogleFonts.kanit(fontSize: 14),
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1),
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
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  const Radius.circular(10),
                                                ),
                                              ),
                                              hintText: 'ที่อยู่จัดส่ง',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
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
                                typeSend = _ck == 0
                                    ? 'E-mail'
                                    : _ck == 1
                                        ? 'Sms'
                                        : '';
                                stringList = listID.join(",");
                                print("cid : ${cid}");
                                print("resultType :${resultType}");
                                print("input_download :${input_download.text}");
                                print("input_cd :${input_cd.text}");
                                print("typeSend :${typeSend}");
                                // print(_ckbar);
                                addressHis = input_cd.text;

                                //ปุ่ม
                                if (_ckbar == 0) {
                                  String phone_ck = "",
                                      mail_ck = "",
                                      img = "",
                                      resultType_ck = "";

                                  if (input_download.text != "") {
                                    _ck == 0
                                        ? mail_ck = input_download.text
                                        : phone_ck = input_download.text;
                                    postHistory(
                                        userId: cid,
                                        historyId: stringList,
                                        address: input_cd.text,
                                        email: mail_ck,
                                        phoneNumber: phone_ck,
                                        resultType: resultType,
                                        slipImage: img);
                                  } else {
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
                                            MSGBoxWidget(
                                              title: 'กรุณากรอกข้อมูลให้ครบ',
                                              detail: '',
                                            ));
                                  }
                                } else if (_ckbar == 1) {
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
                                          payDialog());
                                } else if (_ckbar == 2) {
                                  postProcedureHistory(
                                      userId: cid,
                                      historyId: stringList,
                                      address: '',
                                      email: '',
                                      phoneNumber: '',
                                      resultType: resultType,
                                      slipImage: '');
                                }

                                // showGeneralDialog(
                                //     context: context,
                                //     barrierDismissible: false,
                                //     barrierLabel:
                                //         MaterialLocalizations.of(context)
                                //             .modalBarrierDismissLabel,
                                //     barrierColor: Colors.transparent,
                                //     transitionDuration:
                                //         Duration(milliseconds: 200),
                                //     pageBuilder: (BuildContext context,
                                //             Animation frist,
                                //             Animation second) =>
                                //         _ckbar == 0
                                //             ? sucess()
                                //             : _ckbar == 1
                                //                 ? payDialog()
                                //                 : sucessV3());
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
  sucess({Key key, this.DetaiSend, this.TypeSend}) : super(key: key);
  String DetaiSend;
  String TypeSend;
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
                              "${widget.TypeSend} : ${widget.DetaiSend} เรียบร้อยแล้ว",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "กรุณาตรวจสอบ ${widget.TypeSend} ของท่าน",
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
                                Navigator.pop(context);
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
  Future<void> postCDHistory({
    String userId,
    String historyId,
    String resultType,
    String phoneNumber,
    String email,
    String address,
    String slipImage,
  }) async {
    var url = '${apiurl().urlapi}/history.php';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "userId": "${userId}",
        "historyId": "${historyId}",
        "resultType": "${resultType}",
        "phoneNumber": "${phoneNumber}",
        "email": "${email}",
        "address": "${address}",
        "slipImage": "${slipImage}",
      }),
    );
    if (response.statusCode == 200) {
      print('postCDHistory Status APi: ' + response.statusCode.toString());
      Navigator.pop(context);
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  sucessV2());
    } else {
      print('postCDHistory Status APi: ' + response.statusCode.toString());
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
                    title: 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
                    detail: '',
                  ));
    }
  }

  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";
  @override
  _getFromGallery() async {
    var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
    //you can use ImageCourse.camera for Camera capture
    if (pickedFile != null) {
      imagepath = pickedFile.path;
      // print(imagepath);

      File imagefile = File(imagepath);
      Uint8List imagebytes = await imagefile.readAsBytes();
      String base64string = base64.encode(imagebytes);
      setState(() {
        imgBase64 = base64string;
      });
      // print(imgBase64);

      Uint8List decodedbytes = base64.decode(base64string);
    } else {
      print("No image is selected.");
    }
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    // print(height);
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
                              setState(() {
                                _getFromGallery();
                              });
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
//แนปสลิป
                                // print(addressHis.length);
                                if (addressHis.length > 0) {
                                  if (imgBase64.length > 0) {
                                    postCDHistory(
                                        userId: cid,
                                        historyId: stringList,
                                        address: addressHis,
                                        email: '',
                                        phoneNumber: '',
                                        resultType: resultType,
                                        slipImage: imgBase64);
                                  } else {
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
                                            MSGBoxWidget(
                                              title: 'กรุณาแนบสลิปการชำระเงิน',
                                              detail: '',
                                            ));
                                  }
                                } else {
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
                                          MSGBoxWidget(
                                            title: 'กรุณากรอกที่อยู่',
                                            detail: '',
                                          ));
                                }
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
                              "${addressHis}",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            //ปุ่ม

                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       Navigator.pop(context);
                            //     });
                            //   },
                            //   child: Text(
                            //     "แก้ไขที่อยู่จัดส่ง",
                            //     style: GoogleFonts.kanit(
                            //         color: Color(0xff0088C6), fontSize: 18),
                            //   ),
                            // ),
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
