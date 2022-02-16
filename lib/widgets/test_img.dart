//@dart = 2.9
import 'dart:convert';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_appointments.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/bodys/forgetpassword_pages.dart';
import 'package:thanyarak/bodys/login/main_login_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/newtype_pages.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/session.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:thanyarak/states/main_home.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';

class TestIMGPage extends StatefulWidget {
  TestIMGPage({
    Key key,
  }) : super(key: key);

  @override
  _TestIMGPageState createState() => _TestIMGPageState();
}

File _img;
SessionManager ssr = SessionManager();
String x;

class _TestIMGPageState extends State<TestIMGPage> {
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();

    getIMG();
  }

  Future getIMG() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      x = per.getString('img');
      if (x == '' || x == null) {
        // _img = File(x.toString());
      } else {
        _img = File(x.toString());
      }
    });
  }

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);
    if (pickedFile != null) {
      setState(() {
        _img = File(pickedFile.path);
        ssr.setIMG(_img.path.toString());
      });
    }
  }

  _getFromCamera() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _img = File(pickedFile.path);
        ssr.setIMG(_img.path.toString());
      });
    }
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
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('1111'),
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

  Future<void> postupdateuser() async {
    var urlapi = 'https://truethanyarak.com/api/disease.php';
    final responseapi = await http.post(
      Uri.parse(urlapi),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "userId": "0000000000008",
        "congenitalDisease": "xx",
        "allergic": "xx"
      }),
    );
    if (responseapi.statusCode == 200) {}
    print(responseapi.statusCode);

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => password_pages()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: Text('data')),
          ),
          CircleAvatar(
            radius: 55,
            backgroundColor: Color(0xffFDCF09),
            child: _img != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _img,
                      width: 200,
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
          ),
          Center(
            child: GestureDetector(onTap: () {}, child: Text('xxxxx')),
          ),
          Center(
              child: GestureDetector(
            onTap: () {
              postupdateuser();
            },
            child: Text(
              'api',
              style: GoogleFonts.kanit(fontSize: 50),
            ),
          ))
        ],
      ),
    );
  }
}
