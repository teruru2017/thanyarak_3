import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class detaildonate_pages extends StatefulWidget {
  detaildonate_pages({Key? key}) : super(key: key);

  @override
  _detaildonate_pagesState createState() => _detaildonate_pagesState();
}

class _detaildonate_pagesState extends State<detaildonate_pages> {
  int _selectedchoice = 0;
  int choice = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/header2.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
              child: Column(
                children: [
                  Container(
                    height: 110,
                    //width: 400,
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment(-0.2, 0),
                            child: Text('รายละเอียดการบริจาค',
                                style: GoogleFonts.kanit(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ))),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    scale: 1.3,
                                    image: AssetImage("images/back01.png"),
                                    alignment: Alignment(-0.85, 0))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 700,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      scale: 1.3,
                      image: AssetImage('images/member1.png'),
                      alignment: Alignment.center,
                    )),
                  ),
                  SizedBox(height: 20),
                  Align(
                    child: Text(
                      'บริษัท ฟิลิป เวน(ประเทศไทย) จำกัด ได้นำรายได้จากการจัดกิจกรรมต้ายภัยมะเร็งเต้านม',
                      style: GoogleFonts.kanit(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0088C6),
                      ),
                    ),
                    alignment: Alignment(-2, -1),
                  ),
                  SizedBox(height: 320),
                  GestureDetector(
                    onTap: () {
                      showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.transparent,
                          transitionDuration: Duration(milliseconds: 200),
                          pageBuilder: (BuildContext context, Animation frist,
                              Animation second) {
                            return Scaffold(
                              backgroundColor: Colors.black38,
                              body: Stack(
                                children: <Widget>[
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width - 0,
                                      height: 800,
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.only(top: 80),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const SizedBox(height: 50),
                                          const Text(
                                            'ข้อความทดสอบ 1',
                                          ),
                                          const SizedBox(height: 24),
                                          Align(
                                            alignment: Alignment.center,
                                            child: FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Confirm"),
                                            ),
                                          )
                                        ],
                                      )),
                                  const Positioned(
                                    top: 30,
                                    left: 16,
                                    right: 16,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blueAccent,
                                      radius: 50,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffE6EFFE),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                      ),
                      child: Text(
                        "บริจาค",
                        style: GoogleFonts.kanit(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                          // fontStyle: FontStyle.italic,
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
    );
  }
}
