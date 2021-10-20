import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/main_page.dart';

class success_pages extends StatefulWidget {
  success_pages({Key? key}) : super(key: key);

  @override
  _success_pagesState createState() => _success_pagesState();
}

class _success_pagesState extends State<success_pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 800,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/success.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
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
                            image: AssetImage("images/checkregis.png"),
                            alignment: Alignment.center)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => MainPage()));
                    },
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         CupertinoPageRoute(
                  //             builder: (context) => newtype_pages()));
                  //   },
                  //   icon: FaIcon(FontAwesomeIcons.chevronCircleLeft),
                  //   iconSize: 35,
                  //   color: Colors.white54,
                  //   padding: const EdgeInsets.all(25),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
