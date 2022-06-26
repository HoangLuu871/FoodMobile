import 'dart:async';

import 'package:ecommerce_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce_flutter/utils/colors.dart';
import 'package:ecommerce_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginController controller = Get.put(LoginController());

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateToRoute();
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void navigateToRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("accessToken");
    if (accessToken != null) {
      Get.offAllNamed("/dashboard");
    } else {
      Get.offAllNamed("/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: Dimensions.screenHeight,
            width: Dimensions.screenWidth,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: Dimensions.getProportionateScreenWidth(200),
                    height: Dimensions.getProportionateScreenHeight(100),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/icon-logo.png'), fit: BoxFit.contain))),
                SizedBox(
                  height: Dimensions.getProportionateScreenHeight(10),
                ),
                Text(
                  "Đối tác nhà hàng",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainColor,
                    fontSize: Dimensions.getProportionateScreenHeight(18),
                  ),
                ),
                SizedBox(
                  height: Dimensions.getProportionateScreenHeight(20),
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: AppColors.mainColor,
                  strokeWidth: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
