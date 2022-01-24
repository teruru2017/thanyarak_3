//@dart = 2.9
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

import 'package:thanyarak/states/main_home.dart';

class Testtext extends StatefulWidget {
  Testtext({Key key}) : super(key: key);

  @override
  _TesttextState createState() => _TesttextState();
}

class _TesttextState extends State<Testtext> {
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
                onTap: () {
                  print(_formKey.currentContext);
                },
                child: Text('กดๆๆๆๆๆๆ'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
