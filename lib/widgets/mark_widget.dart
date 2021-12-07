import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/models/mark_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:collection/collection.dart';

class MarkWidget extends StatelessWidget {
  final List<Marks> ListMarkAll = Marks.generateMarksAll();
  final List<Marks> ListMarkSucc = Marks.generateMarksSucc();
  final List<Marks> ListMarkCancel = Marks.generateMarksCancel();
  final List<Marks> ListMarkLast = Marks.generateMarksLast();
  String? id;
  MarkWidget({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(id);
    return id == "cancel"
        ? CancelWidget()
        : id == "all"
            ? AlllWidget()
            : id == "succ"
                ? SucclWidget(context)
                : id == "last"
                    ? LastWidget()
                    : Container();
  }

  Container CancelWidget() {
    return Container(
      child: Column(
        children: ListMarkCancel.map(
          (e) => GestureDetector(
            onTap: () {},
            child: Container(
              height: 100,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2) // changes position of shadow
                      ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: e.type == 'cancel'
                          ? Colors.red
                          : e.type == 'succ'
                              ? Colors.greenAccent[400]
                              : Color(0xff43CEF8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.date_range_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 10, bottom: 15, top: 15),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(e.name,
                                        style: GoogleFonts.kanit(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  size: 13,
                                  color: Colors.blue[400],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.date + ' | ' + e.time,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.kanit(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[400],
                                        ),
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
                  ),
                ],
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }

  Container AlllWidget() {
    return Container(
      child: Column(
        children: ListMarkAll.map(
          (e) => GestureDetector(
            onTap: () {},
            child: Container(
              height: 100,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2) // changes position of shadow
                      ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: e.type == 'cancel'
                          ? Colors.red
                          : e.type == 'succ'
                              ? Colors.greenAccent[400]
                              : Color(0xff43CEF8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.date_range_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 10, bottom: 15, top: 15),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(e.name,
                                        style: GoogleFonts.kanit(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  size: 13,
                                  color: Colors.blue[400],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.date + ' | ' + e.time,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.kanit(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[400],
                                        ),
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
                  ),
                ],
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }

  Container SucclWidget(BuildContext context) {
    return Container(
      child: Column(
        children: ListMarkSucc.map(
          (e) => GestureDetector(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => detailMark_page()));
            },
            child: Container(
              height: 100,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2) // changes position of shadow
                      ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: e.type == 'cancel'
                          ? Colors.red
                          : e.type == 'succ'
                              ? Colors.greenAccent[400]
                              : Color(0xff43CEF8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.date_range_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 10, bottom: 15, top: 15),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(e.name,
                                        style: GoogleFonts.kanit(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  size: 13,
                                  color: Colors.blue[400],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.date + ' | ' + e.time,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.kanit(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[400],
                                        ),
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
                  ),
                ],
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }

  Container LastWidget() {
    return Container(
      child: Column(
        children: ListMarkLast.map(
          (e) => GestureDetector(
            onTap: () {},
            child: Container(
              height: 100,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2) // changes position of shadow
                      ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: e.type == 'cancel'
                          ? Colors.red
                          : e.type == 'succ'
                              ? Colors.greenAccent[400]
                              : Color(0xff43CEF8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.date_range_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 10, bottom: 15, top: 15),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(e.name,
                                        style: GoogleFonts.kanit(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  size: 13,
                                  color: Colors.blue[400],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.date + ' | ' + e.time,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.kanit(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[400],
                                        ),
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
                  ),
                ],
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}

void printOddEven(int val) {}
