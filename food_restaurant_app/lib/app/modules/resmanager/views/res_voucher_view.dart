import 'package:ecommerce_flutter/app/modules/resmanager/controllers/res_voucher_controller.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/views/res_add_voucher_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/icons.dart';

class ResVoucherView extends StatefulWidget {
  const ResVoucherView({Key? key}) : super(key: key);

  @override
  State<ResVoucherView> createState() => _ResVoucherViewState();
}

class _ResVoucherViewState extends State<ResVoucherView> {
  ResVoucherController controller = Get.put(ResVoucherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF7F4F4F4),
      body: NestedScrollView(
        controller: controller.scrollController,
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return <Widget>[
            SliverAppBar(
              iconTheme: const IconThemeData(color: Color(0xFFbc2c3d)),
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vouchers",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.getProportionateScreenHeight(17)),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => const ResAddVoucherView());
                      },
                      icon: const Icon(CustomIcons.add))
                ],
              ),
              pinned: true,
              floating: false,
              forceElevated: isScrolled,
            )
          ];
        },
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.getProportionateScreenHeight(15),
                          top: Dimensions.getProportionateScreenHeight(15)),
                      child: Text(
                        "Số lượng vouchers (" + controller.voucherRes.value.count!.toString() + ")",
                        style: TextStyle(
                          fontSize: Dimensions.getProportionateScreenHeight(17),
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF5E5E5E),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            padding:
                                EdgeInsets.only(top: Dimensions.getProportionateScreenHeight(10)),
                            itemCount: controller.voucherRes.value.count!,
                            itemBuilder: (context, index) => Container(
                                  height: Dimensions.getProportionateScreenHeight(145),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(color: Color(0xFFDEDEDE)),
                                        bottom: BorderSide(color: Color(0xFFDEDEDE)),
                                      ),
                                      color: Colors.white),
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.getProportionateScreenHeight(10)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(
                                            left: Dimensions.getProportionateScreenHeight(15),
                                          top: Dimensions.getProportionateScreenHeight(15),
                                          right: Dimensions.getProportionateScreenHeight(15)
                                        ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/image/voucher_thumb.png",
                                              fit: BoxFit.contain,
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
                                                      controller.voucherRes.value.rows!
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
                                                      "Hình thức thanh toán áp dụng: " +
                                                          controller.voucherRes.value.rows!
                                                              .elementAt(index)
                                                              .paymentMethod!,
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
                                                    Text(
                                                      "Tổng giá trị: " +
                                                          NumberFormat("#,##0", "en_US").format(
                                                              controller.voucherRes.value.rows!
                                                                  .elementAt(index)
                                                                  .totalPay!) +
                                                          "đ",
                                                      style: TextStyle(
                                                        fontSize:
                                                            Dimensions.getProportionateScreenHeight(17),
                                                        fontWeight: FontWeight.w700,
                                                        color: const Color(0xFF5E5E5E),
                                                      ),
                                                    ),

                                                  ]),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              controller.isDataProcessing(true);
                                            });
                                            bool removed = await controller.removeVoucher(
                                                id: controller.voucherRes.value.rows!.elementAt(index).id!.toString());
                                            if (removed) {
                                              controller.refreshData();
                                            } else {
                                              Get.defaultDialog(
                                                  title: "Lỗi xóa",
                                                  middleText: "Có lỗi trong quá trình xóa thức ăn");
                                            }
                                          },
                                          child: Text(
                                            "Xóa voucher",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.mainColor,
                                              fontSize:
                                              Dimensions.getProportionateScreenHeight(
                                                  16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))),
                  ],
                );
        }),
      ),
    );
  }
}
