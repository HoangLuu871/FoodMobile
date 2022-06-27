import 'dart:convert';

import 'package:ecommerce_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ecommerce_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce_flutter/app/modules/orderdetail/controllers/orderdetail_controller.dart';
import 'package:ecommerce_flutter/app/modules/orderdetail/views/orderdetail_view.dart';
import 'package:ecommerce_flutter/utils/colors.dart';
import 'package:ecommerce_flutter/utils/dimensions.dart';
import 'package:ecommerce_flutter/utils/icons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = Get.put(DashboardController());
  LoginController loginController = Get.put(LoginController());
  OrderDetailController detailController = Get.put(OrderDetailController());
  Future<void>? _launched;

  launchURL() async {
    const String googleMapslocationUrl =
        "https://www.google.com/maps/dir/%C4%90%E1%BA%A1i+h%E1%BB%8Dc+Qu%E1%BB%91c+gia+H%C3%A0+N%E1%BB%99i,+Nh%C3%A0+%C4%91i%E1%BB%81u+h%C3%A0nh+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+Qu%E1%BB%91c+gia+H%C3%A0+N%E1%BB%99i,+Xu%C3%A2n+Th%E1%BB%A7y,+D%E1%BB%8Bch+V%E1%BB%8Dng+H%E1%BA%ADu,+C%E1%BA%A7u+Gi%E1%BA%A5y,+H%C3%A0+N%E1%BB%99i/King+Dakgalbi,+%C4%90%C6%B0%E1%BB%9Dng+H%E1%BB%93+T%C3%B9ng+M%E1%BA%ADu,+Mai+D%E1%BB%8Bch,+C%E1%BA%A7u+Gi%E1%BA%A5y,+H%C3%A0+N%E1%BB%99i/Ng.+20+%C4%90.+H%E1%BB%93+T%C3%B9ng+M%E1%BA%ADu,+Mai+D%E1%BB%8Bch,+C%E1%BA%A7u+Gi%E1%BA%A5y,+H%C3%A0+N%E1%BB%99i,+Vi%E1%BB%87t+Nam/@21.0393845,105.7785097,17z/data=!4m20!4m19!1m5!1m1!1s0x313454b55b011e49:0x9406c12dc4604160!2m2!1d105.7816301!2d21.0376713!1m5!1m1!1s0x313454b567b24125:0x572bafd33361dea2!2m2!1d105.7796872!2d21.0371614!1m5!1m1!1s0x313454ca878b2b9d:0xd7145b1f32ab41d7!2m2!1d105.7789813!2d21.038068!3e0?hl=vi";

    //final String encodedURl = Uri.encodeFull(googleMapslocationUrl);
    Uri _url = Uri.parse(googleMapslocationUrl);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Mess " + message.toString());
      print('A new Message event was published!');
      RemoteNotification notification = message.notification!;
      AndroidNotification androidNotification = message.notification!.android!;
      if (notification != null && androidNotification != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Obx(() {
          return controller.isDataProcessing.value
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.secondaryBackgroundColor,
                    color: AppColors.mainColor,
                    strokeWidth: 4,
                  ),
                )
              : NestedScrollView(
                  controller: controller.scrollController,
                  headerSliverBuilder: (BuildContext context, bool isScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        iconTheme: const IconThemeData(color: Color(0xFFbc2c3d)),
                        backgroundColor: AppColors.mainColor,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Đơn hàng",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                                onPressed: () async {
                                  setState(() {
                                    controller.isDataProcessing(true);
                                  });
                                  bool logoutSuccess = await loginController.authLogout();
                                  if (logoutSuccess) {
                                    Get.offAllNamed("/splashscreen");
                                  } else {
                                    Get.defaultDialog(
                                        title: "Lỗi đăng xuất", middleText: "Đăng xuất thất bại");
                                  }
                                },
                                icon: const Icon(
                                  CustomIcons.account_circle,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        pinned: true,
                        floating: false,
                        forceElevated: isScrolled,
                      )
                    ];
                  },
                  body: ListView.builder(
                      padding: EdgeInsets.only(top: Dimensions.getProportionateScreenHeight(10)),
                      itemCount: controller.orderLists.value.length,
                      itemBuilder: (context, index) => Container(
                            height: Dimensions.getProportionateScreenHeight(270),
                            decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0xFFDEDEDE)),
                                  bottom: BorderSide(color: Color(0xFFDEDEDE)),
                                ),
                                color: Colors.white),
                            margin: EdgeInsets.only(
                                bottom: Dimensions.getProportionateScreenHeight(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(
                                            Dimensions.getProportionateScreenHeight(15)),
                                        width: Dimensions.getProportionateScreenWidth(40),
                                        height: Dimensions.getProportionateScreenHeight(40),
                                        color: AppColors.mainColor,
                                        child: Center(
                                          child: Text(
                                            (index + 1).toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.getProportionateScreenHeight(20),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        )),
                                    Text(
                                      "#" +
                                          controller.orderLists.value
                                              .elementAt(index)
                                              .id!
                                              .toString(),
                                      style: TextStyle(
                                          color: AppColors.mainColor,
                                          fontSize: Dimensions.getProportionateScreenHeight(18),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.getProportionateScreenWidth(60)),
                                      child: Text(
                                        "Tổng tiền: ",
                                        style: TextStyle(
                                          color: const Color(0xFF8B8B8B),
                                          fontSize: Dimensions.getProportionateScreenHeight(16),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      NumberFormat("#,##0", "en_US").format(
                                              controller.orderLists.elementAt(index).grandTotal!) +
                                          "đ",
                                      style: TextStyle(
                                          color: AppColors.mainColor,
                                          fontSize: Dimensions.getProportionateScreenHeight(16),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: Dimensions.getProportionateScreenWidth(15),
                                      ),
                                      child: const Text(
                                        "Đặt hàng lúc 18:30",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: Dimensions.getProportionateScreenWidth(15),
                                      ),
                                      child: Text(
                                        "Người đặt hàng: " +
                                            controller.orderLists.elementAt(index).userName!,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.getProportionateScreenWidth(15),
                                    top: Dimensions.getProportionateScreenHeight(10),
                                  ),
                                  child: Text(
                                    controller.orderLists.elementAt(index).restaurantName!,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.getProportionateScreenWidth(15),
                                    top: Dimensions.getProportionateScreenHeight(10),
                                  ),
                                  child: Text(
                                    controller.orderLists.elementAt(index).address!,
                                    style: TextStyle(color: Color(0xFF8B8B8B)),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  endIndent: Dimensions.getProportionateScreenWidth(15),
                                  indent: Dimensions.getProportionateScreenWidth(15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: Dimensions.getProportionateScreenHeight(10),
                                        left: Dimensions.getProportionateScreenWidth(15),
                                      ),
                                      child: Row(
                                        children: const [
                                          Text(
                                            "Trạng thái: ",
                                            style: TextStyle(color: Color(0xFF8B8B8B)),
                                          ),
                                          Text(
                                            "Đang tìm tài xế ...",
                                            style: TextStyle(
                                                color: Color(0xFF6C6C6C),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: Dimensions.getProportionateScreenHeight(40),
                                      padding: EdgeInsets.only(
                                          right: Dimensions.getProportionateScreenWidth(15)),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(AppColors.mainColor),
                                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.getProportionateScreenHeight(5)),
                                            ))),
                                        onPressed: () async {
                                          setState(() {
                                            controller.isDataProcessing(true);
                                          });
                                          final prefs = await SharedPreferences.getInstance();
                                          prefs.setString("haveOrder", controller.orderLists.elementAt(index).id!.toString());
                                          if(await detailController.getOrderById(controller.orderLists.elementAt(index).id!)){
                                            Get.off(() => const OrderDetailView(),
                                                arguments: controller.orderLists.elementAt(index).id!);
                                          }

                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Nhận đơn",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize:
                                                      Dimensions.getProportionateScreenHeight(14),
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: Dimensions.getProportionateScreenWidth(15)),
                                    child: TextButton(
                                        onPressed: () => setState(() {
                                              _launched = launchURL();
                                            }),
                                        child: Text(
                                          "Tra bản đồ?",
                                          style: TextStyle(
                                              color: AppColors.mainColor,
                                              fontWeight: FontWeight.w700),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )),
                );
        }));
  }
}
