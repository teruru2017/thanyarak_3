//@dart = 2.9
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/forgetpassword_pages.dart';
import 'package:thanyarak/bodys/login/main_login_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/newtype_pages.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/session.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thanyarak/states/main_home.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class testNotification extends StatefulWidget {
  testNotification({Key key}) : super(key: key);

  @override
  _TesttextState createState() => _TesttextState();
}

class _TesttextState extends State<testNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => setState(() {}),
                child: const Text(' กด '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
