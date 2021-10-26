import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/bodys/shop_detail_page.dart';
import 'package:thanyarak/models/store_models.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';

class Stores extends StatelessWidget {
  final List<Store> ListStore = Store.generateStore();
  Stores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
          children: ListStore.map((e) => Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white70,
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
                            e.dateTime,
                            style: GoogleFonts.kanit(
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.details,
                                    style: GoogleFonts.kanit(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff43CEF8)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              ShopDetailPage()));
                                },
                                child: ShowTitle(
                                  title: 'ช้อปเลย',
                                  textStyle: MyConstant().h2StyleWhite(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )).toList()),
    );
  }

  Widget _builButton() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            color: Color(0xff43CEF8), borderRadius: BorderRadius.circular(15)),
        child: Text('ช้อปเลย'));
  }
}
