import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/registerdata_pages.dart';

class register1_pages extends StatefulWidget {
  register1_pages({Key? key}) : super(key: key);

  @override
  _register1_pagesState createState() => _register1_pagesState();
}

enum SingingCharacter { HN, idcard }

class _register1_pagesState extends State<register1_pages> {
  SingingCharacter? _character = SingingCharacter.HN;
  String txt = "HN";

  int _selectedchoice = 0;
  int choice = 0;
  final double topWidgetHeight = 180.0;
  FocusNode myFocusNode = new FocusNode();
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
                                                "images/userdata.png"),
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
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(-1, -1),
                            child: Text(
                              "ลงทะเบียน",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
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
                              "กรุณากรอกข้อมูลของคุณ เพื่อลงทะเบียน",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 16,
                                color: Color(0xffB7B7B7),
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Container(
                            //child: MyStatefulWidget(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Radio(
                                            value: SingingCharacter.HN,
                                            groupValue: _character,
                                            onChanged:
                                                (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                              txt = 'HN';
                                            },
                                          ),
                                          Expanded(
                                              child: Text('HN',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 16,
                                                  )))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          Radio(
                                            value: SingingCharacter.idcard,
                                            groupValue: _character,
                                            onChanged:
                                                (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                              txt = 'เลขบัตรประจำตัวประชาชน';
                                            },
                                          ),
                                          Expanded(
                                              child:
                                                  Text('เลขบัตรประจำตัวประชาชน',
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 16,
                                                      )))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: Colors.amber,
                            //margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormBuilderTextField(
                                  name: 'id',
                                  obscureText: true,
                                  style: GoogleFonts.kanit(),

                                  focusNode: myFocusNode,
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
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          'images/barcode.png',
                                          alignment: Alignment.center,
                                          scale: 1.5,
                                          color: myFocusNode.hasFocus
                                              ? Colors.blue
                                              : Colors.grey.shade300,
                                        ),
                                      ),
                                      hintText: txt,
                                      hintStyle: TextStyle(
                                          color: myFocusNode.hasFocus
                                              ? Colors.blue
                                              : Colors.grey.shade300),
                                      fillColor: myFocusNode.hasFocus
                                          ? Colors.blue[50]
                                          : Colors.white,
                                      filled: true),

                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context,
                                        errorText: 'กรุณากรอกรหัสผ่าน'),
                                  ]),
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
                                          registerdata_pages()));
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
                                "ถัดไป",
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
    );
  }
}
