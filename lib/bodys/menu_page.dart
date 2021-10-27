import 'package:flutter/material.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

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
            buildHead(),
            buildNonAppointCard(),
            buildNonAppointCard1(),
            buildNonAppointCard2(),
            buildNonAppointCard3(),
            buildNonAppointCard4(),
            buildNonAppointCard5(),
            buildNonAppointCard6()
          ],
        ),
      ),
    );
  }

  Padding buildNonAppointCard1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_home.png')),
              ),
            ),
            title: ShowTitle(
              title: 'หน้าหลัก',
              textStyle: MyConstant().h1StyleWhites(),
            ),
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

  Padding buildNonAppointCard2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_article.png')),
              ),
            ),
            title: ShowTitle(
              title: 'บทความ',
              textStyle: MyConstant().h1StyleWhites(),
            ),
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

  Padding buildNonAppointCard3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_shop.png')),
              ),
            ),
            title: ShowTitle(
              title: 'ร้านค้า',
              textStyle: MyConstant().h1StyleWhites(),
            ),
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

  Padding buildNonAppointCard4() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_donate.png')),
              ),
            ),
            title: ShowTitle(
              title: 'บริจาค',
              textStyle: MyConstant().h1StyleWhites(),
            ),
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

  Padding buildNonAppointCard5() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_menber.png')),
              ),
            ),
            title: ShowTitle(
              title: 'สมาชิก',
              textStyle: MyConstant().h1StyleWhites(),
            ),
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

  Padding buildNonAppointCard6() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // child: Card(
      //   color: Color(0xff43cef8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                    width: 25, child: Image.asset('images/m_request.png')),
              ),
            ),
            title: ShowTitle(
              title: 'ข้อกำหนดและเงื่อนไข',
              textStyle: MyConstant().h1StyleWhites(),
            ),
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

  Container buildHead() {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('images/header2.png'), fit: BoxFit.cover),
      // ),
      // width: double.infinity,

      child: ListTile(
        title: ShowTitle(
          title: 'บริจาค',
          textStyle: MyConstant().h2StyleWhite(),
        ),
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
              onPressed: () {},
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

  Padding buildNonAppointCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        color: Color(0xff43cef8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      width: 30, child: Image.asset('images/ter.jpg')),
                ),
              ),
              title: ShowTitle(
                title: 'สวัสดี',
                textStyle: MyConstant().h2StyleWhite(),
              ),
              subtitle: ShowTitle(
                title: 'กรุณาเข้าสู้ระบบ',
                textStyle: MyConstant().h3StyleWhite(),
              ),
              trailing: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(
                        Icons.navigate_next,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {},
                    child: ShowTitle(
                      title: 'เข้าสู่ระบบ',
                      textStyle: MyConstant().h3StyleWhite(),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
