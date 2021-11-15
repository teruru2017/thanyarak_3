import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/main_login_page.dart';
import 'package:thanyarak/bodys/shop_page.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';

class ShopDetailPage extends StatefulWidget {
  ShopDetailPage({Key? key}) : super(key: key);

  @override
  _ShopDetailPageState createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends State<ShopDetailPage> {
  List<String> pathImageA = [
    'images/h_shop.png',
    'images/h_shop.png',
    'images/h_shop.png',
    'images/h_shop.png',
    'images/h_shop.png',
    'images/h_shop.png',
  ];
  List<String> pathImageAritcles = [];
  List<String> titleAritcles = [
    'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
  ];
  List<String> detailAritcles = [
    'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะหลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะหลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมม...อ่านต่อ',
  ];
  List<String> dataAritcles = [
    '16-6-25564',
  ];
  List<String> viewAritcles = [
    'ผู้เข้าชม 123k',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHead(),
            buildMigH(),
            listImages(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ ',
                        style: GoogleFonts.kanit(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0088c6),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 4, 4, 4),
                            child: SvgPicture.asset('images/c1.svg'),
                          ),
                          Text(
                            'e.dateTime',
                            style: GoogleFonts.kanit(
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(6, 4, 4, 4),
                            child: SvgPicture.asset('images/v2.svg'),
                          ),
                          Text(
                            'e.dateTime',
                            style: GoogleFonts.kanit(
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 370,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 6, 6, 6),
                child: ShowTitle(
                  title: cutWord(
                    'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะหลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                  ),
                  textStyle: MyConstant().h2StyleBack(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  'ราคา',
                  style: GoogleFonts.kanit(
                      fontSize: 18, color: Colors.grey.withOpacity(0.8)),
                ),
                SizedBox(
                  width: 250,
                ),
                Text(
                  '210',
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'บาท',
                  style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            MainLoginPage())); //SignInPage()));
              },
              child: Container(
                width: 320,
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffE6EFFE),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                ),

                //Image.asset("images/i_shoe_bt.png"),

                child: Text(
                  "ช้อปเลย",
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

  Padding buildMigH() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('images/h_shop.png'),
    );
  }

  Container buildHead() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/h_shop_detail.png'), fit: BoxFit.cover),
      ),
      // width: double.infinity,
      height: 100,
      child: ListTile(
        title: ShowTitle(
          title: 'รายละเอียดสินค้า',
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
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ShopPage()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        scale: 1.3,
                        image: AssetImage("images/h_shop_d_1.png"),
                        alignment: Alignment(-0.7, 0.6))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ShopPage()));
              },
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        scale: 1.3,
                        image: AssetImage("images/h_shop_d2.png"),
                        alignment: Alignment(-0.7, 0.6))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox listImages() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: pathImageA.length,
        itemBuilder: (context, index) => Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      pathImageA[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox listArticle() {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: pathImageAritcles.length,
        itemBuilder: (context, index) => Card(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 170,
              width: 366,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(
                    pathImageAritcles[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 326,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ShowTitle(
                  title: cutWordH(titleAritcles[index]),
                  textStyle: MyConstant().h2StyleBlue(),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 4, 4),
                  child: SvgPicture.asset('images/c1.svg'),
                ),
                ShowTitle(
                  title: dataAritcles[index],
                  textStyle: MyConstant().h4StyleGley(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
                  child: SvgPicture.asset('images/v2.svg'),
                ),
                ShowTitle(
                  title: viewAritcles[index],
                  textStyle: MyConstant().h4StyleGley(),
                ),
              ],
            ),
            Container(
              width: 326,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ShowTitle(
                  title: cutWord(detailAritcles[index]),
                  textStyle: MyConstant().h4StyleBlack(),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        )),
      ),
    );
  }
}

String cutWord(String detailAritcl) {
  String resutl = detailAritcl;
  if (resutl.length >= 400) {
    resutl = resutl.substring(0, 200);
    resutl = '$resutl ....';
  }
  return resutl;
}

String cutWordH(String titleAritcles) {
  String resutl = titleAritcles;
  if (resutl.length >= 80) {
    resutl = resutl.substring(0, 40);
    resutl = '$resutl ....';
  }
  return resutl;
}
