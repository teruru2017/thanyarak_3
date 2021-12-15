import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/models/donate_model.dart';
import 'package:thanyarak/models/mark_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:collection/collection.dart';

class articleWidget extends StatelessWidget {
  final List<article> Listarticle = article.imgLists();

  // String? id;
  articleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DonateWidget(context),
      ],
    );
  }

  Container _DonateWidget(context) {
    return Container(
      child: Column(
        children: Listarticle.map(
          (e) => GestureDetector(
            onTap: () {
              //ปุ่ม
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => ArticleDetailsPage()));
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 130,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 150,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage(e.img)),
                            color: Colors.amber,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      Expanded(
                        child: Container(
                          // padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              ),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(e.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0088C6))),
                              SizedBox(height: 5),
                              Text(e.contact,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.kanit(
                                      fontSize: 14, color: Colors.black)),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: FaIcon(
                                      FontAwesomeIcons.solidClock,
                                      size: 12,
                                      color: Color(0xff0088C6),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      e.date,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: FaIcon(
                                      FontAwesomeIcons.solidEye,
                                      size: 12,
                                      color: Color(0xff0088C6),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      e.view,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ).toList(),
      ),
    );
  }
}

void printOddEven(int val) {}
