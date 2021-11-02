import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
            listArticle(),
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
                Icons.menu,
                color: Colors.white,
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
            elevation: 3,
            margin: EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 150,
                  width: 280,
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
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ShowTitle(
                        title: cutWordH(titleAritcles[index]),
                        textStyle: GoogleFonts.kanit(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0088C6),
                        )),
                  ),
                ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ShowTitle(
                        title: cutWord(detailAritcles[index]),
                        textStyle: GoogleFonts.kanit(
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
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
                  ],
                )
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
