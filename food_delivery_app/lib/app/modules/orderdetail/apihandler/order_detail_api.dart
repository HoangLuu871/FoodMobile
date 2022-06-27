import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<bool> getOrderDetailById(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken_ship");
    var response = await client.put(
        Uri.parse("$baseURL/shipper/order/$id/Preparing"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        }
    );
    if(response.statusCode == 200) {
      return true;
    } else {
      print('Get order detail to preparing by id $id error');
      return false;
    }
  }

  static Future<dynamic> getOrderDetailByIdNoUpdate(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken_ship");
    var response = await client.get(
        Uri.parse("$baseURL/shipper/order/$id"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        }
    );
    print(response.body);
    if(response.statusCode == 200) {
      print('Get order detail by id np update $id oke');
      var resJson = response.body;
      return jsonDecode(resJson);
    } else {
      print('Get order detail by id no update $id error');
      return [];
    }
  }

  static Future<bool> getOrderDetailByIdDeli(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken_ship");
    var response = await client.put(
        Uri.parse("$baseURL/shipper/order/$id/Delivering"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        }
    );
    if(response.statusCode == 200) {
      print('Get order detail to deliverring by id $id oke');
      return true;
    } else {
      print('Get order detail to deliverring by id $id error');
      return false;
    }
  }

  static Future<bool> getOrderDetailByIdComp(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken_ship");
    var response = await client.put(
        Uri.parse("$baseURL/shipper/order/$id/Completed"),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        }
    );
    if(response.statusCode == 200) {
      print('Get order detail to completed by id $id oke');
      return true;
    } else {
      print('Get order detail to completed by id $id error');
      return false;
    }
  }
}