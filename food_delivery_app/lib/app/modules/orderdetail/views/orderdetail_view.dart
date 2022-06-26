import 'package:ecommerce_flutter/app/modules/orderdetail/controllers/orderdetail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/icons.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  OrderDetailController controller = Get.put(OrderDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: NestedScrollView(
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
                        onPressed: () {},
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
                                      "Mã đơn hàng: ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.getProportionateScreenHeight(18),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.getProportionateScreenWidth(15),
                                        bottom: Dimensions.getProportionateScreenHeight(15)),
                                    child: Text(
                                      "Đặt lúc: ",
                                      // "Đặt hàng lúc " +
                                      //     DateFormat("HH:mm - dd/MM/yyyy")
                                      //         .format(controller.orderRes.value.createdAt!),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.getProportionateScreenWidth(15),
                                bottom: Dimensions.getProportionateScreenHeight(5)),
                            child: Text(
                              "Người đặt hàng: ",
                              style: TextStyle(
                                  fontSize: Dimensions.getProportionateScreenHeight(16),
                                  color: Colors.white),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            endIndent: Dimensions.getProportionateScreenWidth(15),
                            indent: Dimensions.getProportionateScreenWidth(15),
                            color: Colors.white,
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
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Đang chuẩn bị",
                                  style:
                                      TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            endIndent: Dimensions.getProportionateScreenWidth(15),
                            indent: Dimensions.getProportionateScreenWidth(15),
                            color: Colors.white,
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
                                  "5 món",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.getProportionateScreenHeight(16)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.getProportionateScreenWidth(150)),
                                  child: Text(
                                    "Tổng tiền:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.getProportionateScreenHeight(16),
                                    ),
                                  ),
                                ),
                                Text(
                                  // NumberFormat("#,##0", "en_US")
                                  //     .format(controller.orderRes.value.subTotal!) +
                                  "đ",
                                  style: TextStyle(
                                      color: Colors.white,
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
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.getProportionateScreenHeight(5)),
                              ))),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hoàn thành đơn",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: Dimensions.getProportionateScreenHeight(16),
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.mainColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.getProportionateScreenHeight(20),
                      ),
                      Expanded(
                        child: ListView.builder(
                            padding:
                                EdgeInsets.only(top: Dimensions.getProportionateScreenHeight(10)),
                            itemCount: 5,
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
                                              "https://caresspet.com/wp-content/uploads/2018/10/s16-1024x768.jpg",
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
                                                    "Cơm rang Bá vương",
                                                    style: TextStyle(
                                                      fontSize:
                                                          Dimensions.getProportionateScreenHeight(
                                                              15),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        Dimensions.getProportionateScreenHeight(7),
                                                  ),
                                                  Text(
                                                    "Thời gian chuẩn bị: " + "12" + " phút",
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
                                                        // NumberFormat("#,##0", "en_US").format(
                                                        //     controller.orderRes.value.foods!
                                                        //         .elementAt(index)
                                                        //         .price) +
                                                        "đ",
                                                        style: TextStyle(
                                                          fontSize: Dimensions
                                                              .getProportionateScreenHeight(17),
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
          }),
        ));
  }
}
