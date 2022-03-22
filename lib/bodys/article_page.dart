//@dart = 2.9
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_articleHl.dart';
import 'package:thanyarak/bodys/API/api_main_article.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/alert_page.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:intl/intl.dart' show DateFormat, Intl, NumberFormat;
import 'package:intl/date_symbol_data_local.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Article_page extends StatefulWidget {
  Article_page({Key key}) : super(key: key);
  @override
  _Article_pageState createState() => _Article_pageState();
}

double x;

Future<List<apiarticle>> fetchData() async {
  var url = '${apiurl().urlapi}/Ar_List.php';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    x = jsonResponse.length.toDouble();
    // print(x);

    return jsonResponse.map((data) => new apiarticle.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<Arhighlight>> arhighlight() async {
  var url = '${apiurl().urlapi}/article.php?highlight=true';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    x = jsonResponse.length.toDouble();
    // print(x);

    return jsonResponse.map((data) => new Arhighlight.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

final List<String> imgLists = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
int _currents = 0;
final CarouselController _controller = CarouselController();

String cid = '';

class _Article_pageState extends State<Article_page> {
  Future<List<apiarticle>> futureData;
  Future<List<Arhighlight>> ArhighlightData;

  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getDATA();
    futureData = fetchData();
    ArhighlightData = arhighlight();
  }

  bool notifiAction = false;
  Future<void> checknotification({String cmsId}) async {
    var url = '${apiurl().urlapi}/notification.php?userId=${cmsId}&unread=true';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      print("checknotification Status API :${response.statusCode}");

      var jsonResponse = json.decode(response.body);

      if (jsonResponse['unread'] == 0) {
        setState(() {
          notifiAction = false;
        });
      } else {
        setState(() {
          notifiAction = true;
        });
      }
    } else {
      print("checknotification Status API :${response.statusCode}");
    }
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      checknotification(cmsId: cid);
      // print(cid);
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;
    if (width <= 414) {
      _w = 2;
      _f = 1;
    }
    return WillPopScope(
      child: Scaffold(
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
                              // color: Colors.amber,
                              padding:
                                  EdgeInsets.only(top: 20, left: 15, right: 15),
                              child: Row(
                                children: [
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
                                            'บทความ',
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
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            cid == '' ||
                                                                    cid == null
                                                                ? NotiPage()
                                                                : alert_page(
                                                                    pageto:
                                                                        '/artclePage',
                                                                  )));
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/notimenu.png'))),
                                                  ),
                                                  Visibility(
                                                    visible: notifiAction,
                                                    child: Positioned(
                                                      left: 10,
                                                      top: 6,
                                                      child: Container(
                                                        height: 10,
                                                        width: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: HexColor(
                                                                  '#31BCEB')),
                                                          color: HexColor(
                                                              '#F291A3'),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(50),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            MenuPage()));
                                              },
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'images/menu.png'))),
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
                          ],
                        ),
                      ),

                      //พื้นหลังเนื้อหา
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
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
                        padding: const EdgeInsets.only(
                            top: 100, left: 15, right: 15, bottom: 10),
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    FutureBuilder<List<Arhighlight>>(
                                      future: ArhighlightData,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          List<Arhighlight> data =
                                              snapshot.data;
                                          List<Widget> imageSliderBanner = data
                                              .map((item) => Container(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(5.0),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30.0)),
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Container(
                                                                child: Column(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            130,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          // color: Colors.white,
                                                                          image: DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: NetworkImage(item.picturePath)),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(30),
                                                                            topRight:
                                                                                Radius.circular(30),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        height:
                                                                            100,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(30),
                                                                            bottomRight:
                                                                                Radius.circular(30),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.only(
                                                                              left: 15,
                                                                              right: 15),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(item.subject, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.kanit(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff0088C6))),
                                                                              Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.kanit(fontSize: 14, color: Colors.black)),
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
                                                                                    DateFormat('dd/MM/').format(item.createDate) +
                                                                                        DateFormat('yyyy').format(
                                                                                          item.createDate.add(
                                                                                            Duration(days: 198195),
                                                                                          ),
                                                                                        ),
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
                                                                                    '64',
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
                                                              )
                                                            ],
                                                          )),
                                                    ),
                                                  ))
                                              .toList();
                                          return Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                    offset: Offset(8, 0),
                                                  )
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            child: Column(
                                              children: [
                                                CarouselSlider(
                                                  items: imageSliderBanner,
                                                  carouselController:
                                                      _controller,
                                                  options: CarouselOptions(
                                                      height: 250,
                                                      viewportFraction: 1,
                                                      autoPlay: true,
                                                      enlargeCenterPage: true,
                                                      autoPlayInterval:
                                                          Duration(seconds: 15),
                                                      aspectRatio: 2.0,
                                                      onPageChanged:
                                                          (index, reason) {
                                                        setState(() {
                                                          _currents = index;
                                                        });
                                                      }),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: imageSliderBanner
                                                      .asMap()
                                                      .entries
                                                      .map((entry) {
                                                    return GestureDetector(
                                                      onTap: () => _controller
                                                          .animateToPage(
                                                              entry.key),
                                                      child: Container(
                                                        width: 9.0,
                                                        height: 9.0,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 5.0,
                                                                horizontal:
                                                                    2.0),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: _currents ==
                                                                    entry.key
                                                                ? Colors
                                                                    .pink[200]
                                                                : Colors.blue),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }
                                        // By default show a loading spinner.
                                        return CircularProgressIndicator();
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'บทความ',
                                style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            //articleWidget()
                            Container(
                              //height: MediaQuery.of(context).size.height,

                              // color: Colors.amber,
                              child: FutureBuilder<List<apiarticle>>(
                                future: futureData,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<apiarticle> data = snapshot.data;
                                    return ListView.separated(
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: 20,
                                          );
                                        },
                                        controller: ScrollController(),
                                        shrinkWrap: true,
                                        itemCount: data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () => setState(() {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          ArticleDetailsPage(
                                                            urlget:
                                                                '${data[index].id}',
                                                          )));
                                              // print(
                                              //     'https://truethanyarak.com/api/Ar_Detail.php?id=${data[index].id}');
                                            }),
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  left: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              height: 130,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: 150,
                                                    padding: EdgeInsets.all(20),
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                data[index]
                                                                    .urlpicpath)),
                                                        color: Colors.amber,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      // padding: EdgeInsets.only(left: 10),
                                                      decoration: BoxDecoration(
                                                          //color: Colors.red,
                                                          ),
                                                      padding: EdgeInsets.only(
                                                          left: 10, right: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              data[index]
                                                                  .subject,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts.kanit(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color(
                                                                      0xff0088C6))),
                                                          SizedBox(height: 5),
                                                          Text(
                                                              data[index].title,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .kanit(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black)),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .solidClock,
                                                                  size: 12,
                                                                  color: Color(
                                                                      0xff0088C6),
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
                                                                          data[index]
                                                                              .createdate) +
                                                                      DateFormat(
                                                                              'yyyy')
                                                                          .format(
                                                                        data[index]
                                                                            .createdate
                                                                            .add(
                                                                              Duration(days: 198195),
                                                                            ),
                                                                      ),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      GoogleFonts
                                                                          .kanit(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Flexible(
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .solidEye,
                                                                  size: 12,
                                                                  color: Color(
                                                                      0xff0088C6),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  NumberFormat
                                                                          .decimalPattern()
                                                                      .format(data[
                                                                              index]
                                                                          .view),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      GoogleFonts
                                                                          .kanit(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .grey,
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
                                    return Text("${snapshot.error}");
                                  }
                                  // By default show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigagitonBar(
          actionGet: 2,
        ),
      ),
      onWillPop: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/mainHome', (Route<dynamic> route) => false);
      },
    );
  }
}

final List<Widget> imageSliders = imgLists
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(0, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
