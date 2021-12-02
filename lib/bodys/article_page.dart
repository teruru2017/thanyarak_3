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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    //พื้นหลัง
                    Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                    //เนื้อหา
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 130, left: 40, right: 40),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                          Container(
                            height: 200,
                            padding: EdgeInsets.all(10),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 200,
                            padding: EdgeInsets.all(10),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: NavigagitonBar(),
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
}
