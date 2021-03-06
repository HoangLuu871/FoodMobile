import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResManagerApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<dynamic> getResDetail() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.get(
        Uri.parse("$baseURL/owner/restaurant"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        }
    );
    if(response.statusCode == 200) {
      var resJson = response.body;
      return jsonDecode(resJson);
    } else {
      return [];
    }
  }

  static Future<bool> updateRes(
      {String? name, String? address, String? openTime, String? closeTime, String? coverImageLink}) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.put(Uri.parse("$baseURL/owner/restaurant"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode({
          "name": name ?? '',
          "address": address ?? '',
          "openTime": openTime ?? '',
          "closeTime": closeTime ?? '',
          "coverImageLink": coverImageLink ?? ''
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
