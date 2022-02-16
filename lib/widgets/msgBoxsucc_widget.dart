import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/models/mark_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:collection/collection.dart';

class MSGBoxsuccWidget extends StatelessWidget {
  String? title;
  String? detail;
  String? part;

  MSGBoxsuccWidget({Key? key, this.title, this.detail, this.part})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Visibility(
        visible: true,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 15),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/success01.png'))),
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              '${title}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.kanit(
                                  color: Colors.blue, fontSize: 18),
                            ),
                            Text(
                              '${detail}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    part.toString(),
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xffE6EFFE),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff0088C6),
                                        Color(0xff43CEF8)
                                      ]),
                                ),
                                child: Text(
                                  "ปิด",
                                  style: GoogleFonts.kanit(
                                    textStyle:
                                        Theme.of(context).textTheme.headline4,
                                    fontSize: 16,
                                    color: Color(0xffFFFFFF),
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);

        return true;
      },
    );
  }
}
