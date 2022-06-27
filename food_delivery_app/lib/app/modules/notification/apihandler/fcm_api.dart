import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FcmApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<bool> postFcmToken(String? fcmToken) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken_ship");
    var response = await client.post(Uri.parse("$baseURL/user/fcm-token"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode({
          "token": fcmToken ?? '',
        }));
    print("Fcm" + response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}