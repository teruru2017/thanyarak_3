//@dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:thanyarak/bodys/API/api_donate_detail.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as developer;

import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:http/http.dart' as http;

bool page1 = false; //truemove&bank
bool success = false; //popupsuccess
bool page2 = false; // บริจาคแบบธนาคาร
bool page3 = false; //สรุปยอดบริจาค
bool page4 = false; //บริจาคแบบทรู 10
bool page5 = false; //บริจาคแบบทรู 100
bool page6 = false; //บริจาคแบบทรูระบุเงิน
bool page7 = false; //สรุปยอดบริจาคทรู 10 บาท
bool page8 = false; //สรุปยอดบริจาคทรู 100 บาท
bool page9 = false; //สรุปยอดบริจาคทรูระบุเงิน

class detaildonate_pages extends StatefulWidget {
  final String urlget;
  detaildonate_pages({Key key, this.urlget}) : super(key: key);

  @override
  _detaildonate_pagesState createState() => _detaildonate_pagesState();
}

class _detaildonate_pagesState extends State<detaildonate_pages> {
  Future<List<dndetail>> donateData() async {
    final response = await http.get(Uri.parse('${widget.urlget}'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((data) => new dndetail.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<dndetail>> futureData;
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    futureData = donateData();
  }

  int _selectedchoice = 0;
  int choice = 0;
  int _current = 0;

  final CarouselController _controller = CarouselController();

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
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.amber,
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  // color: Colors.amber,
                                  margin: EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1,
                                        image: AssetImage("images/back01.png"),
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
                                      //color: Colors.red,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'รายละเอียดการบริจาค',
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
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Container(
                                    // color: Colors.amber,
                                    height: 40,

                                    child: Container(
                                      //color: Colors.red,
                                      //margin: EdgeInsets.only(top: 35),
                                      // padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     CupertinoPageRoute(
                                              //         builder: (context) =>
                                              //             NotiPage()));
                                            },
                                            child: Container(
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/Share.png'))),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          GestureDetector(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     CupertinoPageRoute(
                                              //         builder: (context) =>
                                              //             MenuPage()));
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/fav.png'))),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 110, left: 15, right: 15, bottom: 20),
                      child: FutureBuilder<List<dndetail>>(
                        future: futureData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<dndetail> donatedetailData = snapshot.data;
                            return Column(
                              children: <Widget>[
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      //color: Colors.amber,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            donatedetailData[0].urlpicpath),
                                        alignment: Alignment.center,
                                      )),
                                ),
                                SizedBox(height: 20),
                                Align(
                                  child: Text(
                                    donatedetailData[0].subject,
                                    style: GoogleFonts.kanit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0088C6),
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidClock,
                                      size: 12,
                                      color: Color(0xff0088C6),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      DateFormat('dd/MM/').format(
                                              donatedetailData[0].createdate) +
                                          DateFormat('yyyy').format(
                                            donatedetailData[0].createdate.add(
                                                  Duration(days: 198195),
                                                ),
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidEye,
                                      size: 12,
                                      color: Color(0xff0088C6),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      NumberFormat.decimalPattern()
                                          .format(donatedetailData[0].view),
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('รายละเอียด',
                                      style: GoogleFonts.kanit(
                                        fontSize: 18,
                                      )),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Html(
                                      data:
                                          '<body>${donatedetailData[0].html}</body>',
                                      style: {
                                        // "h3": Style(
                                        //     maxLines: txt ? 10 : 5,
                                        //     backgroundColor: Color.fromARGB(
                                        //         0x50, 0xee, 0xee, 0xee),
                                        //     fontSize: FontSize.em(2)),
                                        "body": Style(
                                          fontSize: FontSize.em(1),
                                          fontFamily: 'kanit',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      },
                                    )),
                                Container(
                                  //color: Colors.green,
                                  margin: EdgeInsets.only(top: 40),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        print(page1);
                                        showGeneralDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            barrierLabel:
                                                MaterialLocalizations.of(
                                                        context)
                                                    .modalBarrierDismissLabel,
                                            barrierColor: Colors.transparent,
                                            transitionDuration:
                                                Duration(milliseconds: 200),
                                            pageBuilder: (BuildContext context,
                                                    Animation frist,
                                                    Animation second) =>
                                                CustomDialog());
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
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
                                        "บริจาค",
                                        style: GoogleFonts.kanit(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFFFFFF),
                                          // fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          // By default show a loading spinner.
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(
        actionGet: 3,
      ),
    );
  }
}

// extends State<detaildonate_pages

class CustomDialog extends StatefulWidget {
  CustomDialog({Key key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  // Widget build(BuildContext context) {
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page2,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Container(
              child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Container(
                    padding: EdgeInsets.only(top: 50, left: 15, right: 15),
                    // height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'ร่วมบริจาค',
                          textAlign: TextAlign.center,
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
                        SizedBox(height: 20),
                        //โอนผ่านธนาคาร
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            setState(
                              () {
                                //page1 = !page1;
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
                                        bankDialog());
                              },
                            );
                          },
                          child: Container(
                            width: 500,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/bank.png"),
                                    alignment: Alignment.center)),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ผ่านเครือข่าย TrueMove H',
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 150,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: AssetImage(
                                                    'images/truemove.png'),
                                              ))),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              setState(
                                                () {
                                                  showGeneralDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      barrierLabel:
                                                          MaterialLocalizations
                                                                  .of(context)
                                                              .modalBarrierDismissLabel,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      transitionDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  200),
                                                      pageBuilder: (BuildContext
                                                                  context,
                                                              Animation frist,
                                                              Animation
                                                                  second) =>
                                                          truemoney10());
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 120,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/10bath.png"),
                                                      alignment:
                                                          Alignment.center)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 150,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: AssetImage(
                                                    'images/truemove.png'),
                                              ))),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                              setState(
                                                () {
                                                  showGeneralDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      barrierLabel:
                                                          MaterialLocalizations
                                                                  .of(context)
                                                              .modalBarrierDismissLabel,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      transitionDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  200),
                                                      pageBuilder: (BuildContext
                                                                  context,
                                                              Animation frist,
                                                              Animation
                                                                  second) =>
                                                          truemoney100());
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 120,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/100bath.png"),
                                                      alignment:
                                                          Alignment.center)),
                                            ),
                                          ),
                                        ],
                                      ),
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

                        Container(
                          padding: EdgeInsets.all(20),
                          height: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 1.5,
                                  image: AssetImage("images/textmoney.png"),
                                  alignment: Alignment.center)),
                        ),
                        Image.asset(
                          'images/qrcode.png',
                          scale: 1,
                        ),

                        // Container(
                        //   height: MediaQuery.of(context).size.width * 0.5,
                        //   decoration: BoxDecoration(
                        //       color: Colors.red,
                        //       image: DecorationImage(
                        //           scale: 1,
                        //           image: AssetImage("images/qrcode.png"),
                        //           alignment: Alignment.center)),
                        // ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            setState(
                              () {
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
                                        truemoveall());
                              },
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 0,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    scale: 1.5,
                                    image: AssetImage("images/donate01.png"),
                                    alignment: Alignment.center)),
                          ),
                        ),
                        Text(
                          '(ทุกเครือข่าย)',
                          style: GoogleFonts.kanit(
                            fontSize: 16,
                          ),
                        ),

                        //SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          width: 70,
                          height: 70,

                          //padding: EdgeInsets.all(10),
                          //margin: EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                            image: DecorationImage(
                              image: AssetImage('images/icondonate.png'),
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          bottomNavigationBar: NavigagitonBar(actionGet: 3),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);

        return true;
      });
}

