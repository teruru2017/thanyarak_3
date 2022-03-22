//@dart = 2.9
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanyarak/bodys/API/api_ArticleDetail.dart';
// import 'package:thanyarak/bodys/API/api_article_detail.dart';
import 'package:thanyarak/bodys/API/api_url.dart';
import 'package:thanyarak/bodys/article_page.dart';
import 'package:thanyarak/bodys/menu_page.dart';
import 'package:thanyarak/bodys/notification_page.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/NavigationBar.dart';
import 'package:thanyarak/widgets/msgBox_widget.dart';
import 'package:thanyarak/widgets/preview_widget.dart';
import 'package:thanyarak/widgets/show_title.dart';

class ArticleDetailsPage extends StatefulWidget {
  final String urlget;
  ArticleDetailsPage({Key key, this.urlget}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

String url, cid;
bool Favorite;

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  Future<DetailArticle> fetchData() async {
    var url = '${apiurl().urlapi}/article.php?id=${widget.urlget}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      return DetailArticle.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
    }
  }

  Future<void> checkFavorite({String userid, cmsId}) async {
    var url = '${apiurl().urlapi}/favorite.php?userId=${userid}&cmsId=${cmsId}';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      print("checkFavorite Status API :${response.statusCode}");
      //บันทึก
      setState(() {
        Favorite = true;
      });
    } else if (response.statusCode == 404) {
      setState(() {
        Favorite = false;
      });
      print("checkFavorite Status API :${response.statusCode}");
      //ไม่บันทึก
    } else {
      print("checkFavorite Status API :${response.statusCode}");
    }
  }

  Future<void> addFavorite({String userid, cmsId}) async {
    var url = '${apiurl().urlapi}/favorite.php';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
          <String, String>{"userId": "${userid}", "cmsId": "${cmsId}"}),
    );
    if (response.statusCode == 200) {
      print("checkFavorite Status API :${response.statusCode}");
      setState(() {
        Favorite = true;
      });
    } else {
      print("checkFavorite Status API :${response.statusCode}");
    }
  }

  Future<void> delFavorite({String userid, cmsId}) async {
    var url = '${apiurl().urlapi}/favorite.php';
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "userId": "${userid}",
        "listCmsId": "${cmsId}",
      }),
    );
    if (response.statusCode == 200) {
      print("delFavorite Status API :${response.statusCode}");
      setState(() {
        Favorite = false;
      });
    } else {
      print("delFavorite Status API :${response.statusCode}");
    }
    // print(response.body);
  }

  DetailArticle dataFromWebAPI;

  Future<DetailArticle> futureData;

  void initState() {
    print("_____________________________");
    print("this.page : article_details_page");
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    futureData = fetchData();
    getDATA();
  }

  Future getDATA() async {
    final SharedPreferences per = await SharedPreferences.getInstance();
    setState(() {
      cid = per.getString('cid');

      checkFavorite(cmsId: widget.urlget, userid: cid);
    });
  }

  Widget createBannerWidget(String path) => Image.asset(path);

  int _currentIndex = 0;

  bool txt = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int _w = 1, _f = 2;
    if (width <= 414) {
      _w = 2;
      _f = 1;
    }

    return WillPopScope(
      child: Scaffold(
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
                                  Container(
                                    width: 30,
                                    height: 30,
                                    // color: Colors.amber,
                                    margin: EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    Article_page()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          scale: 1,
                                          image:
                                              AssetImage("images/back01.png"),
                                          alignment: Alignment.topLeft,
                                        )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: _f,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Container(
                                        height: 40,
                                        //color: Colors.red,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'รายละเอียดบทความ',
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

                                      child: Container(
                                        //color: Colors.red,
                                        //margin: EdgeInsets.only(top: 35),
                                        // padding: EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //ปุ่มแชร์

                                            // GestureDetector(
                                            //   onTap: () {
                                            //     // Navigator.push(
                                            //     //     context,
                                            //     //     CupertinoPageRoute(
                                            //     //         builder: (context) =>
                                            //     //             NotiPage()));
                                            //   },
                                            //   child: Container(
                                            //     width: 20,
                                            //     decoration: BoxDecoration(
                                            //         image: DecorationImage(
                                            //             image: AssetImage(
                                            //                 'images/Share.png'))),
                                            //   ),
                                            // ),
                                            // SizedBox(width: 20),
                                            GestureDetector(
                                              onTap: () {
                                                if (Favorite == false) {
                                                  addFavorite(
                                                    cmsId: widget.urlget,
                                                    userid: cid,
                                                  );
                                                } else if (Favorite == true) {
                                                  delFavorite(
                                                    cmsId: widget.urlget,
                                                    userid: cid,
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                child: Icon(
                                                  // bookmark_outlined
                                                  Favorite == false
                                                      ? Icons
                                                          .bookmark_border_outlined
                                                      : Icons.bookmark_outlined,
                                                  color: Colors.white,
                                                ),
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
                            top: 110, left: 15, right: 15, bottom: 20),
                        child: FutureBuilder<DetailArticle>(
                          future: futureData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              DetailArticle ardetaildata = snapshot.data;
                              return Column(
                                children: <Widget>[
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      //color: Colors.amber,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),

                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              ardetaildata.picturePath)),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Align(
                                      child: Text(
                                        '${ardetaildata.subject}',
                                        // 'หลายๆ ท่านสงสัย ตรวจเต้านมด้วยแมมโมแกรมแล้ว ทำไมยังต้องตรวจอัลตร้าซาวนด์อีกล่ะ มันให้ผลการตรวจวินิจฉัยแตกต่างกันอย่างไร เรามีสาระความรู้มาฝากค่ะ',
                                        maxLines: 2,

                                        style: GoogleFonts.kanit(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff0088C6),
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        DateFormat('dd/MM/').format(
                                                ardetaildata.createDate) +
                                            DateFormat('yyyy').format(
                                              ardetaildata.createDate.add(
                                                Duration(days: 198195),
                                              ),
                                            ),
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
                                        ardetaildata.view.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.kanit(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Html(
                                        data:
                                            '<body>${ardetaildata.html}</body>',
                                        style: {
                                          "body": Style(
                                            maxLines: txt ? 10 : 5,
                                            fontFamily: 'kanit',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        },
                                      )),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        txt = !txt;
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(txt ? 'ย่อลง' : 'อ่านต่อ',
                                          style: GoogleFonts.kanit(
                                            fontSize: 16,
                                            color: Colors.red.shade300,
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('แกลอรี่',
                                        style: GoogleFonts.kanit(
                                          fontSize: 18,
                                          color: Colors.black,
                                        )),
                                  ),
                                  snapshot.data.gallery.length > 0
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0.8),
                                          height: 150,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  snapshot.data.gallery.length,
                                              itemBuilder: (context, index) {
                                                print(
                                                    "lenf ${snapshot.data.gallery.length}");
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      print(snapshot
                                                          .data
                                                          .gallery[index]
                                                          .filePath);
                                                    });
                                                    _Previewwidget(snapshot
                                                        .data
                                                        .gallery[index]
                                                        .filePath);
                                                  },
                                                  child: Container(
                                                    width: 150,
                                                    height: 150,
                                                    margin: EdgeInsets.only(
                                                      right: 20,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                snapshot
                                                                    .data
                                                                    .gallery[
                                                                        index]
                                                                    .filePath)),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                  ),
                                                );
                                              }),
                                        )
                                      : Container(),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            // By default show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigagitonBar(
          actionGet: 2,
        ),
      ),
      onWillPop: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => Article_page()));
      },
    );
  }

  Widget _Previewwidget(txt) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.transparent,
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder:
            (BuildContext context, Animation frist, Animation second) =>
                Previewwidget(
                  title: txt,
                ));
  }
}

String cutWord(String detailAritcles) {
  String resutl = detailAritcles;
  if (resutl.length >= 400) {
    resutl = resutl.substring(0, 200);
    resutl = '$resutl ....';
  }
  return resutl;
}

String cutWordH(String titleAritcles) {
  String resutl = titleAritcles;
  if (resutl.length >= 40) {
    resutl = resutl.substring(0, 70);
    resutl = '$resutl ....';
  }
  return resutl;
}
