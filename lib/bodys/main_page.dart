// ignore_for_file: prefer_const_constructors
//@dart=2.9
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_appointments.dart';
import 'package:thanyarak/bodys/API/api_banner.dart';
import 'package:thanyarak/bodys/API/api_main_article.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/CarouselWithDotsPage.dart';
import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/alert_page.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/article_page.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/bodys/detailcheck.dart';
import 'package:thanyarak/bodys/hitstoryCk_page.dart';
import 'package:thanyarak/bodys/hitstoryDetail.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/mark_procedure.dart';
import 'package:thanyarak/bodys/member_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/shop_page.dart';
// import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/bodys/xray.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/show_circular.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:thanyarak/widgets/show_title_head.dart';
//import 'package:thanyarak/states/main_home.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

String cid = '';
String name;
var ii = new List<Appointments>();

void results() {
  SignInPage();
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
String Token, imgPro = '';
var jsonRes;
String apiStatus, hn, cklogin;
final CarouselController _controller = CarouselController();

class _MainPageState extends State<MainPage> {
  int i = 0;

  int x = 10000;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  int _current = 0;

  int _currentIndex = 0;
  double topWidgetHeight = 100;
  int _volume = 0;
  int counter = 0;
  double setbottom = 600;
  SharedPreferences prefs;
  bool isLoading = false;
  List<dynamic> banner = [];
  String tokendata = "";
  String cid, pid;
  File _img;

  @override
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    futureData = fetchData();
    articleData = artData();

    getDATA();
  }

  Appointments arm;
  Future<List<apibanner>> futureData;
  Future<List<apiarticle>> articleData;

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      imgPro = per.getString('img');
      if (imgPro == '' || imgPro == null) {
      } else {
        _img = File(imgPro.toString());
      }
      print('img : ${imgPro}');
      getToken();
    });
  }

  Future getToken() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
      if (cid != '' && cid != null) {
        getcid(cid);
      }
    });
  }

  Future<List<Appointments>> fetchAppointmentsData;
  Future<List<Appointments>> fetchAppointments(String pidSET) async {
    var url = '${apiurl().url}/patient/appointments/${pidSET}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // print(response.body);

      return jsonResponse
          .map((data) => new Appointments.fromJson(data))
          .toList();
    } else if (response.statusCode == 401) {
      print('Status Getcid : ${response.statusCode}');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getcid(String txtcid) async {
    SessionManager ssr = SessionManager();
    var url = '${apiurl().url}/patient/findByCitizenId/${txtcid}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      //List jsonResponse = json.decode(response.body);
      jsonRes = convert.jsonDecode(response.body);
      apiStatus = response.statusCode.toString();
      setState(() {
        name = jsonRes['name'] + '  ' + jsonRes['surname'];
        pid = jsonRes['pid'];
        ssr.setNAME('${name}');
        ssr.setPID('${pid}');
        print('pid : ${pid}');
        print('${name}');
        fetchAppointmentsData = fetchAppointments(pid);
      });
    } else {
      print(response.statusCode);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loadingPage()));
    }
  }

  Future<List<apibanner>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://truethanyarak.com/api/topgraphic.php'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((data) => new apibanner.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<apiarticle>> artData() async {
    final response =
        await http.get(Uri.parse('https://truethanyarak.com/api/Ar_List.php'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((data) => new apiarticle.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  //Widget createBannerWidget(String path) => Image.asset(path);
  @override
  Widget build(BuildContext context) {
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
                      //????????????????????????
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
                              //  color: Colors.amber,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                    width: 100,
                                    //color: Colors.amber,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.all(20),
                                      //color: Colors.red,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: _img == null || _img == ''
                                            ? Container(
                                                width: 30,
                                                height: 30,
                                                decoration: ShapeDecoration(
                                                  //color: Colors.green,
                                                  shape: CircleBorder(),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/avatar.png'),
                                                  ),
                                                ),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.file(
                                                  _img,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      height: 100,
                                      //color: Colors.blue,

                                      //margin: EdgeInsets.only(top: 10),
                                      padding: EdgeInsets.only(top: 20),
                                      child: Align(
                                        //alignment: Alignment.topLeft,
                                        child: Column(
                                          children: [
                                            // FutureBuilder(
                                            //   future: appointData,
                                            //   builder: (context, snapshot) {
                                            //     if (snapshot.hasData) {
                                            //       return Text(
                                            //           snapshot.data['status']);
                                            //     }
                                            //   },
                                            // ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                cid == '' || cid == null
                                                    ? '???????????????????????????'
                                                    : '??????????????????????????????',
                                                maxLines: 1,
                                                overflow: TextOverflow.visible,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                cid == '' || cid == null
                                                    ? '????????????????????????????????????????????????'
                                                    : name.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.visible,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 14,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 20, right: 15),
                                    child: Container(
                                      //color: Colors.amber,
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
                                                                : alert_page()));
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
                                                    visible:
                                                        cid == '' || cid == null
                                                            ? false
                                                            : true,
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

                      //?????????????????????????????????????????????
                      Padding(
                        padding: const EdgeInsets.only(top: 120),
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

                      //?????????????????????
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 120,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                              child: FutureBuilder<List<apibanner>>(
                                future: futureData,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<apibanner> bannerapi = snapshot.data;
                                    List<Widget> imageSliders = bannerapi
                                        .map((item) => Container(
                                              child: Container(
                                                margin: EdgeInsets.all(5.0),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30.0)),
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Image.network(
                                                            item.urlpath,
                                                            fit: BoxFit.cover,
                                                            width: 1000.0),
                                                        Positioned(
                                                          bottom: 0.0,
                                                          left: 0.0,
                                                          right: 0.0,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Color
                                                                      .fromARGB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  Color
                                                                      .fromARGB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0)
                                                                ],
                                                                begin: Alignment
                                                                    .bottomCenter,
                                                                end: Alignment
                                                                    .topCenter,
                                                              ),
                                                            ),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.0,
                                                                    horizontal:
                                                                        20.0),
                                                            child: Text(
                                                              '',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ))
                                        .toList();
                                    return Column(
                                      children: [
                                        CarouselSlider(
                                          items: imageSliders,
                                          carouselController: _controller,
                                          options: CarouselOptions(
                                              viewportFraction: 1,
                                              autoPlay: true,
                                              enlargeCenterPage: true,
                                              autoPlayInterval:
                                                  Duration(seconds: 15),
                                              aspectRatio: 2.0,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _currents = index;
                                                });
                                              }),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: bannerapi
                                              .asMap()
                                              .entries
                                              .map((entry) {
                                            return GestureDetector(
                                              onTap: () => _controller
                                                  .animateToPage(entry.key),
                                              child: Container(
                                                width: 9.0,
                                                height: 9.0,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 2.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        _currents == entry.key
                                                            ? Colors.pink[200]
                                                            : Colors.blue),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  // By default show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.elliptical(200, 60),
                                    bottomRight: Radius.elliptical(200, 60)),
                              ),
                              child: buildContent(),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: ShowHead(
                                      title: '??????????????????',
                                      pathIcon: 'images/article.png'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Article_page()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(right: 15),
                                    // color: Colors.amber,
                                    child: Text('???????????????????????????',
                                        style: GoogleFonts.kanit(
                                          color: Colors.black38,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              //height: MediaQuery.of(context).size.height,

                              // color: Colors.amber,
                              child: FutureBuilder<List<apiarticle>>(
                                future: articleData,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<apiarticle> articleDatas =
                                        snapshot.data;
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        child: new Row(
                                            children: articleDatas
                                                .map((item) => new Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      padding: EdgeInsets.only(
                                                        left: 15,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Container(
                                                          // width: MediaQuery.of(context).size.width,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  right: 10,
                                                                  left: 10,
                                                                  bottom: 20),
                                                          //color: Colors.red,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              GestureDetector(
                                                                onDoubleTap:
                                                                    () {
                                                                  setState(() {
                                                                    Navigator.push(
                                                                        context,
                                                                        CupertinoPageRoute(
                                                                            builder: (context) => ArticleDetailsPage(
                                                                                  urlget: 'https://truethanyarak.com/api/Ar_Detail.php?id=${item.id}',
                                                                                )));
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 330,
                                                                  decoration: BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: Colors
                                                                              .grey
                                                                              .withOpacity(0.2),
                                                                          spreadRadius:
                                                                              1,
                                                                          blurRadius:
                                                                              10,
                                                                          offset: Offset(
                                                                              0,
                                                                              8),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(40))),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            130,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          // color: Colors.white,
                                                                          image: DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: NetworkImage(item.urlpicpath)),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(30),
                                                                            topRight:
                                                                                Radius.circular(30),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          height:
                                                                              100,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(30),
                                                                              bottomRight: Radius.circular(30),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.only(left: 15, right: 15),
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(item.subject, maxLines: 1, style: GoogleFonts.kanit(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff0088C6))),
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
                                                                                      // item.createdate,
                                                                                      DateFormat('dd/MM/').format(item.createdate) +
                                                                                          DateFormat('yyyy').format(
                                                                                            item.createdate.add(
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
                                                                                      NumberFormat.decimalPattern().format(item.view),
                                                                                      // item.view.toString(),
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
                                                              ),
                                                              SizedBox(
                                                                  width: 20),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                                .toList()),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  // By default show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                            //card??????????????????
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   padding: EdgeInsets.only(
                            //     left: 15,
                            //   ),
                            //   child: SingleChildScrollView(
                            //     scrollDirection: Axis.horizontal,
                            //     child: Container(
                            //       // width: MediaQuery.of(context).size.width,
                            //       padding: EdgeInsets.only(
                            //           top: 10, right: 10, left: 10, bottom: 20),
                            //       //color: Colors.red,
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         children: [
                            //           Container(
                            //             width: 330,
                            //             decoration: BoxDecoration(
                            //                 boxShadow: [
                            //                   BoxShadow(
                            //                     color:
                            //                         Colors.grey.withOpacity(0.2),
                            //                     spreadRadius: 1,
                            //                     blurRadius: 10,
                            //                     offset: Offset(0, 8),
                            //                   )
                            //                 ],
                            //                 borderRadius: BorderRadius.all(
                            //                     Radius.circular(40))),
                            //             child: Column(
                            //               children: [
                            //                 Container(
                            //                   width: MediaQuery.of(context)
                            //                       .size
                            //                       .width,
                            //                   height: 130,
                            //                   decoration: BoxDecoration(
                            //                     // color: Colors.white,
                            //                     image: DecorationImage(
                            //                         fit: BoxFit.cover,
                            //                         image: AssetImage(
                            //                             'images/1150.png')),
                            //                     borderRadius: BorderRadius.only(
                            //                       topLeft: Radius.circular(30),
                            //                       topRight: Radius.circular(30),
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                     width: MediaQuery.of(context)
                            //                         .size
                            //                         .width,
                            //                     height: 100,
                            //                     decoration: BoxDecoration(
                            //                       color: Colors.white,
                            //                       borderRadius: BorderRadius.only(
                            //                         bottomLeft:
                            //                             Radius.circular(30),
                            //                         bottomRight:
                            //                             Radius.circular(30),
                            //                       ),
                            //                     ),
                            //                     child: Container(
                            //                       padding: EdgeInsets.only(
                            //                           left: 15, right: 15),
                            //                       child: Column(
                            //                         crossAxisAlignment:
                            //                             CrossAxisAlignment.start,
                            //                         children: [
                            //                           Text(
                            //                               '?????????????????????????????????????????????????????????????????????????????????',
                            //                               style: GoogleFonts.kanit(
                            //                                   fontSize: 16,
                            //                                   fontWeight:
                            //                                       FontWeight.w500,
                            //                                   color: Color(
                            //                                       0xff0088C6))),
                            //                           Text(
                            //                               '??????????????? ??????????????????????????? ????????????????????????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????????????????????????????????????? ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????',
                            //                               maxLines: 2,
                            //                               overflow: TextOverflow
                            //                                   .ellipsis,
                            //                               style:
                            //                                   GoogleFonts.kanit(
                            //                                       fontSize: 14,
                            //                                       color: Colors
                            //                                           .black)),
                            //                           Row(
                            //                             mainAxisAlignment:
                            //                                 MainAxisAlignment
                            //                                     .start,
                            //                             children: [
                            //                               FaIcon(
                            //                                 FontAwesomeIcons
                            //                                     .solidClock,
                            //                                 size: 12,
                            //                                 color:
                            //                                     Color(0xff0088C6),
                            //                               ),
                            //                               SizedBox(
                            //                                 width: 5,
                            //                               ),
                            //                               Text(
                            //                                 "16-06-2564",
                            //                                 overflow: TextOverflow
                            //                                     .ellipsis,
                            //                                 style:
                            //                                     GoogleFonts.kanit(
                            //                                   fontSize: 12,
                            //                                   fontWeight:
                            //                                       FontWeight.w500,
                            //                                   color: Colors.grey,
                            //                                 ),
                            //                               ),
                            //                               SizedBox(
                            //                                 width: 10,
                            //                               ),
                            //                               FaIcon(
                            //                                 FontAwesomeIcons
                            //                                     .solidEye,
                            //                                 size: 12,
                            //                                 color:
                            //                                     Color(0xff0088C6),
                            //                               ),
                            //                               SizedBox(
                            //                                 width: 5,
                            //                               ),
                            //                               Text(
                            //                                 "50,000",
                            //                                 overflow: TextOverflow
                            //                                     .ellipsis,
                            //                                 style:
                            //                                     GoogleFonts.kanit(
                            //                                   fontSize: 12,
                            //                                   fontWeight:
                            //                                       FontWeight.w500,
                            //                                   color: Colors.grey,
                            //                                 ),
                            //                               ),
                            //                             ],
                            //                           ),
                            //                         ],
                            //                       ),
                            //                     )),
                            //               ],
                            //             ),
                            //           ),
                            //           SizedBox(width: 20),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 20),
                            const ShowHead(
                                title: '????????????????????????????????????????????????',
                                pathIcon: 'images/shop.png'),
                            buildAboutMe(),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigagitonBar(
          actionGet: 1,
        ),
      ),
      onWillPop: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                '??????????????????????????????',
                style: GoogleFonts.kanit(),
              ),
              content: Text(
                '??????????????????????????????????????????????????????????????????????????? ?????????????????????',
                style: GoogleFonts.kanit(),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: Text('??????????????????', style: GoogleFonts.kanit()),
                ),
                TextButton(
                  onPressed: () => setState(() {
                    SystemNavigator.pop();
                    exit(0);
                  }),
                  child: Text('????????????', style: GoogleFonts.kanit()),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Padding buildAboutMe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffE6EFFE),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Color(0XFFe6effe), Color(0XFFFFFFFF)]),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/tt.png'))),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowTitle(
                      title: '????????????????????????????????????',
                      textStyle: MyConstant().h3StyleWeigth(),
                    ),
                    ShowTitle(
                      title: '???????????????????????????????????????????????????',
                      textStyle: MyConstant().h3StyleWeigth(),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.transparent,
                        ),
                        child: Text(
                          "???????????????????????????",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            color: Colors.blue[600],
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContent() {
    return Container(
      // height: 300,
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage('images/main_body.png'), fit: BoxFit.fill),
          ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: ShowHead(
                      title: '??????????????????????????????', pathIcon: 'images/calendar.png')),
              cid == '' || cid == null
                  ? Visibility(
                      visible: false,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dating_page()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 15),
                          // color: Colors.amber,
                          child: Text('???????????????????????????',
                              style: GoogleFonts.kanit(
                                color: Colors.black38,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => dating_page()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 15),
                        // color: Colors.amber,
                        child: Text('???????????????????????????',
                            style: GoogleFonts.kanit(
                              color: Colors.black38,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
            ],
          ),
          cid == '' || cid == null
              ? buildNonAppointCard()
              : buildNonAppointCardAPI(),
          groupIcon(),
        ],
      ),
    );
  }

  Padding groupIcon() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [requirResult(), addAppointMent(), myNotification()],
      ),
    );
  }

  Column requirResult() {
    return Column(
      // child: GestureDetector(

      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => cid == '' || cid == null
                          ? MemderPage()
                          : hitstory_pages()));
            },
            child: Image.asset('images/list.png')),
        const SizedBox(
          height: 5,
        ),
        ShowTitle(
          title: '????????????????????????',
          textStyle: MyConstant().h4StyleBlack(),
        ),
      ],
    );
  }

  Column addAppointMent() {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              cid == '' || cid == null
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MemderPage()))
                  : setState(
                      () {
                        showGeneralDialog(
                            context: context,
                            barrierDismissible: false,
                            barrierLabel: MaterialLocalizations.of(context)
                                .modalBarrierDismissLabel,
                            barrierColor: Colors.transparent,
                            transitionDuration: Duration(milliseconds: 200),
                            pageBuilder: (BuildContext context, Animation frist,
                                    Animation second) =>
                                Addmark());
                      },
                    );
            },
            child: Image.asset('images/calenda.png')),
        const SizedBox(
          height: 5,
        ),
        ShowTitle(
          title: '?????????????????????????????????????????????',
          textStyle: MyConstant().h4StyleBlack(),
        ),
      ],
    );
  }

  Column myNotification() {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => cid == '' || cid == null
                          ? NotiPage()
                          : alert_page()));
            },
            child: Image.asset('images/noti.png')),
        const SizedBox(
          height: 5,
        ),
        ShowTitle(
          title: '????????????????????????????????????',
          textStyle: MyConstant().h4StyleBlack(),
        ),
      ],
    );
  }

  Padding buildNonAppointCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      width: 15, child: Image.asset('images/box_calenda.png')),
                ),
              ),
              title: ShowTitle(
                  title: '??????????????????????????????????????????????????????',
                  textStyle: GoogleFonts.kanit(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              subtitle: ShowTitle(
                  title: '????????????????????????????????? ???????????????????????????????????????????????????',
                  textStyle: GoogleFonts.kanit(
                      fontSize: 14, color: Color(0xffB7B7B7))),
              trailing: Column(
                children: [
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
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     CupertinoPageRoute(builder: (context) => SignInPage()));
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SignInPage()));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.symmetric(horizontal: 15),
                //width: 320,
                //padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffE6EFFE),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                ),
                child: Text(
                  "?????????????????????????????????",
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 16,
                    color: Color(0xffFFFFFF),
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget buildNonAppointCardAPI() {
    return FutureBuilder<List<Appointments>>(
      future: fetchAppointmentsData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Appointments> apps = snapshot.data;
          List<int> sect = [];
          for (var x = 0; x < apps.length; x++) {
            if (apps[x].status == null) {
              sect.add(x);
            }
          }
          if (sect.length <= 0) {
            return Container();
          } else {
            print(sect.reduce(min));
            int getSET = sect.reduce(min);
            final splitted = apps[getSET].datetime.split(' ');
            print(splitted[0]);
            final dateMM = splitted[0].split('-');
            print(splitted[1]);

            String strDAY =
                "${dateMM[2].toString()}-${dateMM[1].toString()}-${dateMM[0].toString()}";
            String strTIME = "${splitted[1]}";
            return Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Card(
                elevation: 3,
                margin: EdgeInsets.all(3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                              width: 15,
                              child: Image.asset('images/box_calenda.png')),
                        ),
                      ),
                      title: ShowTitle(
                          title: '',
                          textStyle: GoogleFonts.kanit(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      subtitle: ShowTitle(
                          title: '${strDAY} | ${strTIME}',
                          textStyle: GoogleFonts.kanit(
                              fontSize: 14, color: Color(0xffB7B7B7))),
                      trailing: Column(
                        children: [
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
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     CupertinoPageRoute(builder: (context) => SignInPage()));

                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => detailMark_page(
                                dateTimeGET: strTIME,
                                dateDAYGET: strDAY,
                                idGET: apps[getSET].id,
                                statusGET: apps[getSET].status,
                              ),
                            ));
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        //width: 320,
                        //padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xffE6EFFE),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                        ),
                        child: Text(
                          "????????????????????????????????????????????????????????????",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            color: Color(0xffFFFFFF),
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData == false) {
          return Container();
        }
        // By default show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Padding logincard() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      width: 15, child: Image.asset('images/box_calenda.png')),
                ),
              ),
              title: ShowTitle(
                  title: 'Mammogram Ultrasound',
                  textStyle: GoogleFonts.kanit(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              subtitle: ShowTitle(
                  title: '????????? | ????????????',
                  textStyle: GoogleFonts.kanit(
                      fontSize: 14, color: Color(0xffB7B7B7))),
              trailing: Column(
                children: [
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
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     CupertinoPageRoute(builder: (context) => SignInPage()));
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => detailMark_page()));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.symmetric(horizontal: 15),
                //width: 320,
                //padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffE6EFFE),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                ),
                child: Text(
                  "????????????????????????????????????????????????????????????",
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 16,
                    color: Color(0xffFFFFFF),
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _currents = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carousel with indicator controller demo')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currents = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgLists.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_currents == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
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

class Addmark extends StatefulWidget {
  Addmark({Key key}) : super(key: key);

  @override
  _AddmarkState createState() => _AddmarkState();
}

class _AddmarkState extends State<Addmark> {
  @override
  int getAction = 1;
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
        visible: true,
        child: Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.95,
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
                                          AssetImage('images/Calandar.png'))),
                              height: 80,
                              width: 80,
                            ),
                            Text(
                              "?????????????????????????????????????????????",
                              style: GoogleFonts.kanit(
                                  color: Color(0xff0088C6), fontSize: 20),
                            ),
                            Text(
                              "??????????????????????????????????????????????????????????????????????????????????????????",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "???????????????????????????????????????????????????????????? ?????????????????????????????????????????????",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "?????????????????????????????????????????????????????????????????????????????????????????????????????????",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 14),
                            ),
                            Text(
                              "02 411 5657",
                              style: GoogleFonts.kanit(
                                  color: Colors.black, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            )
                            //????????????
                            ,
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        getAction = 1;
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: getAction == 1
                                              ? Color(0xff0394fc)
                                              : Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '??????????????????????????????????????????',
                                          style: GoogleFonts.kanit(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: getAction == 1
                                                ? Color(0xff0088C6)
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        getAction = 2;
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: getAction == 2
                                              ? Color(0xff0394fc)
                                              : Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '??????????????????????????????????????????',
                                          style: GoogleFonts.kanit(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: getAction == 2
                                                ? Color(0xff0088C6)
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (getAction == 1) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                mark_procedure_page()));
                                  } else {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => xray_page()));
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
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
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '??????????????????',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    //
                                    color: Colors.white),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '??????????????????',
                                    style: GoogleFonts.kanit(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
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
        showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder:
                (BuildContext context, Animation frist, Animation second) =>
                    dating_page());
        return true;
      });
}
