import 'package:ecommerce_flutter/app/modules/menumanager/controllers/menu_update_controller.dart';
import 'package:ecommerce_flutter/app/modules/menumanager/controllers/menumanager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/icons.dart';

class MenuUpdateView extends StatefulWidget {
  const MenuUpdateView({Key? key}) : super(key: key);

  @override
  State<MenuUpdateView> createState() => _MenuUpdateViewState();
}

class _MenuUpdateViewState extends State<MenuUpdateView> {
  MenuUpdateController controller = Get.put(MenuUpdateController());
  MenuManagerController managerController = Get.put(MenuManagerController());
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
            "Chỉnh sửa thông tin món ăn",
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
                        SizedBox(height: Dimensions.getProportionateScreenHeight(20),),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.getProportionateScreenWidth(25),
                                right: Dimensions.getProportionateScreenWidth(25)),
                            child: Text(
                              "Tên món ăn:",
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
                            controller: controller.foodNameEditingController,
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
                              hintText: "Nhập tên món ăn",
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
                              "Đường dẫn ảnh:",
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
                            controller: controller.imageLinkEditingController,
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
                              hintText: "Nhập đường dẫn ảnh",
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
                              "Thời gian chuẩn bị:",
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
                            controller: controller.prepareEditingController,
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
                              hintText: "Nhập thời gian chuẩn bị",
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
                              "Giá tiền:",
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
                            controller: controller.priceEditingController,
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
                              hintText: "Nhập giá tiền",
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
                                bool updated = await controller.updateFood(
                                    id: controller.idEditingController.text,
                                    name: controller.foodNameEditingController.text,
                                    imageLink: controller.imageLinkEditingController.text,
                                    prepareTime: controller.prepareEditingController.text,
                                    price: controller.priceEditingController.text);
                                if (updated) {
                                  managerController.refreshData();
                                  Get.offNamed("/menumanager");
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
                        Center(
                          child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  controller.isDataProcessing(true);
                                });
                                bool updated = await controller.removeFood(
                                    id: controller.idEditingController.text);
                                if (updated) {
                                  managerController.refreshData();
                                  Get.offNamed("/menumanager");
                                } else {
                                  Get.defaultDialog(
                                      title: "Lỗi xóa",
                                      middleText: "Có lỗi trong quá trình xóa thức ăn");
                                }
                              },
                              child: Text(
                                "Xóa món ăn?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.mainColor,
                                  fontSize: Dimensions.getProportionateScreenHeight(16),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                );
        }));
  }
}
