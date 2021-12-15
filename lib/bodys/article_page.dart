import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/alert_page.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/article_widget.dart';

class Article_page extends StatefulWidget {
  Article_page({Key? key}) : super(key: key);
  @override
  _Article_pageState createState() => _Article_pageState();
}

final List<String> imgLists = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
int _currents = 0;
final CarouselController _controller = CarouselController();

String checklogin = '';

class _Article_pageState extends State<Article_page> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;
    if (width <= 414) {
      _w = 2;
      _f = 1;
    }
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
                      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/bg_menu.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.amber,
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: _f,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Container(
                                      height: 40,
                                      // color: Colors.red,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'บทความ',
                                          style: GoogleFonts.kanit(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Container(
                                    // color: Colors.amber,
                                    height: 40,
                                    width: 100,
                                    child: Container(
                                      //color: Colors.red,
                                      //margin: EdgeInsets.only(top: 35),
                                      // padding: EdgeInsets.only(top: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          checklogin == '' ||
                                                                  checklogin ==
                                                                      null
                                                              ? NotiPage()
                                                              : alert_page()));
                                            },
                                            child: Container(
                                              width: 20,
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
                                                      builder: (context) =>
                                                          MenuPage()));
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/menu.png'))),
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
                        ],
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
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
                      padding: const EdgeInsets.only(
                          top: 100, left: 15, right: 15, bottom: 10),
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(8, 0),
                                          )
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: CarouselSlider(
                                      items: imageSliderBanner,
                                      carouselController: _controller,
                                      options: CarouselOptions(
                                          height: 250,
                                          viewportFraction: 1,
                                          autoPlay: true,
                                          enlargeCenterPage: true,
                                          autoPlayInterval:
                                              Duration(seconds: 15),
                                          aspectRatio: 2.0,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              _currents = index;
                                            });
                                          }),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        imgListss.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controller
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 9.0,
                                          height: 9.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _currents == entry.key
                                                  ? Colors.pink[200]
                                                  : Colors.blue),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              )),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'บทความ',
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          articleWidget()
                          // SizedBox(height: 10),
                          // GestureDetector(
                          //   onTap: () => Navigator.push(
                          //       context,
                          //       CupertinoPageRoute(
                          //           builder: (context) =>
                          //               ArticleDetailsPage())),
                          //   child: Container(
                          //     padding: EdgeInsets.only(
                          //         top: 10, bottom: 10, left: 10),
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.grey.withOpacity(0.1),
                          //             spreadRadius: 2,
                          //             blurRadius: 2,
                          //             offset: Offset(0, 2),
                          //           )
                          //         ],
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(20))),
                          //     height: 130,
                          //     child: Row(
                          //       children: <Widget>[
                          //         Container(
                          //           width: 150,
                          //           padding: EdgeInsets.all(20),
                          //           decoration: BoxDecoration(
                          //               image: DecorationImage(
                          //                   fit: BoxFit.cover,
                          //                   image:
                          //                       AssetImage('images/1150.png')),
                          //               color: Colors.amber,
                          //               borderRadius: BorderRadius.all(
                          //                   Radius.circular(20))),
                          //         ),
                          //         Expanded(
                          //           child: Container(
                          //             // padding: EdgeInsets.only(left: 10),
                          //             decoration: BoxDecoration(
                          //                 //color: Colors.red,
                          //                 ),
                          //             padding:
                          //                 EdgeInsets.only(left: 10, right: 10),
                          //             child: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               children: [
                          //                 Text('ทำไมต้องตรวจอัลตราซาวเต้านม',
                          //                     maxLines: 1,
                          //                     overflow: TextOverflow.ellipsis,
                          //                     style: GoogleFonts.kanit(
                          //                         fontSize: 16,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: Color(0xff0088C6))),
                          //                 SizedBox(height: 5),
                          //                 Text(
                          //                     'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                          //                     maxLines: 2,
                          //                     overflow: TextOverflow.ellipsis,
                          //                     style: GoogleFonts.kanit(
                          //                         fontSize: 14,
                          //                         color: Colors.black)),
                          //                 SizedBox(height: 10),
                          //                 Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.start,
                          //                   children: [
                          //                     Flexible(
                          //                       child: FaIcon(
                          //                         FontAwesomeIcons.solidClock,
                          //                         size: 12,
                          //                         color: Color(0xff0088C6),
                          //                       ),
                          //                     ),
                          //                     SizedBox(
                          //                       width: 5,
                          //                     ),
                          //                     Flexible(
                          //                       child: Text(
                          //                         "16-06-2564",
                          //                         maxLines: 1,
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         style: GoogleFonts.kanit(
                          //                           fontSize: 12,
                          //                           fontWeight: FontWeight.w500,
                          //                           color: Colors.grey,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                     SizedBox(
                          //                       width: 10,
                          //                     ),
                          //                     Flexible(
                          //                       child: FaIcon(
                          //                         FontAwesomeIcons.solidEye,
                          //                         size: 12,
                          //                         color: Color(0xff0088C6),
                          //                       ),
                          //                     ),
                          //                     SizedBox(
                          //                       width: 5,
                          //                     ),
                          //                     Flexible(
                          //                       child: Text(
                          //                         "50,000",
                          //                         maxLines: 1,
                          //                         overflow:
                          //                             TextOverflow.ellipsis,
                          //                         style: GoogleFonts.kanit(
                          //                           fontSize: 12,
                          //                           fontWeight: FontWeight.w500,
                          //                           color: Colors.grey,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 20),
                          // Container(
                          //   padding:
                          //       EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.grey.withOpacity(0.1),
                          //           spreadRadius: 2,
                          //           blurRadius: 2,
                          //           offset: Offset(0, 2),
                          //         )
                          //       ],
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(20))),
                          //   height: 130,
                          //   child: Row(
                          //     children: <Widget>[
                          //       Container(
                          //         width: 150,
                          //         padding: EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //             image: DecorationImage(
                          //                 fit: BoxFit.cover,
                          //                 image: AssetImage('images/1150.png')),
                          //             color: Colors.amber,
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(20))),
                          //       ),
                          //       Expanded(
                          //         child: Container(
                          //           // padding: EdgeInsets.only(left: 10),
                          //           decoration: BoxDecoration(
                          //               //color: Colors.red,
                          //               ),
                          //           padding:
                          //               EdgeInsets.only(left: 10, right: 10),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Text('ทำไมต้องตรวจอัลตราซาวเต้านม',
                          //                   maxLines: 1,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   style: GoogleFonts.kanit(
                          //                       fontSize: 16,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xff0088C6))),
                          //               SizedBox(height: 5),
                          //               Text(
                          //                   'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                          //                   maxLines: 2,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   style: GoogleFonts.kanit(
                          //                       fontSize: 14,
                          //                       color: Colors.black)),
                          //               SizedBox(height: 10),
                          //               Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.start,
                          //                 children: [
                          //                   Flexible(
                          //                     child: FaIcon(
                          //                       FontAwesomeIcons.solidClock,
                          //                       size: 12,
                          //                       color: Color(0xff0088C6),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 5,
                          //                   ),
                          //                   Flexible(
                          //                     child: Text(
                          //                       "16-06-2564",
                          //                       maxLines: 1,
                          //                       overflow: TextOverflow.ellipsis,
                          //                       style: GoogleFonts.kanit(
                          //                         fontSize: 12,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: Colors.grey,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 10,
                          //                   ),
                          //                   Flexible(
                          //                     child: FaIcon(
                          //                       FontAwesomeIcons.solidEye,
                          //                       size: 12,
                          //                       color: Color(0xff0088C6),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 5,
                          //                   ),
                          //                   Flexible(
                          //                     child: Text(
                          //                       "50,000",
                          //                       maxLines: 1,
                          //                       overflow: TextOverflow.ellipsis,
                          //                       style: GoogleFonts.kanit(
                          //                         fontSize: 12,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: Colors.grey,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 20),
                          // Container(
                          //   padding:
                          //       EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.grey.withOpacity(0.1),
                          //           spreadRadius: 2,
                          //           blurRadius: 2,
                          //           offset: Offset(0, 2),
                          //         )
                          //       ],
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(20))),
                          //   height: 130,
                          //   child: Row(
                          //     children: <Widget>[
                          //       Container(
                          //         width: 150,
                          //         padding: EdgeInsets.all(20),
                          //         decoration: BoxDecoration(
                          //             image: DecorationImage(
                          //                 fit: BoxFit.cover,
                          //                 image: AssetImage('images/1150.png')),
                          //             color: Colors.amber,
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(20))),
                          //       ),
                          //       Expanded(
                          //         child: Container(
                          //           // padding: EdgeInsets.only(left: 10),
                          //           decoration: BoxDecoration(
                          //               //color: Colors.red,
                          //               ),
                          //           padding:
                          //               EdgeInsets.only(left: 10, right: 10),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Text('ทำไมต้องตรวจอัลตราซาวเต้านม',
                          //                   maxLines: 1,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   style: GoogleFonts.kanit(
                          //                       fontSize: 16,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xff0088C6))),
                          //               SizedBox(height: 5),
                          //               Text(
                          //                   'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                          //                   maxLines: 2,
                          //                   overflow: TextOverflow.ellipsis,
                          //                   style: GoogleFonts.kanit(
                          //                       fontSize: 14,
                          //                       color: Colors.black)),
                          //               SizedBox(height: 10),
                          //               Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.start,
                          //                 children: [
                          //                   Flexible(
                          //                     child: FaIcon(
                          //                       FontAwesomeIcons.solidClock,
                          //                       size: 12,
                          //                       color: Color(0xff0088C6),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 5,
                          //                   ),
                          //                   Flexible(
                          //                     child: Text(
                          //                       "16-06-2564",
                          //                       maxLines: 1,
                          //                       overflow: TextOverflow.ellipsis,
                          //                       style: GoogleFonts.kanit(
                          //                         fontSize: 12,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: Colors.grey,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 10,
                          //                   ),
                          //                   Flexible(
                          //                     child: FaIcon(
                          //                       FontAwesomeIcons.solidEye,
                          //                       size: 12,
                          //                       color: Color(0xff0088C6),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 5,
                          //                   ),
                          //                   Flexible(
                          //                     child: Text(
                          //                       "50,000",
                          //                       maxLines: 1,
                          //                       overflow: TextOverflow.ellipsis,
                          //                       style: GoogleFonts.kanit(
                          //                         fontSize: 12,
                          //                         fontWeight: FontWeight.w500,
                          //                         color: Colors.grey,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 20),
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
      bottomNavigationBar: NavigagitonBar(),
    );
  }
}

final List<Widget> imageSliders = imgLists
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(0, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
final List<article> imgListss = article.imgLists();
final List<Widget> imageSliderBanner = imgListss
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: 130,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(item.img)),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.name,
                                        style: GoogleFonts.kanit(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff0088C6))),
                                    Text(item.contact,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.kanit(
                                            fontSize: 14, color: Colors.black)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.solidClock,
                                          size: 12,
                                          color: Color(0xff0088C6),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          item.date,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.kanit(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.solidEye,
                                          size: 12,
                                          color: Color(0xff0088C6),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          item.view,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.kanit(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ))
    .toList();