class bankDialog extends StatefulWidget {
  bankDialog({Key key}) : super(key: key);

  @override
  _bankDialogState createState() => _bankDialogState();
}

class _bankDialogState extends State<bankDialog> {
  File imageFile;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  int _h = 1;
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page2,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 0,
                    height: MediaQuery.of(context).size.height,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  )),
              //1150
              SingleChildScrollView(
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width - 0,
                        // height: MediaQuery.of(context).size.height * 1.2,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Column(children: <Widget>[
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 25),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(
                                        () {
                                          showGeneralDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              barrierLabel:
                                                  MaterialLocalizations.of(
                                                          context)
                                                      .modalBarrierDismissLabel,
                                              barrierColor: Colors.transparent,
                                              transitionDuration:
                                                  Duration(milliseconds: 200),
                                              pageBuilder:
                                                  (BuildContext context,
                                                          Animation frist,
                                                          Animation second) =>
                                                      CustomDialog());
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Colors.black54,
                                      size: 18,
                                    ),
                                  ),
                                ],
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
                              SizedBox(height: 15),
                              Container(
                                width: MediaQuery.of(context).size.width - 0,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('images/scb.png'),
                                  scale: 0.5,
                                )),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'ธนาคารไทยพาณิชย์',
                                  style: GoogleFonts.kanit(
                                    fontSize: 15.5,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'ชื่อบัญชี : มูลนิธิถันยรักษ์ในพระราชูประถัมภ์\nสมเด็จพระศรีนครินทราบรมราชชนนี\nเลขบัญชี : 016-2-66644-1',
                                  style: GoogleFonts.kanit(
                                    fontSize: 15.5,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),

                              //แนบสลิป
                              Container(
                                child: imageFile != null
                                    ? Container(
                                        //_h = 2,
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: FileImage(imageFile)),
                                        ),
                                      )
                                    : Container(
                                        decoration:
                                            BoxDecoration(color: Colors.amber),
                                      ),
                              ),

                              SizedBox(height: 20),
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
                              SizedBox(height: 10),
                              FormBuilderTextField(
                                name: 'objective',
                                obscureText: true,
                                style: GoogleFonts.kanit(),
                                decoration: InputDecoration(
                                    labelText: 'วัตถุประสงค์',
                                    border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(10))),
                                    fillColor: Color(0xfff3f3f4),
                                    filled: false),
                              ),
                              SizedBox(height: 15),
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
                              SizedBox(height: 10),
                              FormBuilderTextField(
                                name: 'addresscheck',
                                obscureText: true,
                                style: GoogleFonts.kanit(),
                                decoration: InputDecoration(
                                    labelText: 'ที่อยู่',
                                    border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(10))),
                                    fillColor: Color(0xfff3f3f4),
                                    filled: false),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  chooseImage(ImageSource.gallery);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xffffffff),
                                          Color(0xffffffff)
                                        ]),
                                    border: Border.all(
                                        color: Colors.blueAccent.shade100),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/check.png'),
                                        scale: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              //รายละเอียดการบริจาค
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(
                                    () {
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
                                              detailbankDialog());
                                    },
                                  );
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
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('images/donate02.png'),
                                        scale: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                      Positioned(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                width: 70,
                                height: 70,

                                //padding: EdgeInsets.all(10),
                                //margin: EdgeInsets.only(top: 50),
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
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
                                    image: AssetImage('images/icondonate.png'),
                                    scale: 1.5,
                                  ),
                                ),
                              ),
                              Text(
                                'ร่วมบริจาค',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff0088C6),
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
            ],
          ),
          bottomNavigationBar: NavigagitonBar(
            actionGet: 3,
          ),
        ),
      ),
      onWillPop: () async {
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
                    CustomDialog());
        return true;
      });
}

