import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';

class ArticleDetailsPage extends StatefulWidget {
  ArticleDetailsPage({Key? key}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  List<String> banners = [
    'images/tt1.png',
    'images/tt1.png.png',
    'images/tt1.png.png',
  ];
  List<Widget> widgets = [];
  void loopCreateBanner() {
    for (var item in banners) {
      setState(() {
        widgets.add(createBannerWidget(item));
      });
    }
  }

  Widget createBannerWidget(String path) => Image.asset(path);
  List<String> pathImageA = [
    'images/tt1.png',
    'images/tt1.png',
    'images/tt1.png',
  ];

  List<String> pathImageAritcles = [
    'images/tt1.png',
  ];
  List<String> titleAritcles = [
    'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ222',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ333',
    'Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ444',
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
          children: [buildHead(), listArticle(), listImages()],
        ),
      ),
    );
  }

  CarouselSlider builBanner() {
    return CarouselSlider(
        items: widgets,
        options: CarouselOptions(
            autoPlay: true, autoPlayInterval: Duration(seconds: 3)));
  }

  Container buildHead() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/h_detail_article.png'),
            fit: BoxFit.cover),
      ),
      // width: double.infinity,
      height: 100,
      child: ListTile(
        title: ShowTitle(
          title: 'รายละเอียดบทความ',
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

  SizedBox listImages() {
    return SizedBox(
      height: 180,
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
                height: 163,
                width: 163,
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
