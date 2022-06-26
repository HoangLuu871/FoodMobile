import 'package:shared_preferences/shared_preferences.dart';

class Restaurant {
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("accesstoken") ?? '';
  }
}