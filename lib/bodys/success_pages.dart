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
  success_pages({Key? key}) : super(key: key);

  @override
  _success_pagesState createState() => _success_pagesState();
}

class _success_pagesState extends State<success_pages> {
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
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                scale: 1.5,
                                image: AssetImage("images/circle.png"),
                                alignment: Alignment(0, -0.55))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                scale: 1.5,
                                image: AssetImage("images/userdata.png"),
                                alignment: Alignment(0, -0.5))),
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
