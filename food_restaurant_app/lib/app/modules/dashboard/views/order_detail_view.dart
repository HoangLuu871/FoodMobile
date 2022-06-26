import 'package:ecommerce_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ecommerce_flutter/app/modules/dashboard/controllers/order_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  OrderDetailController controller = Get.put(OrderDetailController());
  DashboardController dashboardController = Get.put(DashboardController());

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
            "Thông tin đơn hàng",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.getProportionateScreenWidth(20)),
          ),
        ),
        body: Obx(() {
          return controller.isDataProcessing.value
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: const Color(0xF7F4F4F4),
                    color: AppColors.mainColor,
                    strokeWidth: 4,
                  ),
                )
              : Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.getProportionateScreenWidth(15),
                                    bottom: Dimensions.getProportionateScreenHeight(15),
                                  ),
                                  child: Text(
                                    "Mã đơn hàng: " + controller.orderRes.value.id!.toString(),
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: Dimensions.getProportionateScreenHeight(18),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.getProportionateScreenWidth(15),
                                      bottom: Dimensions.getProportionateScreenHeight(15)),
                                  child: Text(
                                    "Đặt hàng lúc " +
                                        DateFormat("HH:mm - dd/MM/yyyy")
                                            .format(controller.orderRes.value.createdAt!),
                                    style: const TextStyle(color: Color(0xFF8B8B8B)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: Dimensions.getProportionateScreenHeight(80),
                                width: Dimensions.getProportionateScreenWidth(150),
                                child: Image.asset(
                                  controller.getStatus().imageAsset,
                                  fit: BoxFit.contain,
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.getProportionateScreenWidth(15),
                              bottom: Dimensions.getProportionateScreenHeight(5)),
                          child: Text(
                            "Người đặt hàng: " + controller.orderRes.value.user!.name!,
                            style: TextStyle(fontSize: Dimensions.getProportionateScreenHeight(16)),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          endIndent: Dimensions.getProportionateScreenWidth(15),
                          indent: Dimensions.getProportionateScreenWidth(15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: Dimensions.getProportionateScreenHeight(10),
                              left: Dimensions.getProportionateScreenWidth(15),
                              bottom: Dimensions.getProportionateScreenHeight(10)),
                          child: Row(
                            children: [
                              const Text(
                                "Trạng thái: ",
                                style: TextStyle(color: Color(0xFF8B8B8B)),
                              ),
                              Text(
                                controller.getStatus().status,
                                style: TextStyle(
                                    color: controller.getStatus().color,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          endIndent: Dimensions.getProportionateScreenWidth(15),
                          indent: Dimensions.getProportionateScreenWidth(15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Dimensions.getProportionateScreenHeight(10),
                            left: Dimensions.getProportionateScreenWidth(15),
                            right: Dimensions.getProportionateScreenWidth(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${controller.orderRes.value.foods!.length} món",
                                style: TextStyle(
                                    color: const Color(0xFF8B8B8B),
                                    fontSize: Dimensions.getProportionateScreenHeight(16)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.getProportionateScreenWidth(150)),
                                child: Text(
                                  "Tổng tiền:",
                                  style: TextStyle(
                                    color: const Color(0xFF8B8B8B),
                                    fontSize: Dimensions.getProportionateScreenHeight(16),
                                  ),
                                ),
                              ),
                              Text(
                                NumberFormat("#,##0", "en_US")
                                        .format(controller.orderRes.value.subTotal!) +
                                    "đ",
                                style: TextStyle(
                                    color: const Color(0xFF8B8B8B),
                                    fontSize: Dimensions.getProportionateScreenHeight(16),
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.getProportionateScreenHeight(20),
                    ),
                    Container(
                      height: Dimensions.getProportionateScreenHeight(30),
                      padding: EdgeInsets.only(
                          left: Dimensions.getProportionateScreenWidth(170),
                          right: Dimensions.getProportionateScreenWidth(20)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all((controller.checkPending())
                                ? AppColors.mainColor
                                : const Color(0xFFC9C9C9)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.getProportionateScreenHeight(5)),
                            ))),
                        onPressed: (!controller.checkPending())
                            ? null
                            : () async {
                                setState(() {
                                  controller.isDataProcessing(true);
                                });
                                bool success =
                                    await controller.confirmOrder(controller.orderRes.value.id!);
                                if (success) {
                                  dashboardController.refreshData();
                                  Get.offNamed("/dashboard");
                                }
                              },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (controller.checkPending()) ? "Xác nhận đơn" : "Đơn đã xác nhận",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: Dimensions.getProportionateScreenHeight(16),
                                  fontWeight: FontWeight.w400,
                                  color: (controller.checkPending())
                                      ? Colors.white
                                      : const Color(0xFF454545)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding:
                              EdgeInsets.only(top: Dimensions.getProportionateScreenHeight(10)),
                          itemCount: controller.orderRes.value.foods!.length,
                          itemBuilder: (context, index) => Container(
                                height: Dimensions.getProportionateScreenHeight(100),
                                decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Color(0xFFDEDEDE)),
                                    ),
                                    color: Colors.white),
                                child: Padding(
                                  padding:
                                      EdgeInsets.all(Dimensions.getProportionateScreenHeight(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.network(
                                            controller.orderRes.value.foods!
                                                .elementAt(index)
                                                .imageLink!,
                                            fit: BoxFit.cover,
                                            width: Dimensions.getProportionateScreenHeight(70),
                                            height: Dimensions.getProportionateScreenHeight(70),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: Dimensions.getProportionateScreenWidth(15)),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.orderRes.value.foods!
                                                      .elementAt(index)
                                                      .name!,
                                                  style: TextStyle(
                                                    fontSize:
                                                        Dimensions.getProportionateScreenHeight(15),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      Dimensions.getProportionateScreenHeight(7),
                                                ),
                                                Text(
                                                  "Thời gian chuẩn bị: " +
                                                      (controller.orderRes.value.foods!
                                                                  .elementAt(index)
                                                                  .prepareTime! *
                                                              10)
                                                          .toString() +
                                                      " phút",
                                                  style: TextStyle(
                                                      fontSize:
                                                          Dimensions.getProportionateScreenHeight(
                                                              13),
                                                      fontWeight: FontWeight.w500,
                                                      color: const Color(0xFF727272)),
                                                ),
                                                SizedBox(
                                                  height:
                                                      Dimensions.getProportionateScreenHeight(7),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      NumberFormat("#,##0", "en_US").format(
                                                              controller.orderRes.value.foods!
                                                                  .elementAt(index)
                                                                  .price) +
                                                          "đ",
                                                      style: TextStyle(
                                                        fontSize:
                                                            Dimensions.getProportionateScreenHeight(
                                                                17),
                                                        fontWeight: FontWeight.w700,
                                                        color: const Color(0xFF5E5E5E),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ],
                );
        }));
  }
}
