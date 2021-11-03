import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/article_page.dart';
import 'package:thanyarak/bodys/donate_page.dart';
import 'package:thanyarak/bodys/main_page.dart';
import 'package:thanyarak/bodys/menber_page.dart';
import 'package:thanyarak/bodys/shop_page.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<BottomNavigationBarItem> bottomNavigationBarItems = [];
  List<String> titles = ['หน้าหลัก', 'บทความ', 'ร้านค้า', 'บริจาค', 'สมาชิก'];
  // List<IconData> iconDatas = [
  //   Icons.filter_1,
  //   Icons.filter_2,
  //   Icons.filter_3,
  //   Icons.filter_4,
  //   Icons.filter_5
  // ];
  List<Widget> widgets = [
    MainPage(),
    AticlePage(),
    ShopPage(),
    DonatePage(),
    MenderPage()
  ];

  int currentTabIndex = 0;
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0), // here the desired height
            child: AppBar(
              backgroundColor: Color(0xff43CEF8),
            )),
        body: widgets[currentTabIndex],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: onTapped,
            currentIndex: currentTabIndex,
            items: [
              BottomNavigationBarItem(
                icon: currentTabIndex == 0
                    ? new Image.asset('images/Btn_home_active.png')
                    : new Image.asset('images/Btn_home.png'),
                title: Text(
                  'หน้าหลัก',
                  style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: currentTabIndex == 0
                          ? Colors.blue[400]
                          : Colors.grey[400]
                      // fontStyle: FontStyle.italic,
                      ),
                ),
              ),
              BottomNavigationBarItem(
                icon: currentTabIndex == 1
                    ? new Image.asset('images/Btn_article_active.png')
                    : new Image.asset('images/Btn_article.png'),
                title: Text(
                  'บทความ',
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: currentTabIndex == 1
                        ? Colors.blue[400]
                        : Colors.grey[400],
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: currentTabIndex == 2
                    ? new Image.asset('images/Btn_store_active.png')
                    : new Image.asset('images/Btn_store.png'),
                title: Text(
                  'ร้านค้า',
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: currentTabIndex == 2
                        ? Colors.blue[400]
                        : Colors.grey[400],
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: currentTabIndex == 3
                    ? new Image.asset('images/Btn_donate_active.png')
                    : new Image.asset('images/Btn_donate.png'),
                title: Text(
                  'บริจาค',
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: currentTabIndex == 3
                        ? Colors.blue[400]
                        : Colors.grey[400],
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: currentTabIndex == 4
                    ? new Image.asset('images/Btn_member_active.png')
                    : new Image.asset('images/Btn_member.png'),
                title: Text(
                  'สมาชิก',
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: currentTabIndex == 4
                        ? Colors.blue[400]
                        : Colors.grey[400],
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

//   int indexBody = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     for (var i = 0; i < titles.length; i++) {
//       bottomNavigationBarItems.add(
//         createItem(iconDatas[i], titles[i]),
//       );
//     }
//   }

//   BottomNavigationBarItem createItem(IconData iconData, String label) =>
//       BottomNavigationBarItem(
//         label: label,
//         icon: Icon(
//           iconData,
//           //color: Colors.amber,
//         ),
//       );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         unselectedIconTheme: const IconThemeData(color: Colors.grey),
//         selectedIconTheme: const IconThemeData(color: Colors.blue),
//         selectedItemColor: Colors.blue,
//         onTap: (value) {
//           setState(() {
//             indexBody = value;
//           });
//         },
//         currentIndex: indexBody,
//         items: bottomNavigationBarItems,
//       ),
//       body: SafeArea(child: widgets[indexBody]),
//     );
//   }
// }
