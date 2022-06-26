import 'package:ecommerce_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce_flutter/app/modules/notification/controllers/notification_controllers.dart';
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
  NotificationController notiController = Get.put(NotificationController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.isLoginProcessing.value
            ? Center(
          child: CircularProgressIndicator(
            backgroundColor: const Color(0xFFFFFFFF),
            color: AppColors.mainColor,
            strokeWidth: 4,
          ),
        ) : SingleChildScrollView(
          child: Obx(() {
            return Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.getProportionateScreenHeight(85)),
                      Center(
                        child: Image.asset("assets/image/text-icon-logo.png"),
                      ),
                      SizedBox(height: Dimensions.getProportionateScreenHeight(10)),
                      Center(
                        child: Text(
                          "Đối tác nhà hàng",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            color: AppColors.mainColor,
                            fontSize: Dimensions.getProportionateScreenHeight(18),
                          ),
                        ),
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
                          cursorColor: AppColors.mainColor,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: Dimensions.getProportionateScreenHeight(20),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              CustomIcons.account_circle,
                              color: Color.fromARGB(153, 160, 160, 160),
                            ),
                            hintText: "Nhập tài khoản",
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFbc2c3d))),
                            hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: Dimensions.getProportionateScreenHeight(20),
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(153, 160, 160, 160)),
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
                          cursorColor: AppColors.mainColor,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: Dimensions.getProportionateScreenHeight(20),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(153, 160, 160, 160),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(controller.isObscure.value
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye),
                              color: const Color.fromARGB(153, 160, 160, 160),
                              onPressed: () {
                                controller.isObscure.value = !controller.isObscure.value;
                              },
                            ),
                            hintText: "Nhập mật khẩu",
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFbc2c3d))),
                            hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: Dimensions.getProportionateScreenHeight(20),
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(153, 160, 160, 160)),
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
                              backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(Dimensions.getProportionateScreenHeight(5)),
                              ))),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()) {
                              setState(() {
                                controller.isLoginProcessing(true);
                              });
                              String errorMsg = await controller.authLogin(
                                  username: controller.userEditingController.text,
                                  password: controller.passEditingController.text
                              );
                              if(errorMsg != "") {
                                Get.defaultDialog(title: "Lỗi đăng nhập", middleText: errorMsg);
                              } else {
                                if(await notiController.postFcmToken()) {
                                  Get.offAllNamed("/dashboard");
                                }
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
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(onPressed: () {
                        notiController.showNotification();
                      }, child: Text(
                        "test"
                      ))
                    ],
                  ),
                ));
          }),
        );
      }),
    );
  }
}
