//@dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thanyarak/bodys/API/api_Ar.dart';
import 'package:thanyarak/bodys/API/api_Do.dart';
import 'package:thanyarak/bodys/API/api_main_article.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/detaildonate_pages.dart';
import 'package:thanyarak/bodys/login/menumember_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/donate_widget.dart';
import 'package:http/http.dart' as http;

class fav_page extends StatefulWidget {
  fav_page({Key key}) : super(key: key);

  @override
  _fav_pageState createState() => _fav_pageState();
}

double x;
String cid;
List delAR = [];

class _fav_pageState extends State<fav_page> {
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getDATA();
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      print(cid);
      futureData = fetchData();
      futureDataDo = fetchDataDo();
      delAR.clear();
    });
  }

  Future<List<apiAR>> futureData;
  Future<List<apiDO>> futureDataDo;
  Future<List<apiAR>> fetchData() async {
    var url = '${apiurl().urlapi}/favorite.php?userId=${cid}&group=AR';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      x = jsonResponse.length.toDouble();
      return jsonResponse.map((data) => new apiAR.fromJson(data)).toList();
    } else {
      print(response.statusCode);
    }
  }

  Future<List<apiDO>> fetchDataDo() async {
    var url = '${apiurl().urlapi}/favorite.php?userId=${cid}&group=DO';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      x = jsonResponse.length.toDouble();
      return jsonResponse.map((data) => new apiDO.fromJson(data)).toList();
    } else {
      print(response.statusCode);
    }
  }

  Future<void> delFavorite({String userid, cmsId}) async {
    var url = '${apiurl().urlapi}/favorite.php';
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "userId": "${userid}",
        "listCmsId": "${cmsId}",
      }),
    );
    if (response.statusCode == 200) {
      print("delFavorite Status API :${response.statusCode}");
      setState(() {
        futureData = fetchData();
        futureDataDo = fetchDataDo();
      });
    } else {
      print("delFavorite Status API :${response.statusCode}");
    }
    // print(response.body);
  }

  final double avatarRadius = 70.0;
  final double cameraRadius = 20.0;

  bool txt = true;
  Color bar1 = Colors.white;
  Color bar2 = Colors.transparent;
  Color font1 = Colors.blue;
  Color font2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;

    if (width <= 414) {
      _w = 2;
      _f = 1;
    }
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
                      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            //color: Colors.amber,
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  // color: Colors.amber,
                                  margin: EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  menumember_pages()));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.topLeft,
                                      )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: _f,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Container(
                                      height: 40,
                                      // color: Colors.red,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'ที่บันทึกไว้',
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.kanit(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Container(
                                    // color: Colors.amber,
                                    height: 40,
                                    width: 100,
                                    child: Container(
                                      //color: Colors.red,
                                      //margin: EdgeInsets.only(top: 35),
                                      // padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(width: 20),
                                          GestureDetector(
                                            onTap: () {
                                              String stringList =
                                                  delAR.join(",");

                                              delFavorite(
                                                  cmsId: stringList,
                                                  userid: cid);
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/bin.png'))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: Colors.amber,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(children: <Widget>[
                              Container(
                                height: 35,
                                padding: EdgeInsets.only(),
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Row(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              //bar1 == bar1 ? bar2 : bar1;
                                              delAR.clear();

                                              if (bar1 == Colors.white) {
                                              } else {
                                                bar1 == Colors.transparent
                                                    ? bar1 = Colors.white
                                                    : bar1 = Colors.transparent;

                                                font1 == Colors.white
                                                    ? font1 = Colors.blue
                                                    : font1 = Colors.white;

                                                bar2 == Colors.white
                                                    ? bar2 = Colors.transparent
                                                    : bar2 = Colors.white;
                                                font2 == Colors.blue
                                                    ? font2 = Colors.white
                                                    : font2 = Colors.blue;
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: bar1,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text('บทความ',
                                                  style: GoogleFonts.kanit(
                                                      color: font1)),
                                            ),
                                          ),
                                        )),
                                    Container(
                                      width: 1,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              delAR.clear();
                                              if (bar2 == Colors.white) {
                                              } else {
                                                bar1 == Colors.transparent
                                                    ? bar1 = Colors.white
                                                    : bar1 = Colors.transparent;

                                                font1 == Colors.white
                                                    ? font1 = Colors.blue
                                                    : font1 = Colors.white;

                                                bar2 == Colors.white
                                                    ? bar2 = Colors.transparent
                                                    : bar2 = Colors.white;
                                                font2 == Colors.blue
                                                    ? font2 = Colors.white
                                                    : font2 = Colors.blue;
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: bar2,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text('บริจาค',
                                                  style: GoogleFonts.kanit(
                                                      color: font2)),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 130),
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
                      padding: bar1 == Colors.white
                          ? EdgeInsets.only(top: 120, left: 15, right: 15)
                          : EdgeInsets.only(top: 120, left: 15, right: 15),
                      child: Column(
                        children: [bar1 == Colors.white ? article() : donate()],
                      ),
                    ),
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

  Container article() {
    return Container(
      //height: MediaQuery.of(context).size.height,

      // color: Colors.amber,
      child: FutureBuilder<List<apiAR>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<apiAR> data = snapshot.data;
            return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  delAR.add(data[index].cmsId);
                  return GestureDetector(
                    onTap: () => setState(() {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ArticleDetailsPage(
                                    urlget: '${data[index].cmsId}',
                                  )));
                      // print(
                      //     'https://truethanyarak.com/api/Ar_Detail.php?id=${data[index].id}');
                    }),
                    child: Container(
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
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(data[index].picturePath)),
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
                                  Text(data[index].subject,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.kanit(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0088C6))),
                                  SizedBox(height: 5),
                                  Text(data[index].title,
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
                                          // data[index]
                                          //     .createdate,
                                          DateFormat('dd/MM/').format(
                                                  data[index].createDate) +
                                              DateFormat('yyyy').format(
                                                data[index].createDate.add(
                                                      Duration(days: 198195),
                                                    ),
                                              ),
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
                                          NumberFormat.decimalPattern()
                                              .format(data[index].view),
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
                  );
                });
          } else if (snapshot.hasError) {
            return Text("");
          } else if (snapshot.hasData == false) {
            return Container();
          }
          // By default show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Container donate() {
    return Container(
      child: FutureBuilder<List<apiDO>>(
        future: futureDataDo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<apiDO> donateData = snapshot.data;

            return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: donateData.length,
                itemBuilder: (BuildContext context, int index) {
                  delAR.add(donateData[index].cmsId);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => detaildonate_pages(
                                    urlget: '${donateData[index].cmsId}',
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          // width: 380,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 8),
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 160,
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          donateData[index].picturePath)),
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
                                    padding: EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(donateData[index].subject,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff0088C6))),
                                        SizedBox(height: 5),
                                        Text(donateData[index].title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.kanit(
                                                fontSize: 14,
                                                color: Colors.black)),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                DateFormat('dd/MM/').format(
                                                        donateData[index]
                                                            .createDate) +
                                                    DateFormat('yyyy').format(
                                                      donateData[index]
                                                          .createDate
                                                          .add(
                                                            Duration(
                                                                days: 198195),
                                                          ),
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey,
                                                )),
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
                                              '10',
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
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData == false) {
            return Container();
          }
          // By default show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
