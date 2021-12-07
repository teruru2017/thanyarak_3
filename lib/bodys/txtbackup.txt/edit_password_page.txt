import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';

class editpassword_page extends StatefulWidget {
  editpassword_page({Key? key}) : super(key: key);

  @override
  _editpassword_pageState createState() => _editpassword_pageState();
}

class _editpassword_pageState extends State<editpassword_page> {
  final double topWidgetHeight = 90.0;
  final double avatarRadius = 70.0;
  final double cameraRadius = 20.0;

  bool txt = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("images/bg_menu.png"),
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(children: [
                        Container(
                          height: topWidgetHeight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(top: 45, left: 25),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1.3,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.topLeft,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(top: 45, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'แก้ไขรหัสผ่าน',
                                      style: GoogleFonts.kanit(
                                        fontSize: 24,
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
                        Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.transparent,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 30, left: 25, right: 25),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'รหัสผ่านเดิม',
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 14,
                                                        color: Colors.grey[500],
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: FormBuilderTextField(
                                                  controller:
                                                      TextEditingController(
                                                          text: '123456789'),
                                                  readOnly: txt,
                                                  name: 'oldpassword',

                                                  style: GoogleFonts.kanit(),

                                                  decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade100,
                                                            width: 0),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade100,
                                                            width: 0),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      //border: InputBorder.none,

                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          const Radius.circular(
                                                              10),
                                                        ),
                                                      ),
                                                      fillColor:
                                                          Colors.grey[50],
                                                      filled: true),
                                                  // valueTransformer: (text) => num.tryParse(text),
                                                  // validator: FormBuilderValidators.compose([
                                                  //   FormBuilderValidators.required(context,
                                                  //       errorText: 'กรุณากรอกรหัสผ่าน'),
                                                  // ]),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'รหัสผ่านใหม่',
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 14,
                                                        color: Colors.grey[500],
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: FormBuilderTextField(
                                                  controller:
                                                      TextEditingController(
                                                          text: '987654321'),
                                                  readOnly: true,
                                                  name: 'newpassword',

                                                  style: GoogleFonts.kanit(),

                                                  decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade100,
                                                            width: 0),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade100,
                                                            width: 0),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      //border: InputBorder.none,

                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          const Radius.circular(
                                                              10),
                                                        ),
                                                      ),
                                                      fillColor:
                                                          Colors.grey[50],
                                                      filled: true),
                                                  // valueTransformer: (text) => num.tryParse(text),
                                                  // validator: FormBuilderValidators.compose([
                                                  //   FormBuilderValidators.required(context,
                                                  //       errorText: 'กรุณากรอกรหัสผ่าน'),
                                                  // ]),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 15),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'ยืนยันรหัสผ่าน',
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 14,
                                                        color: Colors.grey[500],
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: FormBuilderTextField(
                                                  readOnly: true,
                                                  name: 'confirmpassword',

                                                  style: GoogleFonts.kanit(),

                                                  decoration: InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade100,
                                                            width: 0),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade100,
                                                            width: 0),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      //border: InputBorder.none,

                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          const Radius.circular(
                                                              10),
                                                        ),
                                                      ),
                                                      fillColor: Colors.white,
                                                      filled: true),
                                                  // valueTransformer: (text) => num.tryParse(text),
                                                  // validator: FormBuilderValidators.compose([
                                                  //   FormBuilderValidators.required(context,
                                                  //       errorText: 'กรุณากรอกรหัสผ่าน'),
                                                  // ]),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // color: Colors.green,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      txt = !txt;
                                                    });
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 15),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      color: Color(0xffE6EFFE),
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          colors: [
                                                            Color(0xff0088C6),
                                                            Color(0xff43CEF8)
                                                          ]),
                                                    ),
                                                    child: Text(
                                                      "แก้ไขรหัสผ่าน",
                                                      style: GoogleFonts.kanit(
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headline4,
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        // fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
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
                              ],
                            ),
                          ),
                        )
                      ]))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
