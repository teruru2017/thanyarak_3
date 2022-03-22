import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/detailMark.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/models/mark_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';
import 'package:collection/collection.dart';

class Previewwidget extends StatelessWidget {
  String? title;
  String? detail;
  Widget? part;

  Previewwidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Visibility(
        visible: true,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Scaffold(
            backgroundColor: Colors.black54,
            body: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                  image: NetworkImage('${title}'),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pop(context);

        return true;
      },
    );
  }
}
