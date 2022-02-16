//@dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';
import 'package:thanyarak/widgets/msgBoxsucc_widget.dart';
import 'dart:convert' as convert;

class editprofile_page extends StatefulWidget {
  editprofile_page({Key key}) : super(key: key);

  @override
  _editprofile_pageState createState() => _editprofile_pageState();
}

bool id = false;
bool prefix = false;
bool _prefixerr = false;
bool name = false;
bool _nameerr = false;
bool hbd = false;
bool _hbderr = false;
bool tel = false;
bool _telerr = false;
bool address = false;
bool _addresserr = false;
bool email = false;
bool _emailerr = false;
bool sub_district = false;
bool _suberr = false;
bool district = false;
bool _districterr = false;
bool province = false;
bool _provinceerr = false;
bool zip = false;
bool _ziperr = false;
bool surname = false;
bool _surerr = false;

var jsonRes;
String apiStatus, hn, cid, cklogin;
TextEditingController input_id = TextEditingController();
TextEditingController input_prefix = TextEditingController();
TextEditingController input_name = TextEditingController();
TextEditingController input_hbd = TextEditingController();
TextEditingController input_age = TextEditingController();
TextEditingController input_tel = TextEditingController();
TextEditingController input_address = TextEditingController();
TextEditingController input_sub_district = TextEditingController();
TextEditingController input_province = TextEditingController();
TextEditingController input_zip = TextEditingController();
TextEditingController input_email = TextEditingController();
TextEditingController input_surname = TextEditingController();
TextEditingController input_district = TextEditingController();

var now = DateTime.now();
var format = new DateFormat('yyyy');
String pid;
String Token = '';
File _img;
SessionManager ssr = SessionManager();
String x;

class _editprofile_pageState extends State<editprofile_page> {
  final _formKey = GlobalKey<FormBuilderState>();
  final double topWidgetHeight = 120.0;

  bool txt = true;
  File imageFile;

  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();

    getToken();
  }

  Future getToken() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      Token = per.getString('tokens');
      getcid(cid);
      getIMG();
    });
  }

  Future getIMG() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      x = per.getString('img');

      if (x == '' || x == null) {
        // _img = File(x.toString());
        _img = null;
      } else {
        _img = File(x.toString());
      }
    });
  }

  Future<void> getcid(String txtcid) async {
    var url = '${apiurl().url}/patient/findByCitizenId/${txtcid}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token}',
    });
    if (response.statusCode == 200) {
      //List jsonResponse = json.decode(response.body);
      jsonRes = convert.jsonDecode(response.body);
      apiStatus = response.statusCode.toString();
      pid = jsonRes['pid'];
      print(pid);
      input_id.text = jsonRes['citizenId'];
      input_prefix.text = jsonRes['prefix'];
      input_name.text = jsonRes['name'];
      input_surname.text = jsonRes['surname'];
      input_tel.text = jsonRes['mobile'];
      input_address.text = jsonRes['address'];
      input_district.text = jsonRes['district'];
      input_sub_district.text = jsonRes['sub_district'];
      input_province.text = jsonRes['province'];
      input_zip.text = jsonRes['zip'];
      input_email.text = jsonRes['email'];

      var str = jsonRes['dob'];
      var arrey = str.split("-");

      var age = int.parse(format.format(now)) - int.parse(arrey[0]);
      var age2 = DateTime.parse(jsonRes['dob']);
      var formathbd = new DateFormat('dd-M-yyyy');

      input_hbd.text = formathbd.format(age2);
      input_age.text = age.toString();
    } else {
      print(response.statusCode);

      Navigator.pop(context);
    }
  }

  Future<void> PostupdateData(String txtpid, var data) async {
    var url = '${apiurl().url}/patient/${txtpid}';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token}',
      },
      body: jsonEncode(<String, String>{
        "prefix": data['prefixname'],
        "name": data['name'],
        "surname": data['surname'],
        "address": data['address'],
        "sub_district": data['sub_district'],
        "district": data['district'],
        "province": data['province'],
        "zip": data['zip'],
        "mobile": data['tel'],
        "email": data['email'],
      }),
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      setState(() {
        if (_img == null || _img == '') {
        } else {
          ssr.setIMG(_img.path.toString());
        }
      });
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder:
              (BuildContext context, Animation frist, Animation second) =>
                  MSGBoxsuccWidget(
                    title: 'แก้ไขข้อมูลเสร็จเรียบร้อย',
                    detail: '',
                    part: '/menuHome',
                  ));
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    File imageFile;
    final picker = ImagePicker();

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
                          FormBuilder(
                            key: _formKey,
                            onWillPop: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
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
                                            child: Focus(
                                              onFocusChange: (hasfocus) {
                                                setState(() {
                                                  name = hasfocus;
                                                  _nameerr = false;
                                                });
                                              },
                                              child: FormBuilderTextField(
                                                controller: input_name,
                                                name: 'name',
                                                style: GoogleFonts.kanit(),
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
                                                    errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                    ),
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

                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        const Radius.circular(
                                                            10),
                                                      ),
                                                    ),
                                                    fillColor: Colors.grey[50],
                                                    filled: true),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    setState(() {
                                                      _nameerr = true;
                                                    });
                                                    return 'กรุณาระบุชื่อ';
                                                  }
                                                  return null;
                                                },
                                              ),
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
                                                  'นามสกุลของคุณ',
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
                                              controller: input_surname,
                                              name: 'surname',
                                              style: GoogleFonts.kanit(),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
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

                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(10),
                                                    ),
                                                  ),
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  setState(() {
                                                    _surerr = true;
                                                  });
                                                  return 'กรุณาระบุนามสกุล';
                                                }
                                                return null;
                                              },
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
                                              controller: input_hbd,
                                              readOnly: true,
                                              name: 'hbd',
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

                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(10),
                                                    ),
                                                  ),
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: FormBuilderTextField(
                                              controller: input_age,
                                              readOnly: true,
                                              name: 'age',

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
                                              controller: input_tel,
                                              name: 'tel',
                                              maxLength: 10,
                                              style: GoogleFonts.kanit(),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
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

                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(10),
                                                    ),
                                                  ),
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  setState(() {
                                                    _telerr = true;
                                                  });
                                                  return 'กรุณาระบุเบอร์โทรศัพท์';
                                                }
                                                return null;
                                              },
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
                                              controller: input_address,
                                              name: 'address',
                                              style: GoogleFonts.kanit(),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
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

                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(10),
                                                    ),
                                                  ),
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  setState(() {
                                                    _addresserr = true;
                                                  });
                                                  return 'กรุณาระบุที่อยู่';
                                                }
                                                return null;
                                              },
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
                                                  'ตำบล',
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
                                              controller: input_sub_district,
                                              name: 'sub_district',
                                              style: GoogleFonts.kanit(),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
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

                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(10),
                                                    ),
                                                  ),
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  setState(() {
                                                    _suberr = true;
                                                  });
                                                  return 'กรุณาระบุตำบล';
                                                }
                                                return null;
                                              },
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
                                                  'อำเภอ',
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
                                              controller: input_district,
                                              name: 'district',
                                              style: GoogleFonts.kanit(),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
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

                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(10),
                                                    ),
                                                  ),
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  setState(() {
                                                    _districterr = true;
                                                  });
                                                  return 'กรุณาระบุอำเภอ';
                                                }
                                                return null;
                                              },
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
                                                  'จังหวัด',
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
                                              controller: input_province,
                                              name: 'province',
                                              style: GoogleFonts.kanit(),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
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

                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(10),
                                                    ),
                                                  ),
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  setState(() {
                                                    _provinceerr = true;
                                                  });
                                                  return 'กรุณาระบุจังหวัด';
                                                }
                                                return null;
                                              },
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
                                                  'รหัสไปรษณีย์',
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
                                              controller: input_zip,
                                              name: 'zip',
                                              keyboardType:
                                                  TextInputType.number,
                                              style: GoogleFonts.kanit(),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
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

                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(10),
                                                    ),
                                                  ),
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  setState(() {
                                                    _ziperr = true;
                                                  });
                                                  return 'กรุณาระบุรหัสไปรษณีย์';
                                                }
                                                return null;
                                              },
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
                                              controller: input_email,
                                              name: 'email',
                                              style: GoogleFonts.kanit(),
                                              decoration: InputDecoration(
                                                  counterText: '',
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 14,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  //border: InputBorder.none,
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
                                                  fillColor: Colors.grey[50],
                                                  filled: true),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  setState(() {
                                                    _emailerr = true;
                                                  });
                                                  return 'กรุณาระบุอีเมล์';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: GestureDetector(
                                              onTap: () {
                                                _formKey.currentState.save();
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  var jsonEn = jsonEncode(
                                                      _formKey
                                                          .currentState.value);
                                                  var jsonDe =
                                                      jsonDecode(jsonEn);
                                                  PostupdateData(pid, jsonDe);
                                                } else {
                                                  showGeneralDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      barrierLabel:
                                                          MaterialLocalizations
                                                                  .of(context)
                                                              .modalBarrierDismissLabel,
                                                      barrierColor:
                                                          Colors.transparent,
                                                      transitionDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  200),
                                                      pageBuilder: (BuildContext
                                                                  context,
                                                              Animation frist,
                                                              Animation
                                                                  second) =>
                                                          MSGBoxWidget(
                                                            title:
                                                                'แก้ไขข้อมูลผิดพลาด',
                                                            detail:
                                                                'โปรดลองใหม่อีกครั้งในภายหลัง',
                                                          ));

                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Color(0xffE6EFFE),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
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
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: avatarRadius,
                        child: ClipRRect(
                            child: _img == null || _img == ''
                                ? Container(
                                    decoration: ShapeDecoration(
                                      //color: Colors.green,
                                      shape: CircleBorder(),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage('images/avatar.png'),
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: ShapeDecoration(
                                      //color: Colors.green,
                                      shape: CircleBorder(),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: FileImage(_img),
                                      ),
                                    ),
                                  )),
                      ),
                      left: (MediaQuery.of(context).size.width / 2) -
                          avatarRadius,
                      top: (topWidgetHeight + 25) - avatarRadius,
                    ),
                    Positioned(
                      child: ClipRRect(
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                            // chooseImage(ImageSource.gallery);
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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _getFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _getFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);
    if (pickedFile != null) {
      setState(() {
        _img = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _img = File(pickedFile.path);
      });
    }
  }
}
