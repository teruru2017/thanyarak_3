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
  //ddddd
  final int actionGet;
  NavigagitonBar({Key key, this.actionGet}) : super(key: key);
  _NavigagitonBarState createState() => _NavigagitonBarState();
}

bool homeck = false;
bool articleck = false;
bool doneck = false;
bool detailck = false;
bool memberck = false;
String cid = '';

class _NavigagitonBarState extends State<NavigagitonBar> {
  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      print('cid: ${cid}');
    });
  }

  @override
  void initState() {
    getDATA();
    super.initState();
    if (widget.actionGet == 1) {
      print('page: home');
      homeck = true;
      articleck = false;
      doneck = false;
      detailck = false;
      memberck = false;
    } else if (widget.actionGet == 2) {
      homeck = false;
      articleck = true;
      doneck = false;
      detailck = false;
      memberck = false;

      print('page: article');
    } else if (widget.actionGet == 3) {
      homeck = false;
      articleck = false;
      doneck = true;
      detailck = false;
      memberck = false;
      print('page: doneck');
    } else if (widget.actionGet == 4) {
      homeck = false;
      articleck = false;
      doneck = false;
      detailck = true;
      memberck = false;
      print('page: detailck');
    } else if (widget.actionGet == 5) {
      homeck = false;
      articleck = false;
      doneck = false;
      detailck = false;
      memberck = true;
      print('page: memberck');
    } else {
      homeck = false;
      articleck = false;
      doneck = false;
      detailck = false;
      memberck = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
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

                setState(() {});
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
                setState(() {});
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
                setState(() {});
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
                      child: cid == '' || cid == null
                          ? MemderPage()
                          : menumember_pages()),
                );
                setState(() {});
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
