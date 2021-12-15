import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/successpassword_page.dart';

class newpassword_pages extends StatefulWidget {
  newpassword_pages({Key? key}) : super(key: key);

  @override
  _newpassword_pagesState createState() => _newpassword_pagesState();
}

class _newpassword_pagesState extends State<newpassword_pages> {
  int _selectedchoice = 0;
  int choice = 0;
  bool password = false;
  bool cfpassword = false;
  bool showpassword = false;
  bool showcfpassword = false;

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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Container(
                          child: Stack(children: [
                            Container(
                              padding: EdgeInsets.only(top: 45),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(60),
                                        decoration: BoxDecoration(
                                          color: Colors.pink,
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Color(0xff43CEF8),
                                                Color(0xff43CEF8),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 70),
                                  child: Container(
                                    padding: EdgeInsets.all(60),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            scale: 1.5,
                                            image: AssetImage(
                                                "images/userlock.png"),
                                            alignment: Alignment.topCenter)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      //color: Colors.amber,
                                      image: DecorationImage(
                                          scale: 1.3,
                                          image:
                                              AssetImage("images/back01.png"),
                                          alignment: Alignment.topLeft)),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
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
                          top: 220, left: 15, right: 15, bottom: 20),
                      child: Column(children: [
                        Align(
                          alignment: Alignment(-1, -1),
                          child: Text(
                            "ตั้งรหัสผ่านใหม่",
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
                            "กรุณาตั้งรหัสผ่านของคุณ",
                            style: GoogleFonts.kanit(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 16,
                              color: Color(0xffB7B7B7),
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          //color: Colors.amber,
                          //margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Focus(
                                onFocusChange: (hasfocus) {
                                  setState(() {
                                    password = hasfocus;
                                  });
                                },
                                child: FormBuilderTextField(
                                  name: 'password',
                                  obscureText:
                                      showpassword == true ? false : true,
                                  style: GoogleFonts.kanit(fontSize: 14),
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300,
                                            width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock_outline_rounded,
                                        color: password
                                            ? Colors.blue
                                            : Colors.grey.shade300,
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showpassword = !showpassword;
                                          });
                                        },
                                        child: Icon(
                                          showpassword == false
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: password
                                              ? Colors.blue
                                              : Colors.grey.shade300,
                                        ),
                                      ),
                                      hintText: 'รหัสผ่าน',
                                      hintStyle: TextStyle(
                                          color: password
                                              ? Colors.blue
                                              : Colors.grey.shade300),
                                      fillColor: password
                                          ? Colors.blue[50]
                                          : Colors.white,
                                      filled: true),
                                ),
                              ),
                              SizedBox(height: 10),
                              Focus(
                                onFocusChange: (hasfocus) {
                                  setState(() {
                                    cfpassword = hasfocus;
                                  });
                                },
                                child: FormBuilderTextField(
                                  name: 'confirmpassword',
                                  obscureText: true,
                                  style: GoogleFonts.kanit(fontSize: 14),
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300,
                                            width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock_outline_rounded,
                                        color: cfpassword
                                            ? Colors.blue
                                            : Colors.grey.shade300,
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showcfpassword = !showcfpassword;
                                          });
                                        },
                                        child: Icon(
                                          showpassword == false
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: cfpassword
                                              ? Colors.blue
                                              : Colors.grey.shade300,
                                        ),
                                      ),
                                      hintText: 'ยืนยันรหัสผ่านอีกครั้ง',
                                      hintStyle: TextStyle(
                                          color: cfpassword
                                              ? Colors.blue
                                              : Colors.grey.shade300),
                                      fillColor: cfpassword
                                          ? Colors.blue[50]
                                          : Colors.white,
                                      filled: true),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        successpassword_pages()));
                          },
                          child: Container(
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
                            child: Text(
                              "ยืนยัน",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 16,
                                color: Color(0xffFFFFFF),
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
