// ignore_for_file: prefer_const_constructors
//@dart=2.9
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_banner.dart';
import 'package:thanyarak/bodys/API/api_main_article.dart';
import 'package:thanyarak/bodys/API/loading_api.dart';
import 'package:thanyarak/bodys/CarouselWithDotsPage.dart';
import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/alert_page.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/article_page.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/bodys/detailcheck.dart';
import 'package:thanyarak/bodys/hitstoryDetail.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/mark_procedure.dart';
import 'package:thanyarak/bodys/member_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/bodys/pin.dart';
import 'package:thanyarak/bodys/shop_page.dart';
// import 'package:thanyarak/bodys/about_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/bodys/xray.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/models/session.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/show_circular.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:thanyarak/widgets/show_title_head.dart';
//import 'package:thanyarak/states/main_home.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class loadingPage extends StatefulWidget {
  loadingPage({Key key}) : super(key: key);

  @override
  _loadingPageState createState() => _loadingPageState();
}

SessionManager ssr = SessionManager();
String cid;

class _loadingPageState extends State<loadingPage> {
  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    getcid();
    loading();
  }

  Future getcid() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');
      print(cid);
    });
  }

  Future<List<loadingapi>> loadingData;
  Future<loadingapi> loading() async {
    final response = await http.post(
      Uri.parse('http://118.174.183.82:52354/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': 'test',
        'password': 'test123',
        'name': 'test'
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> dashboarddata =
          convert.jsonDecode(response.body);
      setState(() {
        ssr.setToken(dashboarddata['access_token']);
        // Future.delayed(Duration(seconds: 3), () {
        //   Navigator.push(
        //       context, CupertinoPageRoute(builder: (context) => MainPage()));
        // });
        if (cid != '') {
          Future.delayed(Duration(seconds: 3), () {
            //วิ่งหน้าpin
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => PinPage()));
          });
        } else {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => MainPage()));
        }
        print(cid);
      });

      print(dashboarddata['access_token']);

      // print(response.body);

      return loadingapi.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      //dialog แจ้งเตือน
    } else {
      //dialog แจ้งเตือน
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/loading.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
