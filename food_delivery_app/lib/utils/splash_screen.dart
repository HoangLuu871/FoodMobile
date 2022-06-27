import 'dart:async';

import 'package:ecommerce_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce_flutter/utils/colors.dart';
import 'package:ecommerce_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/modules/orderdetail/views/orderdetail_view.dart';

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
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void navigateToRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("accessToken_ship");
    String? haveOrder = prefs.getString("haveOrder_ship");
    if (accessToken != null) {
      if(haveOrder != null) {
        Get.offAll(() => const OrderDetailView(),
            arguments: int.parse(haveOrder));
      } else {
        Get.offAllNamed("/dashboard");
      }
    } else {
      Get.offAllNamed("/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.mainColor,
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
                          image: AssetImage('assets/image/icon-logo-second.png'), fit: BoxFit.contain))),
              SizedBox(
                height: Dimensions.getProportionateScreenHeight(20),
              ),
              CircularProgressIndicator(
                backgroundColor: AppColors.mainColor,
                color: Colors.white,
                strokeWidth: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
