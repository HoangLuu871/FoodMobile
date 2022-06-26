import 'package:ecommerce_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/icons.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: Obx(() {
          return Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.getProportionateScreenHeight(85)),
                    Center(
                      child: Image.asset("assets/image/text-icon-logo-second.png"),
                    ),
                    SizedBox(height: Dimensions.getProportionateScreenHeight(30)),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.getProportionateScreenWidth(25),
                          right: Dimensions.getProportionateScreenWidth(25)),
                      child: TextFormField(
                        enabled: !controller.isLoginProcessing.value,
                        validator: ((value) => value!.trim().isEmpty ? "Vui lòng nhập tài khoản" : null),
                        controller: controller.userEditingController,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: Dimensions.getProportionateScreenHeight(20),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            CustomIcons.account_circle,
                            color: Colors.white,
                          ),
                          hintText: "Nhập tài khoản",
                          errorStyle: const TextStyle(color: Colors.white),
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x85FFFFFF))),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: Dimensions.getProportionateScreenHeight(20),
                              fontWeight: FontWeight.w400,
                              color: const Color(0x85FFFFFF)),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.getProportionateScreenHeight(10)),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.getProportionateScreenWidth(25),
                          right: Dimensions.getProportionateScreenWidth(25)),
                      child: TextFormField(
                        enabled: !controller.isLoginProcessing.value,
                        validator: (String? value) => value!.trim().isEmpty ? "Vui lòng nhập mật khẩu" : null,
                        controller: controller.passEditingController,
                        obscureText: controller.isObscure.value,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: Dimensions.getProportionateScreenHeight(20),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(controller.isObscure.value
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye),
                            color: Colors.white,
                            onPressed: () {
                              controller.isObscure.value = !controller.isObscure.value;
                            },
                          ),
                          hintText: "Nhập mật khẩu",
                          errorStyle: const TextStyle(color: Colors.white),
                          errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x85FFFFFF))),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: Dimensions.getProportionateScreenHeight(20),
                              fontWeight: FontWeight.w400,
                              color: const Color(0x85FFFFFF)),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.getProportionateScreenHeight(30)),
                    Container(
                      height: Dimensions.getProportionateScreenHeight(50),
                      padding: EdgeInsets.only(
                          left: Dimensions.getProportionateScreenWidth(30),
                          right: Dimensions.getProportionateScreenWidth(30)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.getProportionateScreenHeight(5)),
                            ))),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()) {
                            String errorMsg = await controller.authLogin(
                              username: controller.userEditingController.text,
                              password: controller.passEditingController.text
                            );
                            if(errorMsg != "") {
                              Get.defaultDialog(title: "Lỗi đăng nhập", middleText: errorMsg);
                            } else {
                              //Get.offAllNamed("/dashboard");
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Đăng nhập",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: Dimensions.getProportionateScreenHeight(20),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.mainColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