class successDialog extends StatefulWidget {
  successDialog({Key key}) : super(key: key);

  @override
  _successDialogState createState() => _successDialogState();
}

class _successDialogState extends State<successDialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
          visible: !success,
          child: Scaffold(
              backgroundColor: Colors.black38,
              body: SingleChildScrollView(
                  child: Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  //height: 400,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(
                    top: 180,
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/success01.png'))),
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
                    //เสร็จสิ้น
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                          // showGeneralDialog(
                          //     context: context,
                          //     barrierDismissible: false,
                          //     barrierLabel: MaterialLocalizations.of(context)
                          //         .modalBarrierDismissLabel,
                          //     barrierColor: Colors.transparent,
                          //     transitionDuration: Duration(milliseconds: 200),
                          //     pageBuilder: (BuildContext context,
                          //             Animation frist, Animation second) =>
                          //         detaildonate_pages());
                          // Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //         builder: (context) => detaildonate_pages()));
                        });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffE6EFFE),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
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
                          )),
                    ),
                  ]),
                ),
              ])))),
      onWillPop: () async {
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
                    detaildonate_pages());
        return true;
      });
}

class detailbankDialog extends StatefulWidget {
  detailbankDialog({Key key}) : super(key: key);

  @override
  _detailbankDialogState createState() => _detailbankDialogState();
}

