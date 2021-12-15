//@dart=2.9
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/article_page.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/login/menumember_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/member_page.dart';
//import 'package:thanyarak/bodys/menber_page.dart';
import 'package:thanyarak/models/article_model.dart';
//import 'package:thanyarak/utility/my_navigator.dart';

class NavigagitonBar extends StatefulWidget {
  @override
  _NavigagitonBarState createState() => _NavigagitonBarState();
}

bool homeck = true;
bool articleck = false;
bool doneck = false;
bool detailck = false;
bool memberck = false;
String checklogin = '';

class _NavigagitonBarState extends State<NavigagitonBar> {
  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      checklogin = per.getString('id');
      print(checklogin);
    });
  }

  @override
  void initState() {
    getDATA();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: MainPage(),
                  ),
                );

                setState(() {
                  homeck = true;
                  articleck = false;
                  doneck = false;
                  detailck = false;
                  memberck = false;
                });
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: homeck == false
                            ? AssetImage("images/Btn_home.png")
                            : AssetImage("images/Btn_home_active.png")),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "หน้าหลัก",
                        style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: homeck == false
                                ? Colors.grey[400]
                                : Colors.blue[400]
                            // fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: Article_page()),
                );
                setState(() {
                  articleck = true;
                  homeck = false;
                  doneck = false;
                  detailck = false;
                  memberck = false;
                });
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: articleck == false
                            ? AssetImage("images/Btn_article.png")
                            : AssetImage("images/Btn_article_active.png")),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        'บทความ',
                        style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: articleck == false
                                ? Colors.grey[400]
                                : Colors.blue[400]
                            // fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: DonatePage(),
                  ),
                );
                setState(() {
                  doneck = true;
                  articleck = false;
                  homeck = false;
                  detailck = false;
                  memberck = false;
                });
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: doneck == false
                            ? AssetImage("images/Btn_donate.png")
                            : AssetImage("images/Btn_donate_active.png")),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        'บริจาค',
                        style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: doneck == false
                                ? Colors.grey[400]
                                : Colors.blue[400]
                            // fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: AboutPage(),
                  ),
                );
                setState(() {
                  detailck = true;
                  doneck = false;
                  articleck = false;
                  homeck = false;
                  memberck = false;
                });
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: detailck == false
                            ? AssetImage("images/TYR-2.png")
                            : AssetImage("images/TYR-10.png")),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        'เกี่ยวกับเรา',
                        style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: detailck == false
                                ? Colors.grey[400]
                                : Colors.blue[400]
                            // fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: checklogin == '' || checklogin == null
                          ? MemderPage()
                          : menumember_pages()),
                );
                setState(() {
                  memberck = true;
                  detailck = false;
                  doneck = false;
                  articleck = false;
                  homeck = false;
                });
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: memberck == false
                            ? AssetImage("images/Btn_member.png")
                            : AssetImage("images/Btn_member_active.png")),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        'สมาชิก',
                        style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: memberck == false
                                ? Colors.grey[400]
                                : Colors.blue[400]
                            // fontStyle: FontStyle.italic,
                            ),
                      ),
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
}
