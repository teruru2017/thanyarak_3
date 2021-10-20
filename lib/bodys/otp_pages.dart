import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/registerdata_pages.dart';

class otp_pages extends StatefulWidget {
  otp_pages({Key? key}) : super(key: key);

  @override
  _otp_pagesState createState() => _otp_pagesState();
}

class _otp_pagesState extends State<otp_pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/header3.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter)),
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: 400,
                  child: Stack(
                    children: <Widget>[
                      // Container(
                      //     child: Column(
                      //   children: <Widget>[
                      //     Align(
                      //       alignment: Alignment(-0.9, -0.7),
                      //       child: IconButton(
                      //           icon: Image.asset("assets/icons/back01.png"),
                      //           onPressed: () {
                      //             Navigator.pop(context);
                      //           }),
                      //     )
                      //   ],
                      // )),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                scale: 1.5,
                                image: AssetImage("images/circle.png"),
                                alignment: Alignment.center)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                scale: 1.8,
                                image: AssetImage("images/iconlogin.png"),
                                alignment: Alignment(0, 0.2))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment(-1, -1),
                  child: Text(
                    "ยืนยัน OTP",
                    style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0088C6),
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-1, -1),
                  child: Text(
                    "รหัส OTP ส่งไปที่เบอร์โทรศัพท์ 0xx-xxx-9999",
                    style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 16,
                      color: Color(0xffB7B7B7),
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment(0, 0),
                  child: Text(
                    "เลขอ้างอิง OTP ภายในเวลา 3 นาที",
                    style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 12,
                      color: Colors.black,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(first: true, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: true),
                        ],
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "ขอรหัส OTP ใหม่",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0088C6),
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "หากไม่ได้รับ OTP กรุณาติดต่อ โทร. 02-4115657-9",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "หรือ Line@ : @thanyarak หรือ Webpage",
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => registerdata_pages()));
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
                          child: Text(
                            "ถัดไป",
                            style: GoogleFonts.kanit(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 16,
                              color: Color(0xffFFFFFF),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget _textFieldOTP({
  first,
  last,
}) {
  return Container(
    height: 85,
    child: AspectRatio(
      aspectRatio: 0.75,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            //FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            //FocusScope.of(context).previousFocus();
          }
        },
        showCursor: true,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xFF0088C6)),
              borderRadius: BorderRadius.circular(12)),
          fillColor: Colors.grey[50],
          filled: true,
          hoverColor: Colors.lightBlue[50],
        ),
      ),
    ),
  );
}
