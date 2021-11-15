import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
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
    'images/topgraphic.png',
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
      child: Column(children: [
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/header2.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.only(top: 40, left: 25),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'บทความ',
                            style: GoogleFonts.kanit(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 90,
                        child: Container(
                          margin: EdgeInsets.only(top: 45),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => NotiPage()));
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/notimenu.png'))),
                                ),
                              ),
                              SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => MenuPage()));
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('images/menu.png'))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: 90),
                child: builBanner(),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: 320),
                child: ArticleWidget(),
              )),
            ],
          ),
        ),
      ]),
    ));
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
      child: Column(
        children: [
          Container(
            height: 100,
            //width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                    alignment: Alignment(-0.8, 0.1),
                    child: Text('บทความ',
                        style: GoogleFonts.kanit(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ))),
                SizedBox(width: 170),
                Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
