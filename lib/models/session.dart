//@dart=2.9
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String auth_tokens = "auth_token";
  String gets;
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
}