class _detailbankDialogState extends State<detailbankDialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page3,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 130),
                child: Container(
                  // width: MediaQuery.of(context).size.width - 0,
                  height: MediaQuery.of(context).size.height,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                )),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(children: [
                      Container(
                        //width: MediaQuery.of(context).size.width - 0,

                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 130),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: <
                                Widget>[
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 25),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(
                                    () {
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
                                              bankDialog());
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black54,
                                  size: 18,
                                ),
                              ),
                            ],
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
                            alignment: Alignment(0.35, 0),
                            child: Text(
                              'ชื่อบัญชี : มูลนิธิถันยรักษ์ในพระราชูประถัมภ์\nสมเด็จพระศรีนครินทราบรมราชชนนี\nเลขบัญชี : 016-2-66644-1',
                              style: GoogleFonts.kanit(
                                fontSize: 15.5,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.62, 0),
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
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(
                                () {
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
                                          successDialog());
                                },
                              );
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
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 95),
                                width: 70,
                                height: 70,

                                //padding: EdgeInsets.all(10),
                                //margin: EdgeInsets.only(top: 50),
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
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
                                    image: AssetImage('images/icondonate.png'),
                                    scale: 1.5,
                                  ),
                                ),
                              ),
                              Text(
                                'สรุปการบริจาค',
                                style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff0088C6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ]),
          bottomNavigationBar: NavigagitonBar(actionGet: 3),
        ),
      ),
      onWillPop: () async {
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
                    bankDialog());
        return true;
      });
}

class truemoney10 extends StatefulWidget {
  truemoney10({Key key}) : super(key: key);

  @override
  _truemoney10State createState() => _truemoney10State();
}

class _truemoney10State extends State<truemoney10> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page5,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 0,
                    height: MediaQuery.of(context).size.height,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  )),
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 0,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 100),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: <
                                Widget>[
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 25),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(
                                    () {
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
                                              CustomDialog());
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black54,
                                  size: 18,
                                ),
                              ),
                            ],
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
                          SizedBox(height: 15),
                          Container(
                            width: MediaQuery.of(context).size.width - 0,
                            height: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('images/truemoveh.png'),
                              scale: 0.5,
                            )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'บริจาคผ่านเครือข่าย TrueMove H',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              //image picker
                              ),
                          SizedBox(height: 20),
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
                          SizedBox(height: 10),
                          FormBuilderTextField(
                            name: 'objective',
                            obscureText: true,
                            style: GoogleFonts.kanit(),
                            decoration: InputDecoration(
                                labelText: 'วัตถุประสงค์',
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(10))),
                                fillColor: Color(0xfff3f3f4),
                                filled: false),
                          ),
                          SizedBox(height: 15),
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
                          SizedBox(height: 10),
                          FormBuilderTextField(
                            name: 'addresscheck',
                            obscureText: true,
                            style: GoogleFonts.kanit(),
                            decoration: InputDecoration(
                                labelText: 'ที่อยู่',
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(10))),
                                fillColor: Color(0xfff3f3f4),
                                filled: false),
                          ),
                          SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(
                                () {
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
                                          detailtrue10Dialog());
                                },
                              );
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
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 65),
                              width: 70,
                              height: 70,

                              //padding: EdgeInsets.all(10),
                              //margin: EdgeInsets.only(top: 50),
                              decoration: BoxDecoration(
                                // color: Colors.amber,
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
                                  image: AssetImage('images/icondonate.png'),
                                  scale: 1.5,
                                ),
                              ),
                            ),
                            Text(
                              'ร่วมบริจาค',
                              style: GoogleFonts.kanit(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0088C6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: NavigagitonBar(actionGet: 3),
        ),
      ),
      onWillPop: () async {
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
                    CustomDialog());
        return true;
      });
}

class truemoney100 extends StatefulWidget {
  truemoney100({Key key}) : super(key: key);

  @override
  _truemoney100State createState() => _truemoney100State();
}

