//@dart=2.9
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String auth_tokens = "auth_token";
  String gets, tokens, hn, password, cid, cklogin;

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

  Future<void> setCID(String cid) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('cid', cid);
  }

  Future<String> getCID() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    cid = shared.getString('cid');
    return cid;
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
}
