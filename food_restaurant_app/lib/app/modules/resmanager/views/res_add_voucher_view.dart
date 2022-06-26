import 'package:ecommerce_flutter/app/modules/resmanager/controllers/res_voucher_controller.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/views/res_voucher_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/icons.dart';

class ResAddVoucherView extends StatefulWidget {
  const ResAddVoucherView({Key? key}) : super(key: key);

  @override
  State<ResAddVoucherView> createState() => _ResAddVoucherViewState();
}

class _ResAddVoucherViewState extends State<ResAddVoucherView> {
  ResVoucherController controller = Get.put(ResVoucherController());
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
          "Thêm voucher",
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
                        child: Image.asset(
                          "assets/image/voucher_thumb.png",
                          fit: BoxFit.contain,
                          width: Dimensions.getProportionateScreenWidth(200),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.getProportionateScreenHeight(10),
                      ),
                      Center(
                        child: Text(
                          "Voucher nhà hàng",
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
                            "Tên voucher:",
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
                          controller: controller.voucherNameEditingController,
                          cursorColor: AppColors.mainColor,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: Dimensions.getProportionateScreenHeight(18),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              CustomIcons.discount,
                              color: Color.fromARGB(153, 160, 160, 160),
                            ),
                            hintText: "Nhập tên voucher",
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
                            "Phương thức thanh toán áp dụng:",
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
                          controller: controller.paymentEditingController,
                          cursorColor: AppColors.mainColor,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: Dimensions.getProportionateScreenHeight(18),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              CustomIcons.account_balance_wallet,
                              color: Color.fromARGB(153, 160, 160, 160),
                            ),
                            hintText: "Nhập phương thức thanh toán",
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
                            "Tổng giá trị: ",
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
                          controller: controller.totalEditingController,
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
                            hintText: "Nhập tổng giá trị",
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
                              bool added = await controller.addVoucher(
                                  name: controller.voucherNameEditingController.text,
                                  paymentMethod: controller.paymentEditingController.text,
                                  totalPay: controller.totalEditingController.text);
                              if (added) {
                                controller.refreshData();
                                Get.back();
                              } else {
                                Get.defaultDialog(
                                    title: "Lỗi thêm mới",
                                    middleText: "Có lỗi trong quá trình thêm mới");
                              }
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Thêm voucher",
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
      }),
    );
  }
}