class _truemoney100State extends State<truemoney100> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page5,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 0,
                    height: MediaQuery.of(context).size.height,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  )),
              SingleChildScrollView(
                  child: Stack(
                children: [
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 0,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 25),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(
                                      () {
                                        showGeneralDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            barrierLabel:
                                                MaterialLocalizations.of(
                                                        context)
                                                    .modalBarrierDismissLabel,
                                            barrierColor: Colors.transparent,
                                            transitionDuration:
                                                Duration(milliseconds: 200),
                                            pageBuilder: (BuildContext context,
                                                    Animation frist,
                                                    Animation second) =>
                                                CustomDialog());
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.black54,
                                    size: 18,
                                  ),
                                ),
                              ],
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
                            SizedBox(height: 15),
                            Container(
                              width: MediaQuery.of(context).size.width - 0,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('images/truemoveh.png'),
                                scale: 0.5,
                              )),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'บริจาคผ่านเครือข่าย TrueMove H',
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                                //image picker
                                ),
                            SizedBox(height: 20),
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
                            SizedBox(height: 10),
                            FormBuilderTextField(
                              name: 'objective',
                              obscureText: true,
                              style: GoogleFonts.kanit(),
                              decoration: InputDecoration(
                                  labelText: 'วัตถุประสงค์',
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(10))),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: false),
                            ),
                            SizedBox(height: 15),
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
                            SizedBox(height: 10),
                            FormBuilderTextField(
                              name: 'addresscheck',
                              obscureText: true,
                              style: GoogleFonts.kanit(),
                              decoration: InputDecoration(
                                  labelText: 'ที่อยู่',
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(10))),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: false),
                            ),
                            SizedBox(height: 25),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                setState(
                                  () {
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
                                            detailtrue100Dialog());
                                  },
                                );
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
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 65),
                            width: 70,
                            height: 70,

                            //padding: EdgeInsets.all(10),
                            //margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                              // color: Colors.amber,
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
                                image: AssetImage('images/icondonate.png'),
                                scale: 1.5,
                              ),
                            ),
                          ),
                          Text(
                            'ร่วมบริจาค',
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0088C6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          bottomNavigationBar: NavigagitonBar(actionGet: 3),
        ),
      ),
      onWillPop: () async {
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
                    CustomDialog());
        return true;
      });
}

class detailtrue10Dialog extends StatefulWidget {
  detailtrue10Dialog({Key key}) : super(key: key);

  @override
  _detailtrue10DialogState createState() => _detailtrue10DialogState();
}

class _detailtrue10DialogState extends State<detailtrue10Dialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page7,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 0,
                    height: MediaQuery.of(context).size.height,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  )),
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      child: Container(
                        //width: MediaQuery.of(context).size.width - 0,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 200),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: <
                                Widget>[
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 25),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(
                                    () {
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
                                              truemoney10());
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black54,
                                  size: 18,
                                ),
                              ),
                            ],
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
                                'บริจาคผ่านเครือข่าย TrueMoveH',
                                style: GoogleFonts.kanit(
                                  fontSize: 15.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment(-0.62, 0),
                            child: Text(
                              '10 บาท',
                              style: GoogleFonts.kanit(
                                fontSize: 15.5,
                                color: Color(0xff0088C6),
                              ),
                            ),
                          ),
                          Container(
                              //image picker
                              ),
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(
                                () {
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
                                          successDialog());
                                },
                              );
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
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 165),
                              width: 70,
                              height: 70,

                              //padding: EdgeInsets.all(10),
                              //margin: EdgeInsets.only(top: 50),
                              decoration: BoxDecoration(
                                // color: Colors.amber,
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
                                  image: AssetImage('images/icondonate.png'),
                                  scale: 1.5,
                                ),
                              ),
                            ),
                            Text(
                              'สรุปการบริจาค',
                              style: GoogleFonts.kanit(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0088C6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: NavigagitonBar(actionGet: 3),
        ),
      ),
      onWillPop: () async {
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
                    truemoney10());
        return true;
      });
}

class detailtrue100Dialog extends StatefulWidget {
  detailtrue100Dialog({Key key}) : super(key: key);

  @override
  _detailtrue100DialogState createState() => _detailtrue100DialogState();
}

class _detailtrue100DialogState extends State<detailtrue100Dialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page8,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 0,
                    height: MediaQuery.of(context).size.height,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  )),
              SingleChildScrollView(
                  child: Stack(
                children: [
                  Container(
                    child: Container(
                      // width: MediaQuery.of(context).size.width - 0,
                      // height: 550,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(top: 200),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 25),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(
                                      () {
                                        showGeneralDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            barrierLabel:
                                                MaterialLocalizations.of(
                                                        context)
                                                    .modalBarrierDismissLabel,
                                            barrierColor: Colors.transparent,
                                            transitionDuration:
                                                Duration(milliseconds: 200),
                                            pageBuilder: (BuildContext context,
                                                    Animation frist,
                                                    Animation second) =>
                                                truemoney100());
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.black54,
                                    size: 18,
                                  ),
                                ),
                              ],
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
                                  'บริจาคผ่านเครือข่าย TrueMoveH',
                                  style: GoogleFonts.kanit(
                                    fontSize: 15.5,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(height: 5),
                            Align(
                              alignment: Alignment(-0.62, 0),
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
                            SizedBox(height: 20),
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
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                setState(
                                  () {
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
                                            successDialog());
                                  },
                                );
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
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 165),
                            width: 70,
                            height: 70,

                            //padding: EdgeInsets.all(10),
                            //margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                              // color: Colors.amber,
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
                                image: AssetImage('images/icondonate.png'),
                                scale: 1.5,
                              ),
                            ),
                          ),
                          Text(
                            'สรุปการบริจาค',
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0088C6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          bottomNavigationBar: NavigagitonBar(actionGet: 3),
        ),
      ),
      onWillPop: () async {
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
                    truemoney100());
        return true;
      });
}

