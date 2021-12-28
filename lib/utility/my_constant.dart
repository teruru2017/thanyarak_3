import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  //field
  static String routeMainHome = '/mainHome';
  static Color myBlue = const Color(0XFF71BBFC);
  static Color myBlue2 = const Color(0XFFe6effe);
  String pathAPI = "https://truethanyarak.com/api/Ar_List.php";
  // method
  TextStyle h1StyleWhite() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  TextStyle h1StyleBlue() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Color(0xff0088C6),
        ),
      );
  TextStyle h2StyleWhite() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );
  TextStyle h2StyleBack() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      );
  TextStyle h2StyleBlue() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.blue,
        ),
      );
  TextStyle h3StyleWhite() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      );
  TextStyle h3Style() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      );
  TextStyle h3StyleWeigth() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      );
  TextStyle h4StyleGley() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      );
  TextStyle h5StyleGley() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      );
  TextStyle h4StyleBlack() => GoogleFonts.kanit(
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      );
}
