import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashboardApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<dynamic> getAllOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.get(
        Uri.parse("$baseURL/owner/order"),
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

  static Future<dynamic> getOrderByStatus(String? status) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.get(
        Uri.parse("$baseURL/owner/order?status=$status"),
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

  static Future<dynamic> getOrderByStatus2(String? status, String? status2) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.get(
        Uri.parse("$baseURL/owner/order?status=$status&status=$status2"),
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

  static Future<dynamic> getOrderDetailById(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.get(
        Uri.parse("$baseURL/owner/order?id=$id"),
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

  static Future<bool> confirmOrder(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.put(
        Uri.parse("$baseURL/owner/order/$id/Confirmed"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        }
    );
    print(response.body);
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}