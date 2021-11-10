import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';

class detaildonate_pages extends StatefulWidget {
  detaildonate_pages({Key? key}) : super(key: key);

  @override
  _detaildonate_pagesState createState() => _detaildonate_pagesState();
}

class _detaildonate_pagesState extends State<detaildonate_pages> {
  int _selectedchoice = 0;
  int choice = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/header2.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
              child: Column(
                children: [
                  Container(
                    height: 110,
                    //width: 400,
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment(-0.2, 0),
                            child: Text('รายละเอียดการบริจาค',
                                style: GoogleFonts.kanit(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ))),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => DonatePage()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    scale: 1.3,
                                    image: AssetImage("images/back01.png"),
                                    alignment: Alignment(-0.85, 0))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 700,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      scale: 1.3,
                      image: AssetImage('images/member1.png'),
                      alignment: Alignment.center,
                    )),
                  ),
                  SizedBox(height: 20),
                  Align(
                    child: Text(
                      'บริษัท ฟิลิป เวน(ประเทศไทย) จำกัด ได้นำรายได้จากการจัดกิจกรรมต้ายภัยมะเร็งเต้านม',
                      style: GoogleFonts.kanit(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0088C6),
                      ),
                    ),
                    alignment: Alignment(-2, -1),
                  ),
                  SizedBox(height: 320),
                  GestureDetector(
                    onTap: () {
                      showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.transparent,
                          transitionDuration: Duration(milliseconds: 200),
                          pageBuilder: (BuildContext context, Animation frist,
                              Animation second) {
                            return Scaffold(
                              backgroundColor: Colors.black38,
                              body: Stack(
                                children: <Widget>[
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width - 0,
                                      height: 900,
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.only(top: 80),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const SizedBox(height: 20),
                                          Text(
                                            'ร่วมบริจาค',
                                            style: GoogleFonts.kanit(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff0088C6),
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Text(
                                            'โครงการ บริษัท ฟิลิป เวน(ประเทศไทย) จำกัด ได้นำรายได้จากการจัดกิจกรรมต้านภัยมะเร็งเต้านม มอบให้มูลนิธิ',
                                            style: GoogleFonts.kanit(
                                              fontSize: 15.5,
                                              //fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () {
                                              showGeneralDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  barrierLabel:
                                                      MaterialLocalizations.of(
                                                              context)
                                                          .modalBarrierDismissLabel,
                                                  barrierColor:
                                                      Colors.transparent,
                                                  transitionDuration: Duration(
                                                      milliseconds: 200),
                                                  pageBuilder:
                                                      (BuildContext context,
                                                          Animation frist,
                                                          Animation second) {
                                                    return Scaffold(
                                                      backgroundColor:
                                                          Colors.black38,
                                                      body:
                                                          SingleChildScrollView(
                                                        child: Stack(
                                                          children: <Widget>[
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  0,
                                                              height: 900,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(20),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 80),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                              ),
                                                              child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: <
                                                                      Widget>[
                                                                    const SizedBox(
                                                                        height:
                                                                            20),
                                                                    Text(
                                                                      'ร่วมบริจาค',
                                                                      style: GoogleFonts
                                                                          .kanit(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color(
                                                                            0xff0088C6),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            15),
                                                                    Text(
                                                                      'โครงการ บริษัท ฟิลิป เวน(ประเทศไทย) จำกัด ได้นำรายได้จากการจัดกิจกรรมต้านภัยมะเร็งเต้านม มอบให้มูลนิธิ',
                                                                      style: GoogleFonts
                                                                          .kanit(
                                                                        fontSize:
                                                                            15.5,
                                                                        //fontWeight: FontWeight.w400,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            15),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width -
                                                                          0,
                                                                      height:
                                                                          60,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                              image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'images/scb.png'),
                                                                        scale:
                                                                            0.5,
                                                                      )),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        'ธนาคารไทยพาณิชย์',
                                                                        style: GoogleFonts
                                                                            .kanit(
                                                                          fontSize:
                                                                              15.5,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        'ชื่อบัญชี : มูลนิธิถันยรักษ์ในพระราชูประถัมภ์\nสมเด็จพระศรีนครินทราบรมราชชนนี\nเลขบัญชี : 016-2-66644-1',
                                                                        style: GoogleFonts
                                                                            .kanit(
                                                                          fontSize:
                                                                              15.5,
                                                                          color:
                                                                              Colors.black45,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
//image picker
                                                                        ),
                                                                    SizedBox(
                                                                        height:
                                                                            30),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment(
                                                                              -1,
                                                                              1),
                                                                      child:
                                                                          Text(
                                                                        'วัตถุประสงค์ในการบริจาค',
                                                                        style: GoogleFonts
                                                                            .kanit(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    FormBuilderTextField(
                                                                      name:
                                                                          'objective',
                                                                      obscureText:
                                                                          true,
                                                                      style: GoogleFonts
                                                                          .kanit(),
                                                                      decoration: InputDecoration(
                                                                          labelText:
                                                                              'วัตถุประสงค์',
                                                                          border: OutlineInputBorder(
                                                                              borderRadius: const BorderRadius.all(const Radius.circular(
                                                                                  10))),
                                                                          fillColor: Color(
                                                                              0xfff3f3f4),
                                                                          filled:
                                                                              false),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment(
                                                                              -1,
                                                                              1),
                                                                      child:
                                                                          Text(
                                                                        'ที่อยู่จัดส่งใบเสร็จรับเงิน',
                                                                        style: GoogleFonts
                                                                            .kanit(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    FormBuilderTextField(
                                                                      name:
                                                                          'addresscheck',
                                                                      obscureText:
                                                                          true,
                                                                      style: GoogleFonts
                                                                          .kanit(),
                                                                      decoration: InputDecoration(
                                                                          labelText:
                                                                              'ที่อยู่',
                                                                          border: OutlineInputBorder(
                                                                              borderRadius: const BorderRadius.all(const Radius.circular(
                                                                                  10))),
                                                                          fillColor: Color(
                                                                              0xfff3f3f4),
                                                                          filled:
                                                                              false),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            30),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        padding:
                                                                            EdgeInsets.symmetric(vertical: 15),
                                                                        alignment:
                                                                            Alignment.center,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(10)),
                                                                          gradient: LinearGradient(
                                                                              begin: Alignment.centerLeft,
                                                                              end: Alignment.centerRight,
                                                                              colors: [
                                                                                Color(0xffffffff),
                                                                                Color(0xffffffff)
                                                                              ]),
                                                                          border:
                                                                              Border.all(color: Colors.blueAccent.shade100),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          padding:
                                                                              EdgeInsets.symmetric(vertical: 15),
                                                                          alignment:
                                                                              Alignment.center,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            image:
                                                                                DecorationImage(
                                                                              image: AssetImage('images/check.png'),
                                                                              scale: 1.5,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            5),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        showGeneralDialog(
                                                                            context:
                                                                                context,
                                                                            barrierDismissible:
                                                                                true,
                                                                            barrierLabel:
                                                                                MaterialLocalizations.of(context).modalBarrierDismissLabel,
                                                                            barrierColor: Colors.transparent,
                                                                            transitionDuration: Duration(milliseconds: 200),
                                                                            pageBuilder: (BuildContext context, Animation frist, Animation second) {
                                                                              return Scaffold(
                                                                                backgroundColor: Colors.black38,
                                                                                body: SingleChildScrollView(
                                                                                  child: Stack(
                                                                                    children: <Widget>[
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width - 0,
                                                                                        height: 900,
                                                                                        padding: EdgeInsets.all(20),
                                                                                        margin: EdgeInsets.only(top: 80),
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.white,
                                                                                          shape: BoxShape.rectangle,
                                                                                          borderRadius: BorderRadius.circular(16),
                                                                                        ),
                                                                                        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                                                                                          const SizedBox(height: 20),
                                                                                          Text(
                                                                                            'สรุปการบริจาค',
                                                                                            style: GoogleFonts.kanit(
                                                                                              fontSize: 20,
                                                                                              fontWeight: FontWeight.w400,
                                                                                              color: Color(0xff0088C6),
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(height: 15),
                                                                                          Text(
                                                                                            'โครงการ บริษัท ฟิลิป เวน(ประเทศไทย) จำกัด ได้นำรายได้จากการจัดกิจกรรมต้านภัยมะเร็งเต้านม มอบให้มูลนิธิ',
                                                                                            style: GoogleFonts.kanit(
                                                                                              fontSize: 15.5,
                                                                                              //fontWeight: FontWeight.w400,
                                                                                              color: Colors.black,
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(height: 30),
                                                                                          Row(children: [
                                                                                            Container(
                                                                                              width: 45,
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                image: DecorationImage(
                                                                                                  image: AssetImage('images/iconmoney.png'),
                                                                                                  scale: 1.5,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(width: 10),
                                                                                            Align(
                                                                                              alignment: Alignment.centerLeft,
                                                                                              child: Text(
                                                                                                'โอนผ่านธนาคารไทยพาณิชย์',
                                                                                                style: GoogleFonts.kanit(
                                                                                                  fontSize: 15.5,
                                                                                                  color: Colors.black,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ]),
                                                                                          SizedBox(height: 5),
                                                                                          Align(
                                                                                            alignment: Alignment(0, 2),
                                                                                            child: Text(
                                                                                              'ชื่อบัญชี : มูลนิธิถันยรักษ์ในพระราชูประถัมภ์\nสมเด็จพระศรีนครินทราบรมราชชนนี\nเลขบัญชี : 016-2-66644-1',
                                                                                              style: GoogleFonts.kanit(
                                                                                                fontSize: 15.5,
                                                                                                color: Colors.black45,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: Alignment(0, 2),
                                                                                            child: Text(
                                                                                              '100 บาท',
                                                                                              style: GoogleFonts.kanit(
                                                                                                fontSize: 15.5,
                                                                                                color: Color(0xff0088C6),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
//image picker
                                                                                              ),
                                                                                          SizedBox(height: 30),
                                                                                          Align(
                                                                                            alignment: Alignment(-1, 1),
                                                                                            child: Text(
                                                                                              'วัตถุประสงค์ในการบริจาค',
                                                                                              style: GoogleFonts.kanit(
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w400,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(height: 5),
                                                                                          Align(
                                                                                            alignment: Alignment(-1, 1),
                                                                                            child: Text(
                                                                                              'ทำบุญ',
                                                                                              style: GoogleFonts.kanit(
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w400,
                                                                                                color: Colors.black45,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(height: 10),
                                                                                          Align(
                                                                                            alignment: Alignment(-1, 1),
                                                                                            child: Text(
                                                                                              'ที่อยู่จัดส่งใบเสร็จรับเงิน',
                                                                                              style: GoogleFonts.kanit(
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w400,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(height: 5),
                                                                                          Align(
                                                                                            alignment: Alignment(-1, 1),
                                                                                            child: Text(
                                                                                              '555 สายไหม 87 ถนนสายไหม แขวงสายไหม',
                                                                                              style: GoogleFonts.kanit(
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w400,
                                                                                                color: Colors.black45,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(height: 5),
                                                                                          GestureDetector(
                                                                                            onTap: () {
                                                                                              showGeneralDialog(
                                                                                                  context: context,
                                                                                                  barrierDismissible: true,
                                                                                                  barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                                                                                                  barrierColor: Colors.transparent,
                                                                                                  transitionDuration: Duration(milliseconds: 200),
                                                                                                  pageBuilder: (BuildContext context, Animation frist, Animation second) {
                                                                                                    return Scaffold(
                                                                                                        backgroundColor: Colors.black38,
                                                                                                        body: SingleChildScrollView(
                                                                                                            child: Stack(children: <Widget>[
                                                                                                          Container(
                                                                                                            width: 350,
                                                                                                            height: 400,
                                                                                                            padding: EdgeInsets.all(20),
                                                                                                            margin: EdgeInsets.only(
                                                                                                              top: 150,
                                                                                                              left: 16,
                                                                                                              right: 16,
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Colors.white,
                                                                                                              shape: BoxShape.rectangle,
                                                                                                              borderRadius: BorderRadius.circular(16),
                                                                                                            ),
                                                                                                            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                                                                                                              Container(
                                                                                                                width: 100,
                                                                                                                height: 100,
                                                                                                                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/success01.png'))),
                                                                                                              ),
                                                                                                              SizedBox(height: 10),
                                                                                                              Text(
                                                                                                                'บริจาคสำเร็จ',
                                                                                                                style: GoogleFonts.kanit(
                                                                                                                  fontSize: 20,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  color: Color(0xff0088C6),
                                                                                                                ),
                                                                                                              ),
                                                                                                              const SizedBox(height: 15),
                                                                                                              Text(
                                                                                                                'ขอบคุณสำหรับยอดบริจาคของท่าน',
                                                                                                                style: GoogleFonts.kanit(
                                                                                                                  fontSize: 15.5,
                                                                                                                  //fontWeight: FontWeight.w400,
                                                                                                                  color: Colors.black45,
                                                                                                                ),
                                                                                                              ),
                                                                                                              SizedBox(height: 5),
                                                                                                              Align(
                                                                                                                alignment: Alignment(0, 0),
                                                                                                                child: Text(
                                                                                                                  'โดยจะส่งใบเสร็จรับเงินไปยัง',
                                                                                                                  style: GoogleFonts.kanit(
                                                                                                                    fontSize: 15.5,
                                                                                                                    color: Colors.black,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: Alignment(0, 0),
                                                                                                                child: Text(
                                                                                                                  '555 สายไหม 87 ถนนสายไหม แขวงสายไหม',
                                                                                                                  style: GoogleFonts.kanit(
                                                                                                                    fontSize: 15.5,
                                                                                                                    color: Colors.black,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: Alignment(0, 0),
                                                                                                                child: Text(
                                                                                                                  'เขตสายไหม กทม. 10220',
                                                                                                                  style: GoogleFonts.kanit(
                                                                                                                    fontSize: 15.5,
                                                                                                                    color: Colors.black,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              SizedBox(height: 45),
                                                                                                              GestureDetector(
                                                                                                                onTap: () {
                                                                                                                  Navigator.push(context, CupertinoPageRoute(builder: (context) => detaildonate_pages()));
                                                                                                                },
                                                                                                                child: Container(
                                                                                                                    width: MediaQuery.of(context).size.width,
                                                                                                                    padding: EdgeInsets.symmetric(vertical: 15),
                                                                                                                    alignment: Alignment.center,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                                                      color: Color(0xffE6EFFE),
                                                                                                                      gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                                                                                                                    ),
                                                                                                                    child: Align(
                                                                                                                      alignment: Alignment.center,
                                                                                                                      child: Text(
                                                                                                                        'เสร็จสิ้น',
                                                                                                                        style: GoogleFonts.kanit(
                                                                                                                          fontSize: 16,
                                                                                                                          fontWeight: FontWeight.w300,
                                                                                                                          color: Colors.white,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    )),
                                                                                                              ),
                                                                                                            ]),
                                                                                                          ),
                                                                                                        ])));
                                                                                                  });
                                                                                            },
                                                                                            child: Container(
                                                                                              width: MediaQuery.of(context).size.width,
                                                                                              padding: EdgeInsets.symmetric(vertical: 15),
                                                                                              alignment: Alignment.center,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                                color: Color(0xffE6EFFE),
                                                                                                gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                                                                                                  Color(0xff0088C6),
                                                                                                  Color(0xff43CEF8)
                                                                                                ]),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: MediaQuery.of(context).size.width,
                                                                                                padding: EdgeInsets.symmetric(vertical: 15),
                                                                                                alignment: Alignment.center,
                                                                                                decoration: BoxDecoration(
                                                                                                  image: DecorationImage(
                                                                                                    image: AssetImage('images/donate02.png'),
                                                                                                    scale: 1.5,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ]),
                                                                                      ),
                                                                                      Positioned(
                                                                                        top: 50,
                                                                                        left: 162,
                                                                                        right: 162,
                                                                                        child: Container(
                                                                                          width: 70,
                                                                                          height: 70,
                                                                                          //padding: EdgeInsets.all(10),
                                                                                          //margin: EdgeInsets.only(top: 50),
                                                                                          decoration: BoxDecoration(
                                                                                            color: Colors.black,
                                                                                            shape: BoxShape.rectangle,
                                                                                            borderRadius: BorderRadius.circular(25),
                                                                                            gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                                                                                              Color(0xff0088C6),
                                                                                              Color(0xff43CEF8)
                                                                                            ]),
                                                                                            image: DecorationImage(
                                                                                              image: AssetImage('images/icondonate.png'),
                                                                                              scale: 1.5,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        padding:
                                                                            EdgeInsets.symmetric(vertical: 15),
                                                                        alignment:
                                                                            Alignment.center,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(10)),
                                                                          color:
                                                                              Color(0xffE6EFFE),
                                                                          gradient: LinearGradient(
                                                                              begin: Alignment.centerLeft,
                                                                              end: Alignment.centerRight,
                                                                              colors: [
                                                                                Color(0xff0088C6),
                                                                                Color(0xff43CEF8)
                                                                              ]),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          padding:
                                                                              EdgeInsets.symmetric(vertical: 15),
                                                                          alignment:
                                                                              Alignment.center,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            image:
                                                                                DecorationImage(
                                                                              image: AssetImage('images/donate02.png'),
                                                                              scale: 1.5,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            Positioned(
                                                              top: 50,
                                                              left: 162,
                                                              right: 162,
                                                              child: Container(
                                                                width: 70,
                                                                height: 70,
                                                                //padding: EdgeInsets.all(10),
                                                                //margin: EdgeInsets.only(top: 50),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25),
                                                                  gradient: LinearGradient(
                                                                      begin: Alignment
                                                                          .centerLeft,
                                                                      end: Alignment.centerRight,
                                                                      colors: [
                                                                        Color(
                                                                            0xff0088C6),
                                                                        Color(
                                                                            0xff43CEF8)
                                                                      ]),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: AssetImage(
                                                                        'images/icondonate.png'),
                                                                    scale: 1.5,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              width: 500,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/bank.png"),
                                                      alignment:
                                                          Alignment.center)),
                                            ),
                                          ),
                                          SizedBox(height: 215),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                0,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    scale: 1.5,
                                                    image: AssetImage(
                                                        "images/textmoney.png"),
                                                    alignment:
                                                        Alignment.center)),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                0,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    scale: 1.5,
                                                    image: AssetImage(
                                                        "images/qrcode.png"),
                                                    alignment:
                                                        Alignment.center)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showGeneralDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  barrierLabel:
                                                      MaterialLocalizations.of(
                                                              context)
                                                          .modalBarrierDismissLabel,
                                                  barrierColor:
                                                      Colors.transparent,
                                                  transitionDuration: Duration(
                                                      milliseconds: 200),
                                                  pageBuilder:
                                                      (BuildContext context,
                                                          Animation frist,
                                                          Animation second) {
                                                    return Scaffold(
                                                      backgroundColor:
                                                          Colors.black38,
                                                      body: Stack(
                                                        children: <Widget>[
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                0,
                                                            height: 900,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 80),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                          ),
                                                          const Positioned(
                                                            top: 40,
                                                            left: 16,
                                                            right: 16,
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors
                                                                      .blueAccent,
                                                              radius: 35,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  0,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      scale: 1.5,
                                                      image: AssetImage(
                                                          "images/donate01.png"),
                                                      alignment:
                                                          Alignment.center)),
                                            ),
                                          ),
                                          Text(
                                            '(ทุกเครือข่าย)',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                            ),
                                          )

                                          //SizedBox(height: 20),
                                        ],
                                      )),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 0,
                                    height: 210,
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.only(top: 300),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'ผ่านเครือข่าย TrueMove H',
                                              style: GoogleFonts.kanit(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                          width: 150,
                                                          height: 70,
                                                          decoration:
                                                              BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                            image: AssetImage(
                                                                'images/truemove.png'),
                                                          ))),
                                                      GestureDetector(
                                                        onTap: () {
                                                          showGeneralDialog(
                                                              context: context,
                                                              barrierDismissible:
                                                                  true,
                                                              barrierLabel:
                                                                  MaterialLocalizations.of(
                                                                          context)
                                                                      .modalBarrierDismissLabel,
                                                              barrierColor: Colors
                                                                  .transparent,
                                                              transitionDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          200),
                                                              pageBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Animation
                                                                          frist,
                                                                      Animation
                                                                          second) {
                                                                return Scaffold(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black38,
                                                                  body: Stack(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        width:
                                                                            MediaQuery.of(context).size.width -
                                                                                0,
                                                                        height:
                                                                            900,
                                                                        padding:
                                                                            EdgeInsets.all(20),
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                80),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                        ),
                                                                      ),
                                                                      const Positioned(
                                                                        top: 40,
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16,
                                                                        child:
                                                                            CircleAvatar(
                                                                          backgroundColor:
                                                                              Colors.blueAccent,
                                                                          radius:
                                                                              35,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: Container(
                                                          width: 150,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "images/10bath.png"),
                                                                  alignment:
                                                                      Alignment
                                                                          .center)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                          width: 150,
                                                          height: 70,
                                                          decoration:
                                                              BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                            image: AssetImage(
                                                                'images/truemove.png'),
                                                          ))),
                                                      GestureDetector(
                                                        onTap: () {
                                                          showGeneralDialog(
                                                              context: context,
                                                              barrierDismissible:
                                                                  true,
                                                              barrierLabel:
                                                                  MaterialLocalizations.of(
                                                                          context)
                                                                      .modalBarrierDismissLabel,
                                                              barrierColor: Colors
                                                                  .transparent,
                                                              transitionDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          200),
                                                              pageBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Animation
                                                                          frist,
                                                                      Animation
                                                                          second) {
                                                                return Scaffold(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black38,
                                                                  body: Stack(
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        width:
                                                                            MediaQuery.of(context).size.width -
                                                                                0,
                                                                        height:
                                                                            900,
                                                                        padding:
                                                                            EdgeInsets.all(20),
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                80),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                        ),
                                                                      ),
                                                                      const Positioned(
                                                                        top: 40,
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16,
                                                                        child:
                                                                            CircleAvatar(
                                                                          backgroundColor:
                                                                              Colors.blueAccent,
                                                                          radius:
                                                                              35,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: Container(
                                                          width: 150,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "images/100bath.png"),
                                                                  alignment:
                                                                      Alignment
                                                                          .center)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          '(ไม่รวมภาษีมูลค่าเพิ่ม)',
                                          style: GoogleFonts.kanit(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 50,
                                    left: 162,
                                    right: 162,
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      //padding: EdgeInsets.all(10),
                                      //margin: EdgeInsets.only(top: 50),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(25),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff0088C6),
                                              Color(0xff43CEF8)
                                            ]),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'images/icondonate.png'),
                                          scale: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffE6EFFE),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                      ),
                      child: Text(
                        "บริจาค",
                        style: GoogleFonts.kanit(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                          // fontStyle: FontStyle.italic,
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
    );
  }
}
