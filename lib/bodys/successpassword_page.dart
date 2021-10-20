import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/main_page.dart';

class successpassword_pages extends StatefulWidget {
  successpassword_pages({Key? key}) : super(key: key);

  @override
  _successpassword_pagesState createState() => _successpassword_pagesState();
}

class _successpassword_pagesState extends State<successpassword_pages> {
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
                      image: AssetImage("assets/images/success.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/successbg.png"),
                            alignment: Alignment.center)),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            scale: 1.5,
                            image:
                                AssetImage("assets/images/checkpassword.png"),
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
