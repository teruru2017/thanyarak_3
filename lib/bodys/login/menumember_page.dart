//@dart=2.9
import 'dart:convert';
//import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_findByCitizenId.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/alert_page.dart';
import 'package:thanyarak/bodys/conditions_page.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/login/editpassword_page.dart';
import 'package:thanyarak/bodys/login/editprofile_page.dart';
import 'package:thanyarak/bodys/login/estimate_page.dart';
import 'package:thanyarak/bodys/login/fav_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/login/setting_page.dart';
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/states/main_home.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class menumember_pages extends StatefulWidget {
  menumember_pages({Key key}) : super(key: key);

  @override
  _menumember_pagesState createState() => _menumember_pagesState();
}

String Token;

String cid;
SessionManager ssr = SessionManager();
var jsonRes;
String apiStatus, name;
File _img;

class _menumember_pagesState extends State<menumember_pages> {
  Future<FindByCitizenId> getcid(String txtcid, String tk) async {
    var url = '${apiurl().url}/patient/findByCitizenId/${txtcid}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${tk}',
    });
    if (response.statusCode == 200) {
      return FindByCitizenId.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    }
  }

  final double topWidgetHeight = 120.0;
  final double avatarRadius = 50.0;

  Future<FindByCitizenId> futureFindByCitizenId;

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      Token = per.getString('tokens');
      checknotification(cmsId: cid);
      futureFindByCitizenId = getcid(cid, Token);
      imgPro = per.getString('img');
      if (imgPro == '' || imgPro == null) {
      } else {
        _img = File(imgPro.toString());
      }
      print('img: ${imgPro}');
    });
  }

  bool notifiAction = false;
  Future<void> checknotification({String cmsId}) async {
    var url = '${apiurl().urlapi}/notification.php?userId=${cmsId}&unread=true';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      print("checknotification Status API :${response.statusCode}");

      var jsonResponse = json.decode(response.body);

      if (jsonResponse['unread'] == 0) {
        setState(() {
          notifiAction = false;
        });
      } else {
        setState(() {
          notifiAction = true;
        });
      }
    } else {
      print("checknotification Status API :${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    getDATA();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage("images/bg_menu.png"),
                              alignment: Alignment.topCenter),
                        ),
                        child: Column(children: [
                          Container(
                            height: topWidgetHeight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 40, left: 30, right: 30),
                                    child: Container(
                                      height: 40,
                                      // color: Colors.red,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'สมาชิก',
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
                                  padding: EdgeInsets.only(
                                      top: 40, left: 30, right: 30),
                                  child: Container(
                                    // color: Colors.amber,
                                    height: 40,
                                    width: 100,
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
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          cid == '' ||
                                                                  cid == null
                                                              ? NotiPage()
                                                              : alert_page(
                                                                  pageto:
                                                                      "/menuHome",
                                                                )));
                                            },
                                            child: Stack(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'images/notimenu.png'))),
                                                ),
                                                Visibility(
                                                  visible: notifiAction,
                                                  child: Positioned(
                                                    left: 10,
                                                    top: 6,
                                                    child: Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color: HexColor(
                                                                '#31BCEB')),
                                                        color:
                                                            HexColor('#F291A3'),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(50),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          MenuPage()));
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/menu.png'))),
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
                          Container(
                            height: MediaQuery.of(context).size.height,
                            color: Colors.transparent,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 60),
                                    child: FutureBuilder<FindByCitizenId>(
                                      future: futureFindByCitizenId,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data.name +
                                                '  ' +
                                                snapshot.data.surname,
                                            style: GoogleFonts.kanit(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500),
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text('${snapshot.error}');
                                        }

                                        return CircularProgressIndicator();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      padding: EdgeInsets.only(
                                          top: 20, left: 20, right: 20),
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        editprofile_page()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 0),
                                                    )
                                                  ]),
                                              height: 60,
                                              child: Row(children: <Widget>[
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/1.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                                Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'ตั้งค่าข้อมูลส่วนตัว',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/0.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                              ])),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        editpassword_page()));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  left: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  right: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  bottom: BorderSide(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 5),
                                                  )
                                                ]),
                                            height: 60,
                                            child: Row(children: <Widget>[
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/2.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                              Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'แก้ไขรหัสผ่าน',
                                                        style:
                                                            GoogleFonts.kanit(
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/0.png'),
                                                            scale: 1.5)),
                                                    // color: Colors.green,
                                                  )),
                                            ]),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        fav_page()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                    left: BorderSide(
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                    right: BorderSide(
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                    bottom: BorderSide(
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 5),
                                                    )
                                                  ]),
                                              height: 60,
                                              child: Row(children: <Widget>[
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/3.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                                Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'ที่บันทึกไว้',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/0.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                              ])),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        setting_page()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                    left: BorderSide(
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                    right: BorderSide(
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                    bottom: BorderSide(
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 5),
                                                    )
                                                  ]),
                                              height: 60,
                                              child: Row(children: <Widget>[
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/4.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                                Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'ตั้งค่า',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/0.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                              ])),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        ConditionsPage()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                    left: BorderSide(
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                    right: BorderSide(
                                                      color:
                                                          Colors.blue.shade50,
                                                    ),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 5),
                                                    )
                                                  ]),
                                              height: 60,
                                              child: Row(children: <Widget>[
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/5.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                                Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'ข้อกำหนดและเงื่อนไข',
                                                          style:
                                                              GoogleFonts.kanit(
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/0.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                              ])),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'ออกจากระบบ',
                                                    style: GoogleFonts.kanit(),
                                                  ),
                                                  content: Text(
                                                    'คุณต้องการที่จะออกจากระบบ หรือไม่',
                                                    style: GoogleFonts.kanit(),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              'Cancel'),
                                                      child:
                                                          const Text('ยกเลิก'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          setState(() {
                                                        ssr.setCID('');
                                                        ssr.setPassword('');
                                                        ssr.setIMG('');

                                                        //Navigator.pop(context);
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    MainPage()));
                                                      }),
                                                      child: Text('ตกลง',
                                                          style: GoogleFonts
                                                              .kanit()),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Colors.blue.shade50,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 5),
                                                    )
                                                  ]),
                                              height: 60,
                                              child: Row(children: <Widget>[
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/6.png'),
                                                              scale: 1.5)),
                                                      // color: Colors.green,
                                                    )),
                                                Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          'ออกจากระบบ',
                                                          style:
                                                              GoogleFonts.kanit(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .red),
                                                        ),
                                                      ),
                                                    )),
                                              ])),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]))
                  ],
                ),
                Positioned(
                  child: _img == null || _img == ''
                      ? CircleAvatar(
                          radius: avatarRadius,
                          backgroundImage: AssetImage('images/avatar.png'),
                        )
                      : CircleAvatar(
                          radius: avatarRadius,
                          backgroundImage: FileImage(_img),
                        ),
                  left: (MediaQuery.of(context).size.width / 2) - avatarRadius,
                  top: topWidgetHeight - avatarRadius,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigagitonBar(actionGet: 5),
      ),
      onWillPop: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: MainPage(),
          ),
        );
      },
    );
  }
}
