import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanyarak/utility/my_constant.dart';
import 'package:thanyarak/widgets/about_widget.dart';
import 'package:thanyarak/widgets/show_title.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<String> pathImageAritcles = [
    'images/about_h.png',
  ];
  List<String> titleAritcles = [
    'ประวัติความเป็นมาของมูลนิธิถันยรักษ์ฯ',
  ];
  List<String> detailAritcles = [
    'มูลนิธิถันยรักษ์ ในพระราชูปถัมภ์สมเด็จพระศรีนครินทราบรมราชชนนีเป็นองค์กรการกุศล ลำดับที่ 271 ของกระทรวงการคลัง ได้ก่อตั้งขึ้นมาเมื่อวันที่ 9 พฤศจิกายน พ.ศ.2537 ด้วยพระมหากรุณาธิคุณของสมเด็จพระศรีนครินทราบรมราชชนนี ที่ทรงมีพระราชดำริช่วยเหลือหญิงไทยให้พ้นภัยจากมะเร็งเต้านม จึงได้พระราชทานเงินส่วนพระองค์ จำนวน 12 ล้านบาท เป็นทุนเริ่มแรก และพระราชทานชื่อมูลนิธิ “ถันยรักษ์” ทรงรับไว้ในพระราชูปถัมภ์ ทรงเป็นประธานกิตติมศักดิ์ และทรงแต่งตั้งสมเด็จพระเจ้าพี่นางเธอเจ้าฟ้ากัลยานิวัฒนา กรมหลวงนราธิวาสราชนครินทร์ เป็นประธานกรรมการมูลนิธิถันยรักษ์ฯ ซึ่งต่อมาทรงเป็นประธานกิตติมศักดิ์ และสมเด็จพระเทพรัตนราชสุดาฯ สยามบรมราชกุมารี ทรงดำรงตำแหน่งประธานกิตติมศักดิ์ตั้งแต่ปี พ.ศ. 2557 สืบมามูลนิธิถันยรักษ์ฯ ดำเนินการตามวัตถุประสงค์ เพื่อตรวจวินิจฉัยและคัดกรองโรคมะเร็งเต้านม โดยสมเด็จพระเจ้าพี่นางเธอ เจ้าฟ้ากัลยานิวัฒนา กรมหลวงนราธิวาสราชนครินทร์ ได้นำคณะกรรมการมูลนิธิถันยรักษ์ฯ มาปรึกษากับคณะกรรมการ คณะแพทยศาสตร์ศิริราชพยาบาล เมื่อพ.ศ. 2537 และได้มีมติจัดตั้งศูนย์ถันยรักษ์ ขึ้นที่โรงพยาบาลศิริราช เมื่อปี พ.ศ. 2538 ตลอด 20 ปีที่ผ่านมา ศูนย์ถันยรักษ์ได้รับความร่วมมืออย่างดียิ่ง จากคณะแพทยศาสตร์ศิริราชพยาบาล',
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
            listArticle(),
            SizedBox(
              height: 6,
            ),
            const AboutHead(title: 'คณะกรรมการมูลนิธิถันยรักษ์ฯ'),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'images/princess.png',
                    width: 140,
                    height: 184,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'สมเด็จพระกนิษฐาธิราชเจ้ากรมสมเด็จพระเทพรัตนราชสุดาเจ้าฟ้ามหาจักรีสิรินธร มหาวชิราลงกรณวรราชภักดี สิริกิจการิณีพีรยพัฒนรัฐสีมาคุณากรปิยชาติสยามบรมราชกุมารี',
                        style: GoogleFonts.kanit(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 17,
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
                                'ประธานกิตติมศักดิ์',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildHead() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/about.png'), fit: BoxFit.cover),
      ),
      // width: double.infinity,
      height: 100,
      child: ListTile(
        title: ShowTitle(
          title: 'เกี่ยวกับเรา',
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  'images/about_h.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ShowTitle(
                title: cutWordH(
                  'ประวัติความเป็นมาของมูลนิธิถันยรักษ์ฯ',
                ),
                textStyle: MyConstant().h1StyleBlue(),
              ),
            ),
          ),
          Container(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShowTitle(
                title: cutWord(
                  'มูลนิธิถันยรักษ์ ในพระราชูปถัมภ์สมเด็จพระศรีนครินทราบรมราชชนนีเป็นองค์กรการกุศล ลำดับที่ 271 ของกระทรวงการคลัง ได้ก่อตั้งขึ้นมาเมื่อวันที่ 9 พฤศจิกายน พ.ศ.2537 ด้วยพระมหากรุณาธิคุณของสมเด็จพระศรีนครินทราบรมราชชนนี ที่ทรงมีพระราชดำริช่วยเหลือหญิงไทยให้พ้นภัยจากมะเร็งเต้านม จึงได้พระราชทานเงินส่วนพระองค์ จำนวน 12 ล้านบาท เป็นทุนเริ่มแรก และพระราชทานชื่อมูลนิธิ “ถันยรักษ์” ทรงรับไว้ในพระราชูปถัมภ์ ทรงเป็นประธานกิตติมศักดิ์ และทรงแต่งตั้งสมเด็จพระเจ้าพี่นางเธอเจ้าฟ้ากัลยานิวัฒนา กรมหลวงนราธิวาสราชนครินทร์ เป็นประธานกรรมการมูลนิธิถันยรักษ์ฯ ซึ่งต่อมาทรงเป็นประธานกิตติมศักดิ์ และสมเด็จพระเทพรัตนราชสุดาฯ สยามบรมราชกุมารี ทรงดำรงตำแหน่งประธานกิตติมศักดิ์ตั้งแต่ปี พ.ศ. 2557 สืบมามูลนิธิถันยรักษ์ฯ ดำเนินการตามวัตถุประสงค์ เพื่อตรวจวินิจฉัยและคัดกรองโรคมะเร็งเต้านม โดยสมเด็จพระเจ้าพี่นางเธอ เจ้าฟ้ากัลยานิวัฒนา กรมหลวงนราธิวาสราชนครินทร์ ได้นำคณะกรรมการมูลนิธิถันยรักษ์ฯ มาปรึกษากับคณะกรรมการ คณะแพทยศาสตร์ศิริราชพยาบาล เมื่อพ.ศ. 2537 และได้มีมติจัดตั้งศูนย์ถันยรักษ์ ขึ้นที่โรงพยาบาลศิริราช เมื่อปี พ.ศ. 2538 ตลอด 20 ปีที่ผ่านมา ศูนย์ถันยรักษ์ได้รับความร่วมมืออย่างดียิ่ง จากคณะแพทยศาสตร์ศิริราชพยาบาล',
                ),
                textStyle: MyConstant().h4StyleBlack(),
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(20, 4, 4, 4),
          //       child: SvgPicture.asset('images/c1.svg'),
          //     ),
          //     ShowTitle(
          //       title: dataAritcles[index],
          //       textStyle: MyConstant().h4StyleGley(),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
          //       child: SvgPicture.asset('images/v2.svg'),
          //     ),
          //     ShowTitle(
          //       title: viewAritcles[index],
          //       textStyle: MyConstant().h4StyleGley(),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

String cutWord(String detailAritcl) {
  String resutl = detailAritcl;
  if (resutl.length >= 1500) {
    resutl = resutl.substring(0, 750);
    resutl = '$resutl ....';
  }
  return resutl;
}

String cutWordH(String titleAritcles) {
  String resutl = titleAritcles;
  if (resutl.length >= 50) {
    resutl = resutl.substring(0, 25);
    resutl = '$resutl ....';
  }
  return resutl;
}
