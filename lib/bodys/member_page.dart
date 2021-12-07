import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/show_title.dart';

class MemderPage extends StatefulWidget {
  const MemderPage({Key? key}) : super(key: key);

  @override
  _MemderPageState createState() => _MemderPageState();
}

class _MemderPageState extends State<MemderPage> {
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
      body: Container(
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
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Row(
                      children: [
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
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                            // color: Colors.amber,
                            height: 40,
                            width: 100,
                            child: Container(
                              //color: Colors.red,
                              //margin: EdgeInsets.only(top: 35),
                              // padding: EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                ],
              ),
            ),

            //พื้นหลังเนื้อหา
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            // color: Colors.red,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 50, left: 50, right: 50),
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.center,
                                        scale: 1.5,
                                        image: AssetImage('images/lock01.png')),
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.grey.shade100,
                                          Colors.white,
                                        ]),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'เข้าสู่ระบบ',
                                    style: GoogleFonts.kanit(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                      'กรุณาเข้าสู่ระบบ เพื่อจัดการโปรไฟล์',
                                      style: GoogleFonts.kanit(
                                          fontSize: 18,
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     CupertinoPageRoute(
                        //         builder: (context) => otp_pages()));
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
                        child: Text(
                          "เข้าสู่ระบบ",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            color: Color(0xffFFFFFF),
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //เนื้อหา
          ],
        ),
      ),
      bottomNavigationBar: NavigagitonBar(),
    );
  }
}
