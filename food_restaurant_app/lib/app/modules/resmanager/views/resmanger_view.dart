import 'package:ecommerce_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/controllers/resmanager_controller.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/views/res_update_view.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/views/res_voucher_view.dart';
import 'package:ecommerce_flutter/utils/star_rating.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/drawer_navigation.dart';
import '../../../../utils/icons.dart';
import '../../../main.dart';

class ResManagerView extends StatefulWidget {
  const ResManagerView({Key? key}) : super(key: key);

  @override
  State<ResManagerView> createState() => _ResManagerViewState();
}

class _ResManagerViewState extends State<ResManagerView> {
  final LoginController loginController = Get.put(LoginController());
  final ResManagerController controller = Get.put(ResManagerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryBackgroundColor,
        drawer: const DrawerNavigationWidget(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(0xFFbc2c3d)),
          title: Text(
            "Quản lý Nhà hàng",
            style: TextStyle(
                color: AppColors.mainColor,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.getProportionateScreenWidth(20)),
          ),
        ),
        body: Obx(() {
          return controller.isDataProcessing.value
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.secondaryBackgroundColor,
                    color: AppColors.mainColor,
                    strokeWidth: 4,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: Dimensions.getProportionateScreenHeight(200),
                            width: Dimensions.screenWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.getProportionateScreenWidth(30),
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(controller.resData.value.coverImageLink!))),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: Dimensions.getProportionateScreenHeight(220),
                            width: Dimensions.screenWidth,
                            margin: EdgeInsets.only(
                                top: Dimensions.getProportionateScreenHeight(150),
                                left: Dimensions.getProportionateScreenWidth(10),
                                right: Dimensions.getProportionateScreenWidth(10)),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.getProportionateScreenWidth(25)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Dimensions.getProportionateScreenWidth(10),
                                right: Dimensions.getProportionateScreenWidth(10),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Dimensions.getProportionateScreenHeight(15),
                                  ),
                                  Text(
                                    controller.resData.value.name!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimensions.getProportionateScreenHeight(28),
                                      color: const Color(0xff4b4a4a),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.getProportionateScreenHeight(5),
                                  ),
                                  Text(
                                    controller.resData.value.address!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimensions.getProportionateScreenHeight(16),
                                      color: const Color(0xff959595),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.getProportionateScreenHeight(10),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.getProportionateScreenWidth(15)),
                                        child: Text(
                                          "Đánh giá: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimensions.getProportionateScreenHeight(18),
                                            color: const Color(0xff959595),
                                          ),
                                        ),
                                      ),
                                      StarRating(
                                          rating:
                                              double.parse(controller.resData.value.avgRating!) / 2,
                                          color: const Color(0xFFF8B309),
                                          color2: const Color(0xFFF8B309)),
                                      Text(
                                        " (" +
                                            controller.resData.value.avgRating! +
                                            "/10 " +
                                            controller.resData.value.totalReviews! +
                                            ")",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: Dimensions.getProportionateScreenHeight(18),
                                          color: const Color(0xff959595),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.getProportionateScreenHeight(10),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.getProportionateScreenWidth(15)),
                                        child: Text(
                                          "Giờ mở cửa: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimensions.getProportionateScreenHeight(18),
                                            color: const Color(0xff959595),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        CustomIcons.access_time,
                                        color: const Color(0xff959595),
                                        size: Dimensions.getProportionateScreenHeight(20),
                                      ),
                                      Text(
                                        " " +
                                            controller.resData.value.openTime! +
                                            " - " +
                                            controller.resData.value.closeTime!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: Dimensions.getProportionateScreenHeight(18),
                                          color: const Color(0xff23890b),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.getProportionateScreenHeight(10),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.getProportionateScreenWidth(15)),
                                        child: Text(
                                          "Khoảng giá: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimensions.getProportionateScreenHeight(18),
                                            color: const Color(0xff959595),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller.resData.value.priceRange!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: Dimensions.getProportionateScreenHeight(18),
                                          color: const Color(0xff959595),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(20),
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(50),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(AppColors.secondaryBackgroundColor),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ))),
                        onPressed: () => {
                          Get.to(() => const ResVoucherView())
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  CustomIcons.discount,
                                  color: Color(0x7C000000),
                                ),
                                SizedBox(
                                  width: Dimensions.getProportionateScreenWidth(5),
                                ),
                                Text(
                                  "Cập nhật Vouchers",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: Dimensions.getProportionateScreenHeight(18),
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0x7C000000)),
                                )
                              ],
                            ),
                            const Icon(
                              CustomIcons.arrow_forward_rounded,
                              color: Color(0x7C000000),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(50),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(AppColors.secondaryBackgroundColor),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ))),
                        onPressed: () {
                          Get.to(() => const ResUpdateView(),
                              arguments: [
                                controller.resData.value.name!,
                                controller.resData.value.address!,
                                controller.resData.value.openTime!,
                                controller.resData.value.closeTime!,
                                controller.resData.value.coverImageLink!
                              ],
                              preventDuplicates: true);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  CustomIcons.edit,
                                  color: Color(0x7C000000),
                                ),
                                SizedBox(
                                  width: Dimensions.getProportionateScreenWidth(5),
                                ),
                                Text(
                                  "Chỉnh sửa thông tin",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: Dimensions.getProportionateScreenHeight(18),
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0x7C000000)),
                                )
                              ],
                            ),
                            const Icon(
                              CustomIcons.arrow_forward_rounded,
                              color: Color(0x7C000000),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(50),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(AppColors.secondaryBackgroundColor),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ))),
                        onPressed: () async {
                          bool logoutSuccess = await loginController.authLogout();
                          if (logoutSuccess) {
                            Get.offAllNamed("/splashscreen");
                          } else {
                            Get.defaultDialog(
                                title: "Lỗi đăng xuất", middleText: "Đăng xuất thất bại");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  CustomIcons.logout,
                                  color: Color(0x7C000000),
                                ),
                                SizedBox(
                                  width: Dimensions.getProportionateScreenWidth(5),
                                ),
                                Text(
                                  "Đăng xuất",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: Dimensions.getProportionateScreenHeight(18),
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0x7C000000)),
                                )
                              ],
                            ),
                            const Icon(
                              CustomIcons.arrow_forward_rounded,
                              color: Color(0x7C000000),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(10),
                    ),
                  ],
                ));
        }));
  }
}
