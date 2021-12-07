import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';

class estimate_page extends StatefulWidget {
  estimate_page({Key? key}) : super(key: key);

  @override
  _estimate_pageState createState() => _estimate_pageState();
}

class _estimate_pageState extends State<estimate_page> {
  final double topWidgetHeight = 90.0;
  final double avatarRadius = 70.0;
  final double cameraRadius = 20.0;
  final double her = 10, herBottom = 150;
  ScrollController _controller = new ScrollController();

  bool txt = true;
  bool value = true;
  bool well01 = false,
      well02 = false,
      well03 = false,
      well04 = false,
      well05 = false,
      well06 = false,
      well07 = false;
  bool good01 = false,
      good02 = false,
      good03 = false,
      good04 = false,
      good05 = false,
      good06 = false,
      good07 = false;
  bool fair01 = false,
      fair02 = false,
      fair03 = false,
      fair04 = false,
      fair05 = false,
      fair06 = false,
      fair07 = false;
  bool bad01 = false,
      bad02 = false,
      bad03 = false,
      bad04 = false,
      bad05 = false,
      bad06 = false,
      bad07 = false;
  String textwell = 'images/well.png';
  String textwellcolor = 'images/well011.png';
  String textgood = 'images/good.png';
  String textgoodcolor = 'images/good011.png';
  String textfair = 'images/fair.png';
  String textfaircolor = 'images/fair011.png';
  String textbad = 'images/bad.png';
  String textbadcolor = 'images/bad011.png';

  @override
  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: topWidgetHeight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
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
                      padding:
                          const EdgeInsets.only(top: 130, left: 40, right: 40),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height,
                    //   decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(40.0),
                    //       topRight: Radius.circular(40.0),
                    //     ),
                    //   ),
                    // ),
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
}

class successDialog extends StatefulWidget {
  successDialog({Key? key}) : super(key: key);

  @override
  _successDialogState createState() => _successDialogState();
}

bool success = false;

class _successDialogState extends State<successDialog> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Visibility(
          visible: !success,
          child: Scaffold(
              backgroundColor: Colors.black38,
              body: SingleChildScrollView(
                  child: Stack(children: <Widget>[
                Container(
                  width: double.infinity,
                  //height: 400,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(
                    top: 180,
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/success01.png'))),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'บริจาคสำเร็จ',
                      style: GoogleFonts.kanit(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0088C6),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'ขอบคุณสำหรับการสละเวลาในการทำแบบสอบถามการให้บริการนี้ ความเห็นของท่านสำคัญต่อการพัฒนางานบริการ ให้ดียิ่งขึ้นต่อไป',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        //fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(height: 20),
                    //เสร็จสิ้น
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NotiPage()));
                          // showGeneralDialog(
                          //     context: context,
                          //     barrierDismissible: false,
                          //     barrierLabel: MaterialLocalizations.of(context)
                          //         .modalBarrierDismissLabel,
                          //     barrierColor: Colors.transparent,
                          //     transitionDuration: Duration(milliseconds: 200),
                          //     pageBuilder: (BuildContext context,
                          //             Animation frist, Animation second) =>
                          //         detaildonate_pages());
                          // Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //         builder: (context) => detaildonate_pages()));
                        });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffE6EFFE),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'เสร็จสิ้น',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ]),
                ),
              ])))),
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
                    NotiPage());
        return true;
      });
}
