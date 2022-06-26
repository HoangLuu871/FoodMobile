import 'package:ecommerce_flutter/app/modules/login/apihandler/login_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with StateMixin {
  TextEditingController userEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  var isObscure = true.obs;
  var isLoginProcessing = false.obs;
  String errorMsg = "";

  Future<String> authLogin({String? username, String? password}) async {
    errorMsg = "";
    try {
      isLoginProcessing(true);
      List loginRes = await LoginApi.authLogin(username: username, password: password);
      print(loginRes);
      if (loginRes[0] != "") {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("accessToken", loginRes[0]);
        prefs.setString("refreshToken", loginRes[1]);
      } else {
        if (loginRes[1] == "Invalid password") {
          errorMsg = "Nhập sai mật khẩu";
        } else if (loginRes[1] == "User not found") {
          errorMsg = "Tài khoản không tồn tại";
        } else {
          errorMsg = "Vui lòng nhập đúng thông tin";
        }
      }
    } finally {
      isLoginProcessing(false);
    }
    return errorMsg;
  }

  Future<bool> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("refreshToken");
    if (token == null || token == "") {
      return false;
    }
    bool success = false;
    try {
      isLoginProcessing(true);
      List refreshRes = await LoginApi.refreshToken(refreshToken: token);
      if (refreshRes[0] != "") {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("accesstoken", refreshRes[0]);
        prefs.setString("refreshToken", refreshRes[1]);
        success = true;
      }
    } finally {
      isLoginProcessing(false);
    }
    return success;
  }

  Future<bool> authLogout() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("refreshToken");
    bool logoutRes = await LoginApi.authLogout(refreshToken: token);
    if(logoutRes) {
      prefs.remove('accessToken');
      prefs.remove('refreshToken');
    }
    return logoutRes;
  }
}
