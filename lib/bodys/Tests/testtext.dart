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

class Testtext extends StatefulWidget {
  Testtext({Key key}) : super(key: key);

  @override
  _TesttextState createState() => _TesttextState();
}

class _TesttextState extends State<Testtext> {
  Future<void> _launched;
  String phoneNumber = '';

  // String toLaunch = 'https://tmn.app.link/?deeplink=ascendmoney';

  String toLaunch =
      'https://www.facebook.com/sharer?u=https%3A%2F%2Ftruethanyarak.com%2Fupload%2Far%2Fpictures%2Fpic-20221502-1644915753-778-1.jpg';
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  String fbProtocolUrl = "fb://page/sharer";
  String fallbackUrl =
      'https://www.facebook.com/sharer?u=https%3A%2F%2Ftruethanyarak.com%2Fupload%2Far%2Fpictures%2Fpic-20221502-1644915753-778-1.jpg';
  void _callFacebook(BuildContext context) async {
    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "name1",
              ),
              FormBuilderTextField(
                name: "name2",
              ),
              FormBuilderTextField(
                name: "name3",
              ),
              GestureDetector(
                onTap: () {},
                child: Text('กดๆๆๆๆๆๆ'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _callFacebook(context);
                }),
                child: const Text('sssss in browser'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
