import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MenuManagerApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<dynamic> getResDetail() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.get(Uri.parse("$baseURL/owner/food"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $accessToken'
    });
    if (response.statusCode == 200) {
      var resJson = response.body;
      return jsonDecode(resJson);
    } else {
      return [];
    }
  }

  static Future<bool> updateFood(
      {dynamic id, String? name, dynamic price, dynamic prepareTime, String? imageLink}) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.put(Uri.parse("$baseURL/owner/food/$id"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode({
          "name": name ?? '',
          "price": price ?? '',
          "prepareTime": prepareTime ?? '',
          "imageLink": imageLink ?? ''
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> addFood(
      {String? name, dynamic price, dynamic prepareTime, String? imageLink}) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.post(Uri.parse("$baseURL/owner/food"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode({
          "name": name ?? '',
          "price": price ?? '',
          "prepareTime": prepareTime ?? '',
          "imageLink": imageLink ?? ''
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> removeFood({dynamic id}) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.delete(
      Uri.parse("$baseURL/owner/food/$id"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
        'Authorization': 'Bearer $accessToken'
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
