//@dart = 2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';

class success_pages extends StatefulWidget {
  success_pages({Key key}) : super(key: key);

  @override
  _success_pagesState createState() => _success_pagesState();
}

class _success_pagesState extends State<success_pages> {
  final double topWidgetHeight = 800;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/bg_menu.png"),
                alignment: Alignment.topCenter),
          ),
        ),
        Column(children: [
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                        image:
                                            AssetImage("images/userdata.png"),
                                        alignment: Alignment.topCenter)),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          scale: 1.5,
                          image: AssetImage("images/checkregis.png"),
                          alignment: Alignment.center)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/mainHome', (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ),
        ])
      ])),
      onWillPop: () {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/mainHome', (Route<dynamic> route) => false);
      },
    );
  }
}
