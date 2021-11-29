import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:thanyarak/bodys/appointment04_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/history_sum_widget.dart';
import 'package:thanyarak/widgets/show_title.dart';

class AppointmentLoginPage extends StatefulWidget {
  const AppointmentLoginPage({Key? key}) : super(key: key);

  @override
  _AppointmentLoginPageState createState() => _AppointmentLoginPageState();
}

class _AppointmentLoginPageState extends State<AppointmentLoginPage> {
  int selectedIndex = 0;
  List categorises = ['ทั้งหมด', 'วันนัดล่าสุด', 'ผ่านแล้ว', 'ยกแล้ว'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        scale: 1.3,
                        image: AssetImage("images/back01.png"),
                        alignment: Alignment(-0.9, -0.7))),
              ),
            ),
            buildHead(),
            listMenu(),
            HistorySum(),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //         builder: (context) => Appointment04Page()));
              },
              child: Container(
                width: 320,
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffE6EFFE),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                ),
                child: Text(
                  "เข้าสู่ระบบ",
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 16,
                    color: Color(0xffFFFFFF),
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container listMenu() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.8),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorises.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 18 / 2),
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(categorises[index]),
                ),
              )),
    );
  }

  Container buildHead() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/appoin_h.png'), fit: BoxFit.cover),
      ),

      // width: double.infinity,
      height: 150,
      child: ListTile(
        title: ShowTitle(
          title: 'การนัดหมาย',
          textStyle: MyConstant().h2StyleWhite(),
        ),

        // subtitle: ShowTitle(
        //   title: 'กรุณาเข้าสู้ระบบ',
        //   textStyle: MyConstant().h3StyleWhite(),
        // ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.notifications,
            //     color: Colors.white,
            //   ),
            // ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