class truemoveall extends StatefulWidget {
  truemoveall({Key key}) : super(key: key);

  @override
  _truemoveallState createState() => _truemoveallState();
}

class _truemoveallState extends State<truemoveall> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page6,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 95),
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 0,
                    height: MediaQuery.of(context).size.height,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  )),
              SingleChildScrollView(
                  child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 0,
                    height: 570,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 95),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(mainAxisSize: MainAxisSize.min, children: <
                        Widget>[
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(
                                () {
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
                                          CustomDialog());
                                },
                              );
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black54,
                              size: 18,
                            ),
                          ),
                        ],
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
                      SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width - 0,
                        height: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('images/truemoveh.png'),
                          scale: 0.5,
                        )),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'บริจาคผ่านเครือข่าย TrueMove H',
                          style: GoogleFonts.kanit(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                          //image picker
                          ),
                      SizedBox(height: 20),
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
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'objective',
                        obscureText: true,
                        style: GoogleFonts.kanit(),
                        decoration: InputDecoration(
                            labelText: 'วัตถุประสงค์',
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(10))),
                            fillColor: Color(0xfff3f3f4),
                            filled: false),
                      ),
                      SizedBox(height: 15),
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
                      SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'addresscheck',
                        obscureText: true,
                        style: GoogleFonts.kanit(),
                        decoration: InputDecoration(
                            labelText: 'ที่อยู่',
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(10))),
                            fillColor: Color(0xfff3f3f4),
                            filled: false),
                      ),
                      SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          setState(
                            () {
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
                                          Animation frist, Animation second) =>
                                      detailtrueallDialog());
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffE6EFFE),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
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
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 65),
                            width: 70,
                            height: 70,

                            //padding: EdgeInsets.all(10),
                            //margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                              // color: Colors.amber,
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
                                image: AssetImage('images/icondonate.png'),
                                scale: 1.5,
                              ),
                            ),
                          ),
                          Text(
                            'ร่วมบริจาค',
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0088C6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          bottomNavigationBar: NavigagitonBar(actionGet: 3),
        ),
      ),
      onWillPop: () async {
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
                    CustomDialog());
        return true;
      });
}

class detailtrueallDialog extends StatefulWidget {
  detailtrueallDialog({Key key}) : super(key: key);

  @override
  _detailtrueallDialogState createState() => _detailtrueallDialogState();
}

class _detailtrueallDialogState extends State<detailtrueallDialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: !page9,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 0,
                    height: MediaQuery.of(context).size.height,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  )),
              SingleChildScrollView(
                  child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 0,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(top: 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(mainAxisSize: MainAxisSize.min, children: <
                        Widget>[
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              setState(
                                () {
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
                                          detailtrueallDialog());
                                },
                              );
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black54,
                              size: 18,
                            ),
                          ),
                        ],
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
                            'บริจาคผ่านเครือข่าย TrueMoveH',
                            style: GoogleFonts.kanit(
                              fontSize: 15.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment(-0.62, 0),
                        child: Text(
                          'จำนวนเงินที่ระบุ',
                          style: GoogleFonts.kanit(
                            fontSize: 15.5,
                            color: Color(0xff0088C6),
                          ),
                        ),
                      ),
                      Container(
                          //image picker
                          ),
                      SizedBox(height: 20),
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
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          setState(
                            () {
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
                                          Animation frist, Animation second) =>
                                      successDialog());
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffE6EFFE),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
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
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 165),
                            width: 70,
                            height: 70,

                            //padding: EdgeInsets.all(10),
                            //margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                              // color: Colors.amber,
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
                                image: AssetImage('images/icondonate.png'),
                                scale: 1.5,
                              ),
                            ),
                          ),
                          Text(
                            'สรุปการบริจาค',
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0088C6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          bottomNavigationBar: NavigagitonBar(actionGet: 3),
        ),
      ),
      onWillPop: () async {
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
                    CustomDialog());
        return true;
      });
}
