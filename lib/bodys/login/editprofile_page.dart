//@dart=2.9
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';

class editprofile_page extends StatefulWidget {
  editprofile_page({Key key}) : super(key: key);

  @override
  _editprofile_pageState createState() => _editprofile_pageState();
}

class _editprofile_pageState extends State<editprofile_page> {
  final double topWidgetHeight = 120.0;

  bool txt = true;
  File imageFile;
  final picker = ImagePicker();
  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    File imageFile;
    final picker = ImagePicker();
    chooseImage(ImageSource source) async {
      final pickedFile = await picker.getImage(source: source);

      setState(() {
        imageFile = File(pickedFile.path);
      });
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final double avatarRadius = 70.0;
    final double cameraRadius = 20.0;
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
                            // color: Colors.amber,
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  // color: Colors.amber,
                                  margin: EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        scale: 1,
                                        image: AssetImage("images/back01.png"),
                                        alignment: Alignment.topLeft,
                                      )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Container(
                                      height: 40,
                                      // color: Colors.red,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'แก้ไขข้อมูลส่วนตัว',
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
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
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
                    //เนื้อหา
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 220, left: 15, right: 15),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'ชื่อของคุณ',
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
                                            controller: TextEditingController(
                                                text: 'Johnathan Wictoria'),
                                            readOnly: txt,
                                            name: 'name',

                                            style: GoogleFonts.kanit(),

                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                //border: InputBorder.none,

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(10),
                                                  ),
                                                ),
                                                fillColor: Colors.grey[50],
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
                                          flex: 2,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'วันเดือนปีเกิด',
                                                style: GoogleFonts.kanit(
                                                  fontSize: 14,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'อายุ',
                                                style: GoogleFonts.kanit(
                                                  fontSize: 14,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: FormBuilderTextField(
                                            controller: TextEditingController(
                                                text: '25/12/64'),
                                            readOnly: txt,
                                            name: 'hbd',

                                            style: GoogleFonts.kanit(),

                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                //border: InputBorder.none,

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(10),
                                                  ),
                                                ),
                                                fillColor: Colors.grey[50],
                                                filled: true),
                                            // valueTransformer: (text) => num.tryParse(text),
                                            // validator: FormBuilderValidators.compose([
                                            //   FormBuilderValidators.required(context,
                                            //       errorText: 'กรุณากรอกรหัสผ่าน'),
                                            // ]),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: FormBuilderTextField(
                                            controller: TextEditingController(
                                                text: '18'),
                                            readOnly: txt,
                                            name: 'age',

                                            style: GoogleFonts.kanit(),

                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                //border: InputBorder.none,

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(10),
                                                  ),
                                                ),
                                                fillColor: Colors.grey[50],
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
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'เบอร์โทรศัพท์',
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
                                            controller: TextEditingController(
                                                text: '012 345 6789'),
                                            readOnly: txt,
                                            name: 'tel',

                                            style: GoogleFonts.kanit(),

                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                //border: InputBorder.none,

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(10),
                                                  ),
                                                ),
                                                fillColor: Colors.grey[50],
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
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'ที่อยู่',
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
                                            controller: TextEditingController(
                                                text:
                                                    '555 สายไหม 99 ถนนสายไหม แขวงสายไหม เขต...'),
                                            readOnly: txt,
                                            name: 'address',

                                            style: GoogleFonts.kanit(),

                                            decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                //border: InputBorder.none,

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    const Radius.circular(10),
                                                  ),
                                                ),
                                                fillColor: Colors.grey[50],
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
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'อีเมล์',
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
                                            controller: TextEditingController(
                                                text: 'Johnathan@gmail.com'),
                                            readOnly: txt,
                                            name: 'mail',

                                            style: GoogleFonts.kanit(),

                                            decoration: InputDecoration(
                                                //border: InputBorder.none,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade100,
                                                      width: 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                fillColor: Colors.grey[50],
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
                                  padding: EdgeInsets.only(top: 20),
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
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
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
                                                "แก้ไขข้อมูล",
                                                style: GoogleFonts.kanit(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  fontSize: 16,
                                                  color: Color(0xffFFFFFF),
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
                    Positioned(
                      child: CircleAvatar(
                        radius: avatarRadius,
                        backgroundImage: AssetImage('images/Member_login.png'),
                      ),
                      left: (MediaQuery.of(context).size.width / 2) -
                          avatarRadius,
                      top: (topWidgetHeight + 25) - avatarRadius,
                    ),
                    Positioned(
                      child: ClipRRect(
                        child: GestureDetector(
                          onTap: () {
                            chooseImage(ImageSource.gallery);
                          },
                          child: Container(
                            child: Align(
                              child:
                                  Image.asset('images/camera.png', scale: 1.3),
                            ),
                          ),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      left: (MediaQuery.of(context).size.width / 2) + 17,
                      top: (topWidgetHeight + 60) - cameraRadius,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigagitonBar(actionGet: 5),
    );
  }
}
