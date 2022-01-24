//@dart = 2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thanyarak/bodys/success_pages.dart';
import 'package:thanyarak/models/session.dart';

class password_pages extends StatefulWidget {
  password_pages({Key key}) : super(key: key);

  @override
  _password_pagesState createState() => _password_pagesState();
}

bool password = false;
bool cfpassword = false;
bool showpassword = false;
bool showcfpassword = false;
bool _password = false;
bool _cfpassword = false;
final _formKey = GlobalKey<FormBuilderState>();

TextEditingController password1 = TextEditingController();
TextEditingController password2 = TextEditingController();
SessionManager ssr = SessionManager();

class _password_pagesState extends State<password_pages> {
  int _selectedchoice = 0;
  int choice = 0;
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  @override
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Container(
                          child: Stack(children: [
                            Container(
                              padding: EdgeInsets.only(top: 45),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(60),
                                        decoration: BoxDecoration(
                                          color: Colors.pink,
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Color(0xff43CEF8),
                                                Color(0xff43CEF8),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 70),
                                  child: Container(
                                    padding: EdgeInsets.all(60),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            scale: 1.5,
                                            image: AssetImage(
                                                "images/userdata.png"),
                                            alignment: Alignment.topCenter)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      //color: Colors.amber,
                                      image: DecorationImage(
                                          scale: 1.3,
                                          image:
                                              AssetImage("images/back01.png"),
                                          alignment: Alignment.topLeft)),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),

                    //พื้นหลังเนื้อหา
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
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
                    FormBuilder(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 220, left: 15, right: 15, bottom: 20),
                        child: Column(children: [
                          Align(
                            alignment: Alignment(-1, -1),
                            child: Text(
                              "ลงทะเบียน",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
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
                              "กรุณาตั้งรหัสผ่านของคุณ",
                              style: GoogleFonts.kanit(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
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
                                Focus(
                                  onFocusChange: (hasfocus) {
                                    setState(() {
                                      password = hasfocus;
                                      _password = false;
                                    });
                                  },
                                  child: FormBuilderTextField(
                                    name: 'password',
                                    controller: password1,
                                    obscureText:
                                        showpassword == true ? false : true,
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.kanit(fontSize: 14),
                                    decoration: InputDecoration(
                                        counterText: '',
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock_outline_rounded,
                                          color: _password == true
                                              ? Colors.red
                                              : password == true
                                                  ? Colors.blue
                                                  : Colors.grey.shade300,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showpassword = !showpassword;
                                            });
                                          },
                                          child: Icon(
                                            showpassword == false
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            color: _password == true
                                                ? Colors.red
                                                : password == true
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                          ),
                                        ),
                                        hintText: 'รหัสผ่าน',
                                        hintStyle: TextStyle(
                                          color: _password == true
                                              ? Colors.red
                                              : password == true
                                                  ? Colors.blue
                                                  : Colors.grey.shade300,
                                        ),
                                        fillColor: _password == true
                                            ? Colors.red[50]
                                            : password == true
                                                ? Colors.blue[50]
                                                : Colors.white,
                                        filled: true),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setState(() {
                                          _password = true;
                                        });
                                        return 'กรุณาระบุรหัสผ่าน 4 หลัก';
                                      } else if (value.length != 4) {
                                        setState(() {
                                          _password = true;
                                        });
                                        return 'กรุณาระบุให้ครบจำนวน 4 หลัก';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                Focus(
                                  onFocusChange: (hasfocus) {
                                    setState(() {
                                      cfpassword = hasfocus;
                                      _cfpassword = false;
                                    });
                                  },
                                  child: FormBuilderTextField(
                                    name: 'confirmpassword',
                                    controller: password2,
                                    obscureText:
                                        showcfpassword == true ? false : true,
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                    style: GoogleFonts.kanit(fontSize: 14),
                                    decoration: InputDecoration(
                                        counterText: '',
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock_outline_rounded,
                                          color: _cfpassword == true
                                              ? Colors.red
                                              : cfpassword == true
                                                  ? Colors.blue
                                                  : Colors.grey.shade300,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              showcfpassword = !showcfpassword;
                                            });
                                          },
                                          child: Icon(
                                            showcfpassword == false
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            color: _cfpassword == true
                                                ? Colors.red
                                                : cfpassword == true
                                                    ? Colors.blue
                                                    : Colors.grey.shade300,
                                          ),
                                        ),
                                        hintText: 'รหัสผ่าน',
                                        hintStyle: TextStyle(
                                          color: _cfpassword == true
                                              ? Colors.red
                                              : cfpassword == true
                                                  ? Colors.blue
                                                  : Colors.grey.shade300,
                                        ),
                                        fillColor: _cfpassword == true
                                            ? Colors.red[50]
                                            : cfpassword == true
                                                ? Colors.blue[50]
                                                : Colors.white,
                                        filled: true),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setState(() {
                                          _cfpassword = true;
                                        });
                                        return 'กรุณาระบุรหัสผ่าน 4 หลัก';
                                      } else if (value.length != 4) {
                                        setState(() {
                                          _cfpassword = true;
                                        });

                                        return 'กรุณาระบุให้ครบจำนวน 4 หลัก';
                                      } else if (password1.text !=
                                          password2.text) {
                                        setState(() {
                                          _cfpassword = true;
                                        });

                                        return 'กรุณาระบุให้รหัสผ่านให้ตรงกัน';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              _formKey.currentState.save();
                              if (_formKey.currentState.validate()) {
                                print(_formKey.currentState.value);
                                setState(() {
                                  ssr.setPassword(password1.text);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              success_pages()));
                                });
                              } else {
                                print("validation failed");
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xffE6EFFE),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff0088C6),
                                      Color(0xff43CEF8)
                                    ]),
                              ),
                              child: Text(
                                "ยืนยัน",
                                style: GoogleFonts.kanit(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 16,
                                  color: Color(0xffFFFFFF),
                                  // fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
