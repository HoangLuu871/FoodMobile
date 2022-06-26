import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResVoucherApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<dynamic> getVouchers() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.get(Uri.parse("$baseURL/owner/voucher"), headers: <String, String>{
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

  static Future<bool> addVoucher({String? name, String? paymentMethod, String? totalPay}) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.post(Uri.parse("$baseURL/owner/voucher"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode({
          "name": name ?? '',
          "paymentMethod": paymentMethod ?? '',
          "totalPay": totalPay ?? ''
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> removeVoucher({dynamic id}) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    var response = await client.delete(
      Uri.parse("$baseURL/owner/voucher/$id"),
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
