//@dart=2.9
import 'dart:convert';

class OtpGet {
  String message;
  String otpRef;
  OtpGet({
    this.message,
    this.otpRef,
  });

  factory OtpGet.fromJson(Map<String, dynamic> json) {
    return OtpGet(
      message: json["message"] == null ? null : json["message"],
      otpRef: json["OTPRef"] == null ? null : json["OTPRef"],
    );
  }
}
