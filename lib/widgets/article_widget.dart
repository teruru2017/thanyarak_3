import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/article_details_page.dart';
import 'package:thanyarak/models/article_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';

class ArticleWidget extends StatelessWidget {
  final List<Article> ListArticle = Article.generateArticle();
  ArticleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
          children: ListArticle.map((e) => Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 8,
                        spreadRadius: 3,
                        offset: Offset(0, 10))
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        e.icon,
                        width: 140,
                        height: 95,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.head,
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                          ),
                        ),
                        Text(
                          e.details,
                          style: GoogleFonts.kanit(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff000000),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  e.dateTime,
                                  style: GoogleFonts.kanit(
                                      color: Colors.grey.withOpacity(0.8)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              ArticleDetailsPage()));
                                },
                                child: ShowTitle(
                                  title: 'เข้าสู่ระบบ',
                                  textStyle: MyConstant().h3StyleWhite(),
                                )),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              )).toList()),
    );
  }
}
