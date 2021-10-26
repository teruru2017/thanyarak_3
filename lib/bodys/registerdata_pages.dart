import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/password_pages.dart';

class registerdata_pages extends StatefulWidget {
  registerdata_pages({Key? key}) : super(key: key);

  @override
  _registerdata_pagesState createState() => _registerdata_pagesState();
}

class _registerdata_pagesState extends State<registerdata_pages> {
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
                    width: 400,
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
              height: 900,
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
                  SizedBox(height: 20),
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

                              prefixIcon: Icon(Icons.person),
                              labelText: 'เลขบัตรประจำตัวประชาชน',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'prefixname',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.person),
                              labelText: 'คำนำหน้าชื่อ',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'name',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.person),
                              labelText: 'ชื่อ-นามสกุล',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'birthday',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.calendar_today),
                              labelText: 'วัน/เดือน/ปีเกิด',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'age',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.calendar_today),
                              labelText: 'อายุ',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'tel',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.phone),
                              labelText: 'เบอร์โทรศัพท์',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'address',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.home_filled),
                              labelText: 'ที่อยู่',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'email',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.mail),
                              labelText: 'อีเมลล์',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'congenital',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.person),
                              labelText: 'โรคประจำตัว โปรดระบุ',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'allergy',
                          obscureText: true,
                          style: GoogleFonts.kanit(),

                          decoration: InputDecoration(
                              //border: InputBorder.none,

                              prefixIcon: Icon(Icons.person),
                              labelText: 'อาการแพ้ โปรดระบุ',
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(10))),
                              fillColor: Color(0xfff3f3f4),
                              filled: false),
                          // valueTransformer: (text) => num.tryParse(text),
                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(context,
                          //       errorText: 'กรุณากรอกรหัสผ่าน'),
                          // ]),
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
                              builder: (context) => password_pages()));
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
