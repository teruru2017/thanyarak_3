import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:thanyarak/bodys/appointment04_page.dart';
// import 'package:thanyarak/bodys/history_details_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/history_widget.dart';
import 'package:thanyarak/widgets/show_title.dart';

class PolicingLoginPags extends StatefulWidget {
  PolicingLoginPags({Key? key}) : super(key: key);

  @override
  _PolicingLoginPagsState createState() => _PolicingLoginPagsState();
}

class _PolicingLoginPagsState extends State<PolicingLoginPags> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        scale: 1.3,
                        image: AssetImage("images/back01.png"),
                        alignment: Alignment(-0.9, -0.7))),
              ),
            ),
            buildHead(),
            HistoryWidget(),
          ],
        ),
      ),
    );
  }

  Container buildHead() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/policing_h.png'), fit: BoxFit.cover),
      ),
      // width: double.infinity,
      height: 100,
      child: ListTile(
        title: ShowTitle(
          title: 'ประวัติการตรวจ',
          textStyle: MyConstant().h2StyleWhite(),
        ),
        // subtitle: ShowTitle(
        //   title: 'กรุณาเข้าสู้ระบบ',
        //   textStyle: MyConstant().h3StyleWhite(),
        // ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //         builder: (context) => Appointment04Page()));
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('images/history_h1.png'))),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
