//@dart=2.9
import 'package:flutter/material.dart';
import 'package:thanyarak/bodys/API/testapi.dart';
import 'package:thanyarak/bodys/Tests/testtext.dart';
import 'package:thanyarak/bodys/article_page.dart';
import 'package:thanyarak/bodys/dating_page.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/loading.dart';
import 'package:thanyarak/bodys/login/menumember_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/mark_procedure.dart';
import 'package:thanyarak/bodys/pin.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/bodys/xray.dart';
import 'package:thanyarak/bodys/xraymark.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/states/main_home.dart';
import 'package:thanyarak/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  '/loading': (BuildContext context) => new loadingPage(),
  '/mainHome': (BuildContext context) => new MainPage(),
  '/SinginPage': (BuildContext context) => new SignInPage(),
};

String firstState;

void main() {
  firstState = MyConstant.routeMainHome;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: "/loading",
    );
  }
}
