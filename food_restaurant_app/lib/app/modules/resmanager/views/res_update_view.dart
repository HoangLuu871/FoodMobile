import 'package:ecommerce_flutter/app/modules/resmanager/controllers/res_update_controller.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/controllers/resmanager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/icons.dart';

class ResUpdateView extends StatefulWidget {
  const ResUpdateView({Key? key}) : super(key: key);

  @override
  State<ResUpdateView> createState() => _ResUpdateViewState();
}

class _ResUpdateViewState extends State<ResUpdateView> {
  ResUpdateController controller = Get.put(ResUpdateController());
  ResManagerController managerController = Get.put(ResManagerController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(0xFFbc2c3d)),
          foregroundColor: Colors.black,
          title: Text(
            "Chỉnh sửa thông tin nhà hàng",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.getProportionateScreenWidth(20)),
          ),
        ),
        body: Obx(() {
          return controller.isDataProcessing.value
              ? Container(
                  height: Dimensions.screenHeight,
                  width: Dimensions.screenWidth,
                  color: const Color(0x90FFFFFF),
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: const Color(0xF7F4F4F4),
                      color: AppColors.mainColor,
                      strokeWidth: 4,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset("assets/image/text-icon-logo.png"),
                        ),
                        SizedBox(
                          height: Dimensions.getProportionateScreenHeight(10),
                        ),
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
                        SizedBox(
                          height: Dimensions.getProportionateScreenHeight(20),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.getProportionateScreenWidth(25),
                                right: Dimensions.getProportionateScreenWidth(25)),
                            child: Text(
                              "Tên nhà hàng: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimensions.getProportionateScreenHeight(16)),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.getProportionateScreenWidth(25),
                              right: Dimensions.getProportionateScreenWidth(25)),
                          child: TextFormField(
                            validator: ((value) =>
                                value!.trim().isEmpty ? "Thông tin này không được để trống" : null),
                            controller: controller.nameEditingController,
                            cursorColor: AppColors.mainColor,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: Dimensions.getProportionateScreenHeight(18),
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CustomIcons.fastfood,
                                color: Color.fromARGB(153, 160, 160, 160),
                              ),
                              hintText: "Nhập tên nhà hàng",
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFbc2c3d))),
                              hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: Dimensions.getProportionateScreenHeight(16),
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(153, 160, 160, 160)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.getProportionateScreenHeight(20),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.getProportionateScreenWidth(25),
                                right: Dimensions.getProportionateScreenWidth(25)),
                            child: Text(
                              "Địa chỉ nhà hàng:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimensions.getProportionateScreenHeight(16)),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.getProportionateScreenWidth(25),
                              right: Dimensions.getProportionateScreenWidth(25)),
                          child: TextFormField(
                            validator: ((value) =>
                                value!.trim().isEmpty ? "Thông tin này không được để trống" : null),
                            controller: controller.addressEditingController,
                            cursorColor: AppColors.mainColor,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: Dimensions.getProportionateScreenHeight(18),
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CustomIcons.image,
                                color: Color.fromARGB(153, 160, 160, 160),
                              ),
                              hintText: "Nhập địa chỉ nhà hàng",
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFbc2c3d))),
                              hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: Dimensions.getProportionateScreenHeight(16),
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(153, 160, 160, 160)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.getProportionateScreenHeight(20),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.getProportionateScreenWidth(25),
                                right: Dimensions.getProportionateScreenWidth(25)),
                            child: Text(
                              "Giờ mở cửa - đóng cửa:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimensions.getProportionateScreenHeight(16)),
                            )),
                        Row(
                          children: [
                            SizedBox(
                              width: Dimensions.getProportionateScreenWidth(150),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.getProportionateScreenWidth(25),
                                    right: Dimensions.getProportionateScreenWidth(10)),
                                child: TextFormField(
                                  validator: ((value) => value!.trim().isEmpty
                                      ? "Thông tin này không được để trống"
                                      : null),
                                  controller: controller.openTimeEditingController,
                                  cursorColor: AppColors.mainColor,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: Dimensions.getProportionateScreenHeight(18),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      CustomIcons.restaurant,
                                      color: Color.fromARGB(153, 160, 160, 160),
                                    ),
                                    hintText: "Mở cửa",
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFFbc2c3d))),
                                    hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: Dimensions.getProportionateScreenHeight(16),
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(153, 160, 160, 160)),
                                  ),
                                ),
                              ),
                            ),
                            const Text(" - "),
                            SizedBox(
                              width: Dimensions.getProportionateScreenWidth(130),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: Dimensions.getProportionateScreenWidth(10),
                                ),
                                child: TextFormField(
                                  validator: ((value) => value!.trim().isEmpty
                                      ? "Thông tin này không được để trống"
                                      : null),
                                  controller: controller.closeTimeEditingController,
                                  cursorColor: AppColors.mainColor,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: Dimensions.getProportionateScreenHeight(18),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      CustomIcons.attach_money,
                                      color: Color.fromARGB(153, 160, 160, 160),
                                    ),
                                    hintText: "Đóng cửa",
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFFbc2c3d))),
                                    hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: Dimensions.getProportionateScreenHeight(16),
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(153, 160, 160, 160)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.getProportionateScreenHeight(20),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.getProportionateScreenWidth(25),
                                right: Dimensions.getProportionateScreenWidth(25)),
                            child: Text(
                              "Link ảnh bìa nhà hàng:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimensions.getProportionateScreenHeight(16)),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.getProportionateScreenWidth(25),
                              right: Dimensions.getProportionateScreenWidth(25)),
                          child: TextFormField(
                            validator: ((value) =>
                                value!.trim().isEmpty ? "Thông tin này không được để trống" : null),
                            controller: controller.coverImageEditingController,
                            cursorColor: AppColors.mainColor,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: Dimensions.getProportionateScreenHeight(18),
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CustomIcons.image,
                                color: Color.fromARGB(153, 160, 160, 160),
                              ),
                              hintText: "Nhập link ảnh bìa",
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFbc2c3d))),
                              hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: Dimensions.getProportionateScreenHeight(16),
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(153, 160, 160, 160)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.getProportionateScreenHeight(40),
                        ),
                        Container(
                          height: Dimensions.getProportionateScreenHeight(50),
                          padding: EdgeInsets.only(
                              left: Dimensions.getProportionateScreenWidth(60),
                              right: Dimensions.getProportionateScreenWidth(60)),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.getProportionateScreenHeight(5)),
                                ))),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  controller.isDataProcessing(true);
                                });
                                bool updated = await controller.updateRes(
                                    name: controller.nameEditingController.text,
                                    address: controller.addressEditingController.text,
                                    openTime: controller.openTimeEditingController.text,
                                    closeTime: controller.closeTimeEditingController.text,
                                    coverImageLink: controller.coverImageEditingController.text);
                                if (updated) {
                                  managerController.refreshData();
                                  Get.offNamed("/resmanager");
                                } else {
                                  Get.defaultDialog(
                                      title: "Lỗi cập nhật",
                                      middleText: "Có lỗi trong quá trình cập nhật");
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cập nhật",
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
                      ],
                    ),
                  ),
                );
        }));
  }
}
