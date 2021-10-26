import 'package:flutter/material.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';

class AboutHead extends StatelessWidget {
  final String title;

  const AboutHead({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            ShowTitle(
              title: title,
              textStyle: MyConstant().h1StyleBlue(),
            ),
          ],
        ),
      );
}
