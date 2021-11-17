import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/otp_pages.dart';
import 'package:thanyarak/bodys/registerdata_pages.dart';

class register1_pages extends StatefulWidget {
  register1_pages({Key? key}) : super(key: key);

  @override
  _register1_pagesState createState() => _register1_pagesState();
}

enum SingingCharacter { HN, idcard }

class _register1_pagesState extends State<register1_pages> {
  SingingCharacter? _character = SingingCharacter.HN;
  String txt = "HN";

  int _selectedchoice = 0;
  int choice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/header3.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: Stack(
                      children: <Widget>[
                        // IconButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         CupertinoPageRoute(
                        //             builder: (context) => newtype_pages()));
                        //   },
                        //   icon: FaIcon(FontAwesomeIcons.chevronCircleLeft),
                        //   iconSize: 35,
                        //   color: Colors.white54,
                        //   padding: const EdgeInsets.all(25),
                        // ),
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 1.5,
                                  image: AssetImage("images/circle.png"),
                                  alignment: Alignment.center)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 1.8,
                                  image: AssetImage("images/userdata.png"),
                                  alignment: Alignment(0, 0.2))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    scale: 1.3,
                                    image: AssetImage("images/back01.png"),
                                    alignment: Alignment(-0.9, -0.7))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment(-1, -1),
                    child: Text(
                      "ลงทะเบียน",
                      style: GoogleFonts.kanit(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0088C6),
                        // fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1, -1),
                    child: Text(
                      "กรุณากรอกข้อมูลของคุณ เพื่อลงทะเบียน",
                      style: GoogleFonts.kanit(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 16,
                        color: Color(0xffB7B7B7),
                        // fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    //child: MyStatefulWidget(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Radio(
                                    value: SingingCharacter.HN,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                      txt = 'HN';
                                    },
                                  ),
                                  Expanded(
                                      child: Text('HN',
                                          style: GoogleFonts.kanit(
                                            fontSize: 16,
                                          )))
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Radio(
                                    value: SingingCharacter.idcard,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                      txt = 'เลขบัตรประจำตัวประชาชน';
                                    },
                                  ),
                                  Expanded(
                                      child: Text('เลขบัตรประจำตัวประชาชน',
                                          style: GoogleFonts.kanit(
                                            fontSize: 16,
                                          )))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    //margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormBuilderTextField(
                          name: 'id',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(12),
                                child: FaIcon(
                                  FontAwesomeIcons.idCardAlt,
                                  size: 20,
                                ),
                              ),
                              labelText: txt,
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context,
                                errorText: 'กรุณากรอกรหัสผ่าน'),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => registerdata_pages()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffE6EFFE),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff0088C6), Color(0xff43CEF8)]),
                      ),
                      child: Text(
                        "ถัดไป",
                        style: GoogleFonts.kanit(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 16,
                          color: Color(0xffFFFFFF),
                          // fontStyle: FontStyle.italic,
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
    );
  }
}
