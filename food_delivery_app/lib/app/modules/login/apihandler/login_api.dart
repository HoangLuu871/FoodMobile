import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/login_res.dart';
import '../models/error_res.dart';

class LoginApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<List> authLogin({String? username, String? password}) async {
    var response = await client.post(Uri.parse("$baseURL/auth/login"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{"username": username ?? '', "password": password ?? ''}));
    if (response.statusCode == 200) {
      var resJson = response.body;
      var loginRes = loginRespFromJson(resJson);
      print("AccessToken: " + loginRes.accesstoken);
      if (loginRes != null) {
        return [loginRes.accesstoken, loginRes.refreshtoken];
      } else {
        return ["", "Error in getting token"];
      }
    } else {
      var resJson = response.body;
      var errorRes = errorRespFromJson(resJson);
      print("ErrorLogin: " + errorRes.error.message);
      if (errorRes == null) {
        return ["", "Error in getting msg about login error"];
      } else {
        return ["", errorRes.error.message];
      }
    }
  }

  static Future<List> refreshToken({String? refreshToken}) async {
    var response = await client.post(Uri.parse("$baseURL/auth/refresh-token"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode({"refreshtoken": refreshToken}));
    if (response.statusCode == 200) {
      var resJson = response.body;
      if (resJson.contains("accesstoken") == false) return ["", "Error in refreshing token"];
      var loginRes = loginRespFromJson(resJson);
      if (loginRes != null) {
        return [loginRes.accesstoken, loginRes.refreshtoken];
      } else {
        return ["", "Error in refreshing token"];
      }
    } else {
      var errorJson = response.body;
      var errorRes = errorRespFromJson(errorJson);
      if (errorRes == null) {
        return ["", "Error in getting msg about refresh token error"];
      } else {
        return ["", errorRes.error.message];
      }
    }
  }

  static Future<bool> authLogout({String? refreshToken}) async {
    var response = await client.post(Uri.parse("$baseURL/auth/logout"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode({"refreshtoken": refreshToken}));
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
