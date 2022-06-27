import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashboardApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<dynamic> getOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken_ship");
    var response = await client.get(
        Uri.parse("$baseURL/shipper/order"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        }
    );
    //print(response.body);
    if(response.statusCode == 200) {
      var resJson = response.body;
      return jsonDecode(resJson);
    } else {
      return [];
    }
  }
}