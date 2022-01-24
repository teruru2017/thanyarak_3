//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/article_page.dart';
import 'package:thanyarak/bodys/conditions_page.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/hitstoryCk_page.dart';
import 'package:thanyarak/bodys/hitstoryDetail.dart';
import 'package:thanyarak/bodys/login/setting_page.dart';
import 'package:thanyarak/bodys/main_page.dart';

import 'package:thanyarak/bodys/login/menumember_page.dart';
import 'package:thanyarak/bodys/member_page.dart';
import 'package:thanyarak/bodys/newtype_pages.dart';
import 'package:thanyarak/bodys/shop_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/show_title.dart';

import 'package:thanyarak/bodys/notification_page.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

String cid = '';

class _MenuPageState extends State<MenuPage> {
  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      print(cid);
    });
  }

  SessionManager ssr = SessionManager();

  @override
  void initState() {
    getDATA();
    super.initState();
  }

  bool txt = true;
  bool value = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int _w = 1, _f = 2;

    if (width <= 414) {
      _w = 2;
      _f = 1;
    }
    print(height * 0.15);
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

                    //เนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 40, left: 15, right: 15),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 15, right: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: _f,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 0),
                                            child: Container(
                                              height: 40,
                                              // color: Colors.red,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'เมนู',
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
                                            top: 0,
                                          ),
                                          child: Container(
                                            //color: Colors.amber,
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
                                                                  NotiPage()));
                                                    },
                                                    child: Container(
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/notimenu.png'))),
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                        child: Icon(
                                                      Icons.close_outlined,
                                                      size: 25,
                                                      color: Colors.white,
                                                    )),
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
                              SizedBox(height: 10),
                              cid == '' || cid == null ? login() : getlogin(),
                              SizedBox(height: 5),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15),
                                          child: Image.asset(
                                            'images/m_home.png',
                                            scale: 3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'หน้าแรก',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                Article_page()));
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15),
                                          child: Image.asset(
                                            'images/m_article.png',
                                            scale: 3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'บทความ',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                DonatePage()));
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15),
                                          child: Image.asset(
                                            'images/m_donate.png',
                                            scale: 3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'บริจาค',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => AboutPage()));
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15),
                                          child: Image.asset(
                                            'images/m_home.png',
                                            scale: 3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'เกี่ยวกับเรา',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                cid == '' || cid == null
                                                    ? MemderPage()
                                                    : menumember_pages()));
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15),
                                          child: Image.asset(
                                            'images/m_menber.png',
                                            scale: 3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'สมาชิก',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                ConditionsPage()));
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 15),
                                          child: Image.asset(
                                            'images/m_request.png',
                                            scale: 3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'ข้อกำหนดและเงื่อนไข',
                                            style: GoogleFonts.kanit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          )),
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

  Container login() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.25,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blue.shade100),
          color: Color(0xff2CB6E3),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: height * 0.13,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: ShapeDecoration(
                              //color: Colors.green,
                              shape: CircleBorder(),
                              image: DecorationImage(
                                image: AssetImage('images/avatar.png'),
                              )),
                          // child: Image(
                          //   image: AssetImage('images/avatar.png'),
                          // ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'สวัสดีค่ะ',
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.kanit(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'กรุณาเข้าสู่ระบบ',
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cid == ''
                                      ? MemderPage()
                                      : setting_page()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Icon(
                                Icons.settings_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //
                          color: Colors.white),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: GoogleFonts.kanit(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => newtype_pages()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //
                          color: Color(0xff33BDEC)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'ลงทะเบียน',
                          style: GoogleFonts.kanit(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Container getlogin() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.36,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blue.shade100),
          color: Color(0xff2CB6E3),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: height * 0.13,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: ShapeDecoration(
                              //color: Colors.green,
                              shape: CircleBorder(),
                              image: DecorationImage(
                                image: AssetImage(cid == '' || cid == null
                                    ? 'images/avatar.png'
                                    : 'images/loginuser.png'),
                              )),
                          // child: Image(
                          //   image: AssetImage('images/avatar.png'),
                          // ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'สวัสดีครับ',
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.kanit(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Jonathan Wicktoria',
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cid == ''
                                      ? MemderPage()
                                      : setting_page()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Icon(
                                Icons.settings_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    ssr.setID('');
                  });
                  //Navigator.pop(context);
                  // Navigator.pop(context,
                  //     MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 0),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      //
                      color: Color(0xff33BDEC)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ออกจากระบบ',
                      style: GoogleFonts.kanit(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              cid == '' ? MemderPage() : hitstory_pages()));
                },
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image.asset(
                          'images/history.png',
                          scale: 1.5,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'ประวัติการตรวจ',
                          style: GoogleFonts.kanit(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              cid == '' ? MemderPage() : dating_page()));
                },
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image.asset(
                          'images/calandar2.png',
                          scale: 1.3,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'การนัดหมาย',
                          style: GoogleFonts.kanit(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
