//@dart=2.9

import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String auth_tokens = "auth_token";
  String gets,
      tokens,
      hn,
      password,
      cid,
      pid,
      cklogin,
      img,
      phone,
      cidOTP,
      nameSET,
      phoneOTP;
  bool login;
  Future<void> setID(String auth_token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('id', auth_token);
  }
//get value from shared preferences

  Future<String> getID() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    gets = shared.getString('id');
    return gets;
  }

  Future<void> setToken(String auth_token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('tokens', auth_token);
  }

  Future<String> getToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    tokens = shared.getString('tokens');
    return tokens;
  }

  Future<void> setHN(String hn) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('hn', hn);
  }

  Future<String> getHN() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    hn = shared.getString('hn');
    return hn;
  }

  Future<void> setNAME(String nameSET) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('name', nameSET);
  }

  Future<String> getNAME() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    nameSET = shared.getString('name');
    return nameSET;
  }

  Future<void> setCID(String cid) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('cid', cid);
  }

  Future<String> getCID() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    cid = shared.getString('cid');
    return cid;
  }

  Future<void> setPID(String pid) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('pid', pid);
  }

  Future<String> getPID() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    pid = shared.getString('pid');
    return pid;
  }

  Future<void> setCID_LOGIN(String cid) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('CID_LOGIN', cid);
  }

  Future<String> getCID_LOGIN() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    cid = shared.getString('CID_LOGIN');
    return cid;
  }

  Future<void> setPHONE_LOGIN(String phone) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('PHONE_LOGIN', phone);
  }

  Future<String> getPHONE_LOGIN() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    phone = shared.getString('PHONE_LOGIN');
    return phone;
  }

  Future<void> setCheckLogin(bool login) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setBool('login', login);
  }

  Future<bool> getCheckLogin() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    login = shared.getBool('login');
    return login;
  }

  Future<void> setPassword(String password) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('password', password);
  }

  Future<String> getPassword() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    password = shared.getString('password');
    return password;
  }

  Future<void> setcklogin(String cklogin) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('cklogin', cklogin);
  }
//get value from shared preferences

  Future<String> getcklogin() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    cklogin = shared.getString('cklogin');
    return cklogin;
  }

  Future<void> setIMG(String img) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('img', img);
  }
//get value from shared preferences

  Future<String> getIMG() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    img = shared.getString('img');
    return img;
  }

  Future<void> setCIDOTP(String cidOTP) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('cid_otp', cidOTP);
    return cidOTP;
  }
//get value from shared preferences

  Future<String> getCIDOTP() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    cidOTP = shared.getString('cid_otp');
    return cidOTP;
  }

  Future<void> setPhoneOTP(String phoneOTP) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('phone_otp', phoneOTP);
    return phoneOTP;
  }
//get value from shared preferences

  Future<String> getPhoneOTP() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    phoneOTP = shared.getString('phone_otp');
    return phoneOTP;
  }
}
