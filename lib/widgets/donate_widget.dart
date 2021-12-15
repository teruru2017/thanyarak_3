import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/bodys/detaildonate_pages.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/models/donate_model.dart';
import 'package:thanyarak/models/mark_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:collection/collection.dart';

class DonateWidget extends StatelessWidget {
  final List<donate_m> ListDonate = donate_m.imgLists();

  // String? id;
  DonateWidget({Key? key}) : super(key: key);

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
        children: ListDonate.map(
          (e) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => detaildonate_pages()));
            },
            child: Column(
              children: [
                Container(
                  // width: 380,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 8),
                    )
                  ], borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(e.img)),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Container(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.name,
                                    maxLines: 2,
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
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidClock,
                                      size: 12,
                                      color: Color(0xff0088C6),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      e.date,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.solidEye,
                                      size: 12,
                                      color: Color(0xff0088C6),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      e.view,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
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
