//@dart = 2.9
import 'dart:convert';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_ArticleDetail.dart';
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

class TwoTestAPIPage extends StatefulWidget {
  TwoTestAPIPage({
    Key key,
  }) : super(key: key);

  @override
  _TestAPIPageState createState() => _TestAPIPageState();
}

bool num1 = false;
String txt;
List<Appointments> users;
String Token;
Future<DetailArticle> futureData;
Future<List<DetailArticle>> futureDetailArticle;

class _TestAPIPageState extends State<TwoTestAPIPage> {
  List img = [];
  void initState() {
    getpin();
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    futureData = fetchData();
  }

  Future getpin() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      Token = per.getString('tokens');
    });
  }

  Future<DetailArticle> fetchData() async {
    var url = 'https://truethanyarak.com/api/article.php?id=3';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      return DetailArticle.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      print(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            txt = 'success';
                          });
                        },
                        child: Text('success')),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            txt = 'fail';
                          });
                        },
                        child: Text('fail')),
                  ],
                ),
              ),
              FutureBuilder<DetailArticle>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: Column(
                        children: [
                          Align(
                            child: Text(
                              snapshot.data.subject.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0.8),
                            height: 150,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.gallery.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 150,
                                    height: 150,
                                    margin: EdgeInsets.only(
                                      right: 20,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot
                                                .data.gallery[index].filePath)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
