import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/appoin_login_page.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/conditions_page.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/login/menumember_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/member_page.dart';
import 'package:thanyarak/bodys/newtype_pages.dart';
import 'package:thanyarak/bodys/policing_login_page.dart';
import 'package:thanyarak/bodys/shop_page.dart';
import 'package:thanyarak/bodys/signin_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/show_title.dart';

class MenuLoginPage extends StatelessWidget {
  const MenuLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg_menu.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            buildHead(context),
            Container(
              height: 300,
              child: buildNonAppointCard(context),
            ),
            buildNonAppointCard1(context),
            buildNonAppointCard2(context),
            //buildNonAppointCard3(context),
            buildNonAppointCard4(context),
            buildNonAppointCard5(context),
            buildNonAppointCard6(context)
          ],
        ),
      ),
    );
  }

  Padding buildNonAppointCard1(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => MainPage()));
            },
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_home.png')),
              ),
            ),
            title: ShowTitle(
                title: 'หน้าแรก',
                textStyle: GoogleFonts.kanit(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
            // subtitle: ShowTitle(
            //   title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
            //   textStyle: MyConstant().h4StyleGley(),
            // ),
            trailing: Column(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   new MaterialPageRoute(
                    //       builder: (context) => MainPage()),
                    // );
                  },
                  icon: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               CupertinoPageRoute(
          //                   builder: (context) => SignInPage()));
          //         },
          //         child: ShowTitle(
          //           title: 'เข้าสู่ระบบ',
          //           textStyle: MyConstant().h3StyleWhite(),
          //         )),
          //   ),
          // )
        ],
      ),
      // ),
    );
  }

  Padding buildNonAppointCard2(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              // Navigator.push(context,
              //     CupertinoPageRoute(builder: (context) => ArticleWidget()));
            },
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_article.png')),
              ),
            ),
            title: ShowTitle(
                title: 'บทความ',
                textStyle: GoogleFonts.kanit(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
            // subtitle: ShowTitle(
            //   title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
            //   textStyle: MyConstant().h4StyleGley(),
            // ),
            trailing: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               CupertinoPageRoute(
          //                   builder: (context) => SignInPage()));
          //         },
          //         child: ShowTitle(
          //           title: 'เข้าสู่ระบบ',
          //           textStyle: MyConstant().h3StyleWhite(),
          //         )),
          //   ),
          // )
        ],
      ),
      // ),
    );
  }

  // Padding buildNonAppointCard3(context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     // child: Card(
  //     //   color: Color(0xff43cef8),
  //     //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     child: Column(
  //       children: [
  //         ListTile(
  //           onTap: () {
  //             Navigator.push(context,
  //                 CupertinoPageRoute(builder: (context) => ShopPage()));
  //           },
  //           leading: Container(
  //             child: Padding(
  //               padding: const EdgeInsets.all(14.0),
  //               child: Container(
  //                   width: 25, child: Image.asset('images/m_shop.png')),
  //             ),
  //           ),
  //           title: ShowTitle(
  //               title: 'ร้านค้า',
  //               textStyle: GoogleFonts.kanit(
  //                 fontSize: 22,
  //                 fontWeight: FontWeight.w500,
  //                 color: Colors.white,
  //               )),
  //           // subtitle: ShowTitle(
  //           //   title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
  //           //   textStyle: MyConstant().h4StyleGley(),
  //           // ),
  //           trailing: Column(
  //             children: [
  //               IconButton(
  //                 onPressed: () {},
  //                 icon: Container(
  //                   // decoration: BoxDecoration(
  //                   //     color: Colors.grey.shade200,
  //                   //     borderRadius: BorderRadius.circular(5)),
  //                   child: const Icon(
  //                     Icons.navigate_next,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         // Container(
  //         //   width: double.infinity,
  //         //   child: Padding(
  //         //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
  //         //     child: ElevatedButton(
  //         //         style: ElevatedButton.styleFrom(
  //         //           shape: RoundedRectangleBorder(
  //         //               borderRadius: BorderRadius.circular(10)),
  //         //         ),
  //         //         onPressed: () {
  //         //           Navigator.push(
  //         //               context,
  //         //               CupertinoPageRoute(
  //         //                   builder: (context) => SignInPage()));
  //         //         },
  //         //         child: ShowTitle(
  //         //           title: 'เข้าสู่ระบบ',
  //         //           textStyle: MyConstant().h3StyleWhite(),
  //         //         )),
  //         //   ),
  //         // )
  //       ],
  //     ),
  //     // ),
  //   );
  // }

  Padding buildNonAppointCard4(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => DonatePage()));
            },
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_donate.png')),
              ),
            ),
            title: ShowTitle(
                title: 'บริจาค',
                textStyle: GoogleFonts.kanit(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
            // subtitle: ShowTitle(
            //   title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
            //   textStyle: MyConstant().h4StyleGley(),
            // ),
            trailing: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               CupertinoPageRoute(
          //                   builder: (context) => SignInPage()));
          //         },
          //         child: ShowTitle(
          //           title: 'เข้าสู่ระบบ',
          //           textStyle: MyConstant().h3StyleWhite(),
          //         )),
          //   ),
          // )
        ],
      ),
      // ),
    );
  }

  Padding buildNonAppointCard5(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => MemderPage()));
            },
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_menber.png')),
              ),
            ),
            title: ShowTitle(
                title: 'สมาชิก',
                textStyle: GoogleFonts.kanit(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
            // subtitle: ShowTitle(
            //   title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
            //   textStyle: MyConstant().h4StyleGley(),
            // ),
            trailing: Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => menumember_pages()));
                  },
                  icon: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               CupertinoPageRoute(
          //                   builder: (context) => SignInPage()));
          //         },
          //         child: ShowTitle(
          //           title: 'เข้าสู่ระบบ',
          //           textStyle: MyConstant().h3StyleWhite(),
          //         )),
          //   ),
          // )
        ],
      ),
      // ),
    );
  }

  Padding buildNonAppointCard6(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => ConditionsPage()));
            },
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_request.png')),
              ),
            ),
            title: ShowTitle(
                title: 'ข้อกำหนดและเงื่อนไข',
                textStyle: GoogleFonts.kanit(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
            // subtitle: ShowTitle(
            //   title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
            //   textStyle: MyConstant().h4StyleGley(),
            // ),
            trailing: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               CupertinoPageRoute(
          //                   builder: (context) => SignInPage()));
          //         },
          //         child: ShowTitle(
          //           title: 'เข้าสู่ระบบ',
          //           textStyle: MyConstant().h3StyleWhite(),
          //         )),
          //   ),
          // )
        ],
      ),
      // ),
    );
  }

  Container buildHead(context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('images/header2.png'), fit: BoxFit.cover),
      // ),
      // width: double.infinity,
      padding: EdgeInsets.all(15),
      height: 65,

      child: ListTile(
        title: ShowTitle(
            title: 'เมนู',
            textStyle: GoogleFonts.kanit(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )),
        // subtitle: ShowTitle(
        //   title: 'กรุณาเข้าสู้ระบบ',
        //   textStyle: MyConstant().h3StyleWhite(),
        // ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildNonAppointCard(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0.5),
        color: Color(0xff2AB4E1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                      width: 50,
                      child: Image.asset(
                        'images/Member_login.png',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              title: ShowTitle(
                  title: 'สวัสดี',
                  textStyle: GoogleFonts.kanit(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
              subtitle: ShowTitle(
                  title: 'Johnathan Wicktoria',
                  textStyle: GoogleFonts.kanit(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54,
                  )),
              trailing: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(
                        Icons.settings_applications,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => newtype_pages()));
              },
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  color: Color(0xff33BEEC),
                ),
                child: Text(
                  "ออกจากระบบ",
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 16,
                    color: Color(0xffffffff),
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            buildAppointCard1(context),
            buildAppointCard2(context)
          ],
        ),
      ),
    );
  }

  Padding buildAppointCard1(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => PolicingLoginPags()));
            },
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/i_m_policing.png')),
              ),
            ),
            title: ShowTitle(
                title: 'ปรวัติการตรวจ',
                textStyle: GoogleFonts.kanit(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
            // subtitle: ShowTitle(
            //   title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
            //   textStyle: MyConstant().h4StyleGley(),
            // ),
            trailing: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               CupertinoPageRoute(
          //                   builder: (context) => SignInPage()));
          //         },
          //         child: ShowTitle(
          //           title: 'เข้าสู่ระบบ',
          //           textStyle: MyConstant().h3StyleWhite(),
          //         )),
          //   ),
          // )
        ],
      ),
      // ),
    );
  }

  Padding buildAppointCard2(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => AppointmentLoginPage()));
            },
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/i_m_calendar.png')),
              ),
            ),
            title: ShowTitle(
                title: 'การนัดหมาย',
                textStyle: GoogleFonts.kanit(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
            // subtitle: ShowTitle(
            //   title: 'เข้าสู้ระบบ เพื่อทำการนัดหมาย',
            //   textStyle: MyConstant().h4StyleGley(),
            // ),
            trailing: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               CupertinoPageRoute(
          //                   builder: (context) => SignInPage()));
          //         },
          //         child: ShowTitle(
          //           title: 'เข้าสู่ระบบ',
          //           textStyle: MyConstant().h3StyleWhite(),
          //         )),
          //   ),
          // )
        ],
      ),
      // ),
    );
  }
}
