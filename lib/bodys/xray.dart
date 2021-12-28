//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/xraymark.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:flutter/services.dart';

class xray_page extends StatefulWidget {
  xray_page({Key key}) : super(key: key);
  @override
  _xray_pageState createState() => _xray_pageState();
}

int textPhone;

class _xray_pageState extends State<xray_page> {
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
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.center,
                                      )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: _f,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      // height: 40,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'แนะนำการปฏิบัติตัว',
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'คำแนะนำก่อนการเจาะชิ้นเนื้อ',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          setText('1.มาให้ตรงตามเวลานัด'),
                          setText('2.รับประทานอาหารได้ตามปกติ'),
                          setText(
                              "3.งดทานยาละลายลิ่มเลือดหรือยาต้านการแข็งตัวของเลือดในระยะเวลา 72 ชั่วโมงก่อนการเจาะชิ้นเนื้อ เช่น แอสไพริน(Aspirin),วาร์ฟาริน(Warfarin)/คูมาดิน(Coumadin),อีนอกซาพาริน(Enoxaparin)เป็นต้น*หากมีการใช้ยากลุ่มดังกล่าว โปรดปรึกษาแพทย์เรื่องการหยุดใช้ยาประเภทนี้ก่อนเจาะชิ้นเนื้อ**"),
                          setText(
                              '4.งดทาสาระงับกลิ่นกายหรือแป้งที่บริเวณรักแร้และเต้านม'),
                          setText(
                              '5.กรุณาสวมเสื้อผ้าแยกชิ้น (ไม่สวมใส่ชุดติดกัน)'),
                          setText(
                              '6.ไม่ใส่สร้อยหรือเครื่องประดับ เพื่อความสะดวกในการเจาะชิ้นเนื้อ'),
                          setText(
                              '7.การเจาะชิ้นเนื้อ ใช้ระยะเวลาโดยรวมประมาณ 30 นาที ถึง 2 ชั่วโมง'),
                          SizedBox(
                            height: 20,
                          ),
                          setText(
                              'หมายเหตุ ถ้ามีโรคประจำตัว เช่น ความดันโลหิตสูง, เบาหวาน, โรคหัวใจ, ไวรัสตับอักเสบ ฯลฯ กรุณาแจ้งเจ้าหน้าที่ก่อน'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'คำแนะนำหลังการเจาะชิ้นเนื้อ',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          setText('1.มาให้ตรงตามเวลานัด'),
                          setText('2.รับประทานอาหารได้ตามปกติ'),
                          setText(
                              '3.งดทานยาละลายลิ่มเลือดหรือยาต้านการแข็งตัวของเลือดในระยะเวลา 72 ชั่วโมงก่อนการเจาะชิ้นเนื้อ เช่น แอสไพริน(Aspirin),วาร์ฟาริน(Warfarin)/คูมาดิน(Coumadin),อีนอกซาพาริน(Enoxaparin)เป็นต้น**หากมีการใช้ยากลุ่มดังกล่าว โปรดปรึกษาแพทย์เรื่องการหยุดใช้ยาประเภทนี้ก่อนเจาะชิ้นเนื้อ**'),
                          setText(
                              '4.งดทาสาระงับกลิ่นกายหรือแป้งที่บริเวณรักแร้และเต้านม'),
                          setText(
                              '5.กรุณาสวมเสื้อผ้าแยกชิ้น (ไม่สวมใส่ชุดติดกัน)'),
                          setText(
                              '6.ไม่ใส่สร้อยหรือเครื่องประดับ เพื่อความสะดวกในการเจาะชิ้นเนื้อ'),
                          setText(
                              '7.การเจาะชิ้นเนื้อ ใช้ระยะเวลาโดยรวมประมาณ 30 นาที ถึง 2 ชั่วโมง'),
                          SizedBox(
                            height: 20,
                          ),
                          setText(
                              'หมายเหตุ ถ้ามีโรคประจำตัว เช่น ความดันโลหิตสูง, เบาหวาน, โรคหัวใจ, ไวรัสตับอักเสบ ฯลฯ กรุณาแจ้งเจ้าหน้าที่ก่อน'),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => xrayMark_page()));
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
                                  'นัดหมาย',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
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
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(),
    );
  }

  Text setText(String txt) {
    return Text(
      txt,
      style: GoogleFonts.kanit(
        fontSize: 14,
        color: Colors.grey,
      ),
    );
  }
}
