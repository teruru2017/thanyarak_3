import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:thanyarak/bodys/history_details_page.dart';
import 'package:thanyarak/models/history_model.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/show_title.dart';

class HistoryWidget extends StatelessWidget {
  final List<historys> Listhistorys = historys.generatehistorys();
  HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
          children: Listhistorys.map(
        (e) => GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryWidget()));
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
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
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    e.icon,
                    width: 50,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.head,
                        style: GoogleFonts.kanit(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0088C6),
                        ),
                      ),
                      // Text(
                      //   e.details,
                      //   style: GoogleFonts.kanit(
                      //     textStyle: Theme.of(context).textTheme.headline4,
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.w300,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 4, 4, 4),
                                    child: SvgPicture.asset('images/c1.svg'),
                                  ),
                                  ShowTitle(
                                    title: e.dateTime,
                                    textStyle: MyConstant().h5StyleGley(),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 4, 4, 4),
                                    child: Text('|'),
                                  ),
                                  ShowTitle(
                                    title: e.Times,
                                    textStyle: MyConstant().h5StyleGley(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Container(
                                  // decoration: BoxDecoration(
                                  //     color: Colors.grey.shade200,
                                  //     borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(
                                    Icons.navigate_next,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ).toList()),
    );
  }
}
