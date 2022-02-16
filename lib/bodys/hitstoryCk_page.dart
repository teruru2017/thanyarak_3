//@dart=2.9
import 'dart:convert';
//import 'dart:html';
import 'package:collection/collection.dart';
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
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_examinations.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/detailcheck.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/hitstoryDetail.dart';
import 'package:thanyarak/bodys/mark_procedure.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:json_helpers/json_helpers.dart';
//import 'package:group_button/group_button.dart';
import 'package:thanyarak/models/mark_model.dart';

import 'package:thanyarak/widgets/NavigationBar.dart';

import 'package:http/http.dart' as http;
import 'package:thanyarak/widgets/mark_widget.dart';
import 'package:thanyarak/bodys/xray.dart';
import 'dart:convert' as convert;

class hitstory_pages extends StatefulWidget {
  hitstory_pages({Key key}) : super(key: key);
  @override
  _hitstory_pages_pagesState createState() => _hitstory_pages_pagesState();
}

String nameHis, pid;
String Token;
int countMark = 1;
bool isCheckcked = false;
bool isCheckckedBT = true;
bool BT = false;
int _countCheckbox = 0;

List<bool> setChek = [];
List<int> setint = [];

final List<Marks> ListMarkLast = Marks.generateMarksLast();

class _hitstory_pages_pagesState extends State<hitstory_pages> {
  bool _valueCK = false;
  final CarouselController _controller = CarouselController();
  void initState() {
    getDATA();
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    setint.clear();
    setChek.clear();
    isCheckcked = false;
    isCheckckedBT = true;
    BT = false;
  }

  Future<List<Examinations>> futureData;
  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
      pid = per.getString('pid');
      futureData = fetchData(pid);
    });
  }

  Future<List<Examinations>> fetchData(String pidSET) async {
    var url = '${apiurl().url}/patient/examinations/${pidSET}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // print(response.body);

      return jsonResponse
          .map((data) => new Examinations.fromJson(data))
          .toList();
    } else {
      print(response.statusCode);
      // print(url);
    }
  }

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
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(top: 20, left: 0, right: 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        dating_page()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          scale: 1.3,
                                          image:
                                              AssetImage("images/back01.png"),
                                          alignment: Alignment.center,
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Container(
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'ประวัติการตรวจ',
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
                                  Expanded(
                                    flex: _w,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: dating_page()),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF43CEF8),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Wrap(
                                              spacing: 2,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              children: [
                                                Image.asset('images/calen.png',
                                                    scale: 2),
                                                Text(
                                                  'นัดหมาย',
                                                  style: GoogleFonts.kanit(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              if (isCheckckedBT == false) {
                                                BT = false;
                                              } else {
                                                if (_countCheckbox >= 1) {
                                                  BT = true;
                                                }
                                              }
                                              isCheckckedBT = !isCheckckedBT;
                                              isCheckcked = !isCheckcked;
                                            },
                                          );
                                        },
                                        child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Color(0xff69E6E7),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Wrap(
                                                spacing: 2,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.check_box_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  Text(
                                                    'เลือก',
                                                    style: GoogleFonts.kanit(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            )),
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
                            top: 90, left: 15, right: 15, bottom: 20),
                        child: Container(
                          child: FutureBuilder<List<Examinations>>(
                            future: futureData,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<Examinations> apps = snapshot.data;
                                setChek.add(false);
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: apps.length,
                                  itemBuilder: (context, i) {
                                    if (apps[i].examType == 'us') {
                                      nameHis = 'Ultrasound';
                                    } else if (apps[i].examType == 'mam') {
                                      nameHis = 'Mammogram';
                                    } else if (apps[i].examType == 'mam+us') {
                                      nameHis = 'Mammogram & Ultrasound';
                                    } else if (apps[i].examType == 'biopsy') {
                                      nameHis = 'หัตถการ';
                                    } else {
                                      nameHis = apps[i].examType;
                                    }

                                    return GestureDetector(
                                      onTap: () {
                                        print("ID : ${apps[i].id}");
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                hitstorydetail_page(
                                              idSETDATA: int.parse(apps[i].id),
                                              nameSETDATA: nameHis,
                                              timeSETDATA: DateFormat('dd/MM/')
                                                      .format(
                                                          apps[i].examDate) +
                                                  DateFormat('yyyy').format(
                                                    apps[i].examDate.add(
                                                          Duration(
                                                              days: 198195),
                                                        ),
                                                  ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 90,
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.1),
                                                spreadRadius: 1,
                                                blurRadius: 10,
                                                offset: Offset(0,
                                                    2) // changes position of shadow
                                                ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 20,
                                                  bottom: 15,
                                                  top: 15),
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                      Color(0xff0088C6),
                                                      Color(0xff43CEF8)
                                                    ]),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              child: Image.asset(
                                                  'images/history__outline.png',
                                                  scale: 2),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    right: 10,
                                                    bottom: 15,
                                                    top: 15),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Wrap(
                                                                spacing: 2,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${nameHis}',
                                                                    style: GoogleFonts
                                                                        .kanit(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Visibility(
                                                            visible:
                                                                isCheckckedBT,
                                                            child: IconButton(
                                                              onPressed: () {},
                                                              icon: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade50,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .navigate_next,
                                                                  color: Color(
                                                                      0xff0088C6),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Visibility(
                                                            visible:
                                                                isCheckcked,
                                                            child: Checkbox(
                                                              value: setChek[i],
                                                              onChanged:
                                                                  (value) {
                                                                setState(
                                                                  () {
                                                                    setChek[i] =
                                                                        value;
                                                                    if (value ==
                                                                        false) {
                                                                      setint.remove(
                                                                          int.parse(
                                                                              apps[i].id));
                                                                    } else {
                                                                      setint.add(
                                                                          int.parse(
                                                                              apps[i].id));
                                                                      _countCheckbox++;
                                                                    }
                                                                    print(
                                                                        "${setint.length}");
                                                                    if (setint
                                                                            .length >
                                                                        0) {
                                                                      BT = true;
                                                                    } else {
                                                                      BT =
                                                                          false;
                                                                    }
                                                                    print(
                                                                        setint);
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .access_time_filled,
                                                            size: 14,
                                                            color: Color(
                                                                0xff0088C6),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Flexible(
                                                            child: Container(
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  // '${apps[i].examDate}',
                                                                  DateFormat('dd/MM/').format(
                                                                          apps[i]
                                                                              .examDate) +
                                                                      DateFormat(
                                                                              'yyyy')
                                                                          .format(
                                                                        apps[i]
                                                                            .examDate
                                                                            .add(
                                                                              Duration(days: 198195),
                                                                            ),
                                                                      ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      GoogleFonts
                                                                          .kanit(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                            .grey[
                                                                        400],
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              } else if (snapshot.hasData == false) {
                                return Container();
                              }
                              return Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ),
                        // MarkWidget(
                        //   id: countMark == 1
                        //       ? 'all'
                        //       : countMark == 2
                        //           ? 'last'
                        //           : countMark == 3
                        //               ? 'succ'
                        //               : 'cancel',
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: BT,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.transparent,
                      child: GestureDetector(
                        //หน้ายิงยังผิด
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => detailcheck_page(
                                          list_id: setint,
                                        )));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
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
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigagitonBar(),
      ),
      onWillPop: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => dating_page()),
            (Route<dynamic> route) => false);
      },
    );
  }
}
