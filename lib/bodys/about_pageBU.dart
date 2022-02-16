//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    });
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
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              decoration: BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/imageabout.png')),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              //padding: EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'ประวัติความเป็นมาของมูลนิธิถันยรักษ์ฯ',
                                style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff0088C6),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              //padding: EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'มูลนิธิถันยรักษ์ ในพระราชูปถัมภ์สมเด็จพระศรีนครินทราบรมราชชนนีเป็นองค์กรการกุศล ลำดับที่ 271 ของกระทรวงการคลัง ได้ก่อตั้งขึ้นมาเมื่อวันที่ 9 พฤศจิกายน พ.ศ.2537 ด้วยพระมหากรุณาธิคุณของสมเด็จพระศรีนครินทราบรมราชชนนี ที่ทรงมีพระราชดำริช่วยเหลือหญิงไทยให้พ้นภัยจากมะเร็งเต้านม จึงได้พระราชทานเงินส่วนพระองค์ จำนวน 12 ล้านบาท เป็นทุนเริ่มแรก และพระราชทานชื่อมูลนิธิ “ถันยรักษ์” ทรงรับไว้ในพระราชูปถัมภ์ ทรงเป็นประธานกิตติมศักดิ์ และทรงแต่งตั้งสมเด็จพระเจ้าพี่นางเธอเจ้าฟ้ากัลยานิวัฒนา กรมหลวงนราธิวาสราชนครินทร์ เป็นประธานกรรมการมูลนิธิถันยรักษ์ฯ ซึ่งต่อมาทรงเป็นประธานกิตติมศักดิ์ และสมเด็จพระเทพรัตนราชสุดาฯ สยามบรมราชกุมารี ทรงดำรงตำแหน่งประธานกิตติมศักดิ์ตั้งแต่ปี พ.ศ. 2557 สืบมา',
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              //padding: EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'มูลนิธิถันยรักษ์ฯ ดำเนินการตามวัตถุประสงค์ เพื่อตรวจวินิจฉัยและคัดกรองโรคมะเร็งเต้านม โดยสมเด็จพระเจ้าพี่นางเธอ เจ้าฟ้ากัลยานิวัฒนา กรมหลวงนราธิวาสราชนครินทร์ ได้นำคณะกรรมการมูลนิธิถันยรักษ์ฯ มาปรึกษากับคณะกรรมการ คณะแพทยศาสตร์ศิริราชพยาบาล เมื่อพ.ศ. 2537 และได้มีมติจัดตั้งศูนย์ถันยรักษ์ ขึ้นที่โรงพยาบาลศิริราช เมื่อปี พ.ศ. 2538 ตลอด 20 ปีที่ผ่านมา ศูนย์ถันยรักษ์ได้รับความร่วมมืออย่างดียิ่ง จากคณะแพทยศาสตร์ศิริราชพยาบาล',
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              //padding: EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'คณะกรรมการมูลนิธิถันยรักษ์ฯ',
                                style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff0088C6),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width / 2,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'images/queen.png')),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      width: 170,

                                      //color: Colors.amber,
                                      child: Column(
                                        children: [
                                          Container(
                                            //padding: EdgeInsets.only(left: 10, right: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'สมเด็จพระกนิษฐาธิราชเจ้ากรมสมเด็จพระเทพรัตนราชสุดาเจ้าฟ้ามหาจักรีสิรินธร มหาวชิราลงกรณวรราชภักดี สิริกิจการิณีพีรยพัฒนรัฐสีมาคุณากรปิยชาติสยามบรมราชกุมารี',
                                              maxLines: 7,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            //padding: EdgeInsets.only(left: 10, right: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'ประธานกิตติมศักดิ์',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.kanit(
                                                fontSize: 16,
                                                color: Colors.black45,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              //padding: EdgeInsets.only(left: 10, right: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'คณะกรรมการ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(20),
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    //color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/jirayu.png'))),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              child: Text(
                                                'ดร. จิรายุ อิศรางกูร ณ อยุธยา',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              child: Text(
                                                'รองประธานกรรมการ',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(20),
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    //color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/disanan.png'))),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              child: Text(
                                                'ม.ร.ว.ดิศนัดดา ดิศกุล',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              child: Text(
                                                'กรรมการ',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(20),
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    //color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/arun.png'))),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              child: Text(
                                                'ศ.นพ.อรุณ เผ่าสวัสดิ์',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              child: Text(
                                                'กรรมการ',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(20),
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    //color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/wanna.png'))),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              child: Text(
                                                'คุณหญิงวรรณา สิริวัฒนภักดี',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.red,
                                              child: Text(
                                                'กรรมการ',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 12,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
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
