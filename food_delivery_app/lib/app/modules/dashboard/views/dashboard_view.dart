import 'package:ecommerce_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ecommerce_flutter/app/modules/orderdetail/views/orderdetail_view.dart';
import 'package:ecommerce_flutter/utils/colors.dart';
import 'package:ecommerce_flutter/utils/dimensions.dart';
import 'package:ecommerce_flutter/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = Get.put(DashboardController());

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
                    Text(
                      "Đơn hàng",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(CustomIcons.account_circle, color: Colors.white,))
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
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                    height: Dimensions.getProportionateScreenHeight(270),
                    decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xFFDEDEDE)),
                          bottom: BorderSide(color: Color(0xFFDEDEDE)),
                        ),
                        color: Colors.white),
                    margin: EdgeInsets.only(bottom: Dimensions.getProportionateScreenHeight(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(Dimensions.getProportionateScreenHeight(15)),
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
                              "#1234",
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: Dimensions.getProportionateScreenHeight(18),
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Dimensions.getProportionateScreenWidth(100)),
                              child: Text(
                                "Tổng tiền:  ",
                                style: TextStyle(
                                  color: const Color(0xFF8B8B8B),
                                  fontSize: Dimensions.getProportionateScreenHeight(16),
                                ),
                              ),
                            ),
                            Text(
                              "150,000đ",
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
                              child: const Text(
                                "Người đặt hàng: Hoàng",
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
                          child: const Text(
                            "Quán ăn: Bánh tôm Hồ Tây",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Dimensions.getProportionateScreenWidth(15),
                            top: Dimensions.getProportionateScreenHeight(10),
                          ),
                          child: const Text(
                            "Địa chỉ: 1 Thanh Niên, P. Yên Phụ (Đối Diện Chùa Trấn Quốc), Quận Tây Hồ, Hà Nội",
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
                                        color: Color(0xFF6C6C6C), fontWeight: FontWeight.w700),
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
                                    backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.getProportionateScreenHeight(5)),
                                    ))),
                                onPressed: () {
                                  Get.off(() => const OrderDetailView());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Xác nhận",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: Dimensions.getProportionateScreenHeight(14),
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
                            padding:
                                EdgeInsets.only(right: Dimensions.getProportionateScreenWidth(15)),
                            child: TextButton(
                                onPressed: () => MapsLauncher.launchCoordinates(
                                    21.071319, 105.793576, 'Google Headquarters are here'),
                                child: Text(
                                  "Tra bản đồ?",
                                  style: TextStyle(
                                      color: AppColors.mainColor, fontWeight: FontWeight.w700),
                                )),
                          ),
                        ),
                      ],
                    ),
                  )),
        ));
  }
}
