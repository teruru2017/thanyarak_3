import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';

class successpassword_pages extends StatefulWidget {
  successpassword_pages({Key? key}) : super(key: key);

  @override
  _successpassword_pagesState createState() => _successpassword_pagesState();
}

class _successpassword_pagesState extends State<successpassword_pages> {
  final double topWidgetHeight = 800;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: <Widget>[
        Column(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/bg_menu.png"),
                    alignment: Alignment.topCenter),
              ),
              child: Column(children: [
                Container(
                  height: topWidgetHeight,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/successbg.png"),
                                alignment: Alignment.center)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Container(
                            child: Stack(children: [
                              Container(
                                padding: EdgeInsets.only(top: 160),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(60),
                                          decoration: BoxDecoration(
                                            color: Colors.pink,
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Color(0xff43CEF8),
                                                  Color(0xff43CEF8),
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 180),
                                    child: Container(
                                      padding: EdgeInsets.all(60),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              scale: 1.5,
                                              image: AssetImage(
                                                  "images/userlock.png"),
                                              alignment: Alignment.topCenter)),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        //color: Colors.amber,
                                        image: DecorationImage(
                                            scale: 1.3,
                                            image:
                                                AssetImage("images/back01.png"),
                                            alignment: Alignment.topLeft)),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                scale: 1.5,
                                image: AssetImage("images/checkpassword.png"),
                                alignment: Alignment.center)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ]))
        ])
      ]),
    ));
  }
}
