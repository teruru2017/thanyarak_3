import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/article_widget.dart';
import 'package:thanyarak/widgets/show_circular.dart';
import 'package:thanyarak/widgets/show_title.dart';

class AticlePage extends StatefulWidget {
  const AticlePage({Key? key}) : super(key: key);

  @override
  _AticlePageState createState() => _AticlePageState();
}

class _AticlePageState extends State<AticlePage> {
  List<String> banners = [
    'images/tt1.png',
    'images/topgraphic.png',
    'images/topgraphic.png',
  ];
  List<Widget> widgets = [];
  void loopCreateBanner() {
    for (var item in banners) {
      setState(() {
        widgets.add(createBannerWidget(item));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loopCreateBanner();
  }

  Widget createBannerWidget(String path) => Image.asset(path);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHead(),
            builBanner(),
            ArticleWidget(),
          ],
        ),
      ),
    );
  }

  CarouselSlider builBanner() {
    return CarouselSlider(
        items: widgets,
        options: CarouselOptions(
            viewportFraction: 0.99,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3)));
  }

  Container buildHead() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/header2.png'), fit: BoxFit.cover),
      ),
      // width: double.infinity,
      height: 100,
      child: ListTile(
        title: ShowTitle(
          title: 'บทความ',
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
}
