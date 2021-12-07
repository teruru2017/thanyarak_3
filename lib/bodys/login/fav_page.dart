import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';

class fav_page extends StatefulWidget {
  fav_page({Key? key}) : super(key: key);

  @override
  _fav_pageState createState() => _fav_pageState();
}

class _fav_pageState extends State<fav_page> {
  final double topWidgetHeight = 130.0;
  final double avatarRadius = 70.0;
  final double cameraRadius = 20.0;

  bool txt = true;
  Color bar1 = Colors.white;
  Color bar2 = Colors.transparent;
  Color font1 = Colors.blue;
  Color font2 = Colors.white;

  @override
  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: topWidgetHeight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                    //เนื้อหา
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 130, left: 40, right: 40),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height,
                    //   decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(40.0),
                    //       topRight: Radius.circular(40.0),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: NavigagitonBar(),
    );
  }
}
