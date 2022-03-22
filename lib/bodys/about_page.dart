//@dart=2.9
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_about.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/alert_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/about_widget.dart';
import 'package:thanyarak/widgets/show_title.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

String cid = '';

double topWidgetHeight = 70;

class _AboutPageState extends State<AboutPage> {
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
      // print(cid);
      futureDataAbout = fetchData();
      checknotification(cmsId: cid);
    });
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

  Future<About> futureDataAbout;
  Future<About> fetchData() async {
    var url = '${apiurl().urlapi}/about.php';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return About.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
    }
  }

  List<String> pathImageAritcles = [
    'images/about_h.png',
  ];
  List<String> titleAritcles = [
    'ประวัติความเป็นมาของมูลนิธิถันยรักษ์ฯ',
  ];
  List<String> detailAritcles = [
    'มูลนิธิถันยรักษ์ ในพระราชูปถัมภ์สมเด็จพระศรีนครินทราบรมราชชนนีเป็นองค์กรการกุศล ลำดับที่ 271 ของกระทรวงการคลัง ได้ก่อตั้งขึ้นมาเมื่อวันที่ 9 พฤศจิกายน พ.ศ.2537 ด้วยพระมหากรุณาธิคุณของสมเด็จพระศรีนครินทราบรมราชชนนี ที่ทรงมีพระราชดำริช่วยเหลือหญิงไทยให้พ้นภัยจากมะเร็งเต้านม จึงได้พระราชทานเงินส่วนพระองค์ จำนวน 12 ล้านบาท เป็นทุนเริ่มแรก และพระราชทานชื่อมูลนิธิ “ถันยรักษ์” ทรงรับไว้ในพระราชูปถัมภ์ ทรงเป็นประธานกิตติมศักดิ์ และทรงแต่งตั้งสมเด็จพระเจ้าพี่นางเธอเจ้าฟ้ากัลยานิวัฒนา กรมหลวงนราธิวาสราชนครินทร์ เป็นประธานกรรมการมูลนิธิถันยรักษ์ฯ ซึ่งต่อมาทรงเป็นประธานกิตติมศักดิ์ และสมเด็จพระเทพรัตนราชสุดาฯ สยามบรมราชกุมารี ทรงดำรงตำแหน่งประธานกิตติมศักดิ์ตั้งแต่ปี พ.ศ. 2557 สืบมามูลนิธิถันยรักษ์ฯ ดำเนินการตามวัตถุประสงค์ เพื่อตรวจวินิจฉัยและคัดกรองโรคมะเร็งเต้านม โดยสมเด็จพระเจ้าพี่นางเธอ เจ้าฟ้ากัลยานิวัฒนา กรมหลวงนราธิวาสราชนครินทร์ ได้นำคณะกรรมการมูลนิธิถันยรักษ์ฯ มาปรึกษากับคณะกรรมการ คณะแพทยศาสตร์ศิริราชพยาบาล เมื่อพ.ศ. 2537 และได้มีมติจัดตั้งศูนย์ถันยรักษ์ ขึ้นที่โรงพยาบาลศิริราช เมื่อปี พ.ศ. 2538 ตลอด 20 ปีที่ผ่านมา ศูนย์ถันยรักษ์ได้รับความร่วมมืออย่างดียิ่ง จากคณะแพทยศาสตร์ศิริราชพยาบาล',
  ];
  List<String> dataAritcles = [
    '16-6-25564',
  ];
  List<String> viewAritcles = [
    'ผู้เข้าชม 123k',
  ];
  @override
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
                                            'เกี่ยวกับเรา',
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
                                                                        "/aboutPage",
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
                            top: 110, left: 15, right: 15, bottom: 20),
                        child: FutureBuilder<About>(
                            future: futureDataAbout,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                About Aboutdata = snapshot.data;
                                return Container(
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Html(
                                        data:
                                            '<body><h3>${Aboutdata.html}</body>',
                                        style: {
                                          "body": Style(
                                            fontFamily: 'kanit',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        },
                                      )),
                                );
                              } else if (snapshot.hasData == false) {
                                return Container();
                              }
                              return CircularProgressIndicator();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigagitonBar(
          actionGet: 4,
        ),
      ),
      onWillPop: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/mainHome', (Route<dynamic> route) => false);
      },
    );
  }
}
