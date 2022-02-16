//@dart=2.9
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:flutter/services.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';

class mark_procedure_page extends StatefulWidget {
  mark_procedure_page({Key key}) : super(key: key);
  @override
  _mark_procedure_pageState createState() => _mark_procedure_pageState();
}

String textPhone, nameProcedure, imgBase64, cidProcedure;

class _mark_procedure_pageState extends State<mark_procedure_page> {
  TextEditingController phoninput = TextEditingController();

  void initState() {
    imgBase64 = "";
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getDATA();
  }

  Future<void> Markprocedure({
    String nameMARK,
    cidMARK,
    phoneMARK,
    imgMARK,
  }) async {
    var url = '${apiurl().urlapi}/donate.php';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          "type": "procedure",
          "cmsId": 0,
          "fullname": "${nameMARK}",
          "remark": "${cidMARK}",
          "address": "${phoneMARK}",
          "amount": "procedure",
          "slipImage": "${imgMARK}"
        },
      ),
    );

    if (response.statusCode == 200) {
      print('UpdateuserPassword Status APi: ' + response.statusCode.toString());
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  Succes(phonenumber: textPhone));
    } else {
      print('UpdateuserPassword Status APi: ' + response.statusCode.toString());
      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.transparent,
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder:
            (BuildContext context, Animation frist, Animation second) =>
                MSGBoxWidget(
          title: 'เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง',
          detail: '',
        ),
      );
    }
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cidProcedure = per.getString('cid');
      nameProcedure = per.getString('name');
    });
  }

  final ImagePicker imgpicker = ImagePicker();

  String imagepath = "";
  String imageName = "";
  @override
  _getFromGallery() async {
    var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageName = pickedFile.name;
      imagepath = pickedFile.path;
      File imagefile = File(imagepath);
      Uint8List imagebytes = await imagefile.readAsBytes();
      String base64string = base64.encode(imagebytes);
      setState(() {
        imgBase64 = base64string;
      });
      Uint8List decodedbytes = base64.decode(base64string);
    } else {
      print("No image is selected.");
    }
  }

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
                                          'แนะนำการนัดหมาย',
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
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(
                                    1.0,
                                    2.0,
                                  ),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.01,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1. กรุณาแนบรูปภาพใบส่งตรวจวินิจฉัยได้',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imagepath == ""
                                              ? AssetImage('images/NoPath.png')
                                              : AssetImage(imagepath))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                imageName != ""
                                    ? Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              173, 209, 221, 255),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              child: IconButton(
                                                icon: FaIcon(
                                                  FontAwesomeIcons.fileCsv,
                                                  size: 15,
                                                  color: Colors.blue[300],
                                                ),
                                                color: Colors.blue,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${imageName}",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.kanit(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0088C6),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  imgBase64 = "";
                                                  imagepath = "";
                                                  imageName = "";
                                                });
                                              },
                                              child: Container(
                                                width: 40,
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: Colors.blue,
                                                  size: 25.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      _getFromGallery();
                                    },
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xff0088C6),
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(
                                              1.0,
                                              2.0,
                                            ),
                                            blurRadius: 5.0,
                                            spreadRadius: 0.01,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.upload,
                                                    size: 12,
                                                    color: Colors.blue[300],
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "อัพโหลดไฟล์",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff0088C6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  color: Colors.grey.withOpacity(0.1),
                                  width: MediaQuery.of(context).size.width,
                                  height: 2,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "เบอร์โทรศัพท์",
                                  style: GoogleFonts.kanit(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FormBuilderTextField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: phoninput,
                                        name: 'phnoe',
                                        style: GoogleFonts.kanit(),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(10),
                                              ),
                                            ),
                                            hintText: 'เบอร์โทรศัพท์',
                                            fillColor: Color(0xfff3f3f4),
                                            filled: false),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                textPhone = phoninput.text;
                                if (textPhone.length < 10) {
                                  _Dialog('กรุณาใส่เบอร์ให้ถูกต้อง');
                                } else if (imgBase64.length <= 0) {
                                  _Dialog('กรุณาเลือกรูปภาพ');
                                } else {
                                  Markprocedure(
                                      cidMARK: cidProcedure,
                                      imgMARK: imgBase64,
                                      nameMARK: nameProcedure,
                                      phoneMARK: textPhone);
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

  Widget _Dialog(txt) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.transparent,
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder:
            (BuildContext context, Animation frist, Animation second) =>
                MSGBoxWidget(
                  title: txt,
                  detail: '',
                ));
  }
}

class Succes extends StatefulWidget {
  Succes({Key key, String phonenumber}) : super(key: key);

  @override
  _SuccesState createState() => _SuccesState();
}

class _SuccesState extends State<Succes> {
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
                  padding: const EdgeInsets.all(0.0),
                  // height: MediaQuery.of(context).size.height,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/estimate.png'))),
                            height: 80,
                            width: 80,
                          ),
                          Text(
                            "รอเจ้าหน้าที่ติดต่อกลับ",
                            style: GoogleFonts.kanit(
                                color: Color(0xff0088C6), fontSize: 20),
                          ),
                          Text(
                            "เจ้าหน้าที่จะทำการติดต่อกลับไปที่เบอร์",
                            style: GoogleFonts.kanit(
                                color: Colors.black, fontSize: 14),
                          ),
                          Text(
                            "${textPhone}",
                            style: GoogleFonts.kanit(
                                color: Colors.black, fontSize: 14),
                          ),
                          Text(
                            "เพื่อทำการนัดวันตรวจ",
                            style: GoogleFonts.kanit(
                                color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       Navigator.pop(context);
                          //     });
                          //   },
                          //   child: Text(
                          //     "แก้ไขเบอร์โทรศัพท์",
                          //     style: GoogleFonts.kanit(
                          //         color: Color(0xff0088C6), fontSize: 16),
                          //   ),
                          // ),

                          //ปุ่ม

                          GestureDetector(
                            //หน้ายิงยังผิด
                            onTap: () {
                              setState(() {
                                if (getAction == 1) {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: dating_page()),
                                  );
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
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
                                  'เสร็จสิ้น',
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
                  ),
                ),
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
                    mark_procedure_page());
        return true;
      });
}
