import 'package:ecommerce_flutter/app/modules/menumanager/controllers/menumanager_controller.dart';
import 'package:ecommerce_flutter/app/modules/menumanager/views/menu_add_view.dart';
import 'package:ecommerce_flutter/app/modules/menumanager/views/menu_update_view.dart';
import 'package:ecommerce_flutter/utils/colors.dart';
import 'package:ecommerce_flutter/utils/drawer_navigation.dart';
import 'package:ecommerce_flutter/utils/icons.dart';
import 'package:ecommerce_flutter/utils/refresh_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/dimensions.dart';

class MenuManagerView extends StatefulWidget {
  const MenuManagerView({Key? key}) : super(key: key);

  @override
  State<MenuManagerView> createState() => _MenuManagerViewState();
}

class _MenuManagerViewState extends State<MenuManagerView> {
  MenuManagerController controller = Get.put(MenuManagerController());
  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF7F4F4F4),
      drawer: const DrawerNavigationWidget(),
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
                    "Quản lý Menu",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.getProportionateScreenHeight(17)),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => const MenuAddView());
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
              : RefreshWidget(
                  keyRefresh: keyRefresh,
                  onRefresh: controller.refreshData,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.getProportionateScreenHeight(15),
                            top: Dimensions.getProportionateScreenHeight(15)),
                        child: Text(
                          "Tổng số món ăn (" + controller.listFood.value.count!.toString() + ")",
                          style: TextStyle(
                            fontSize: Dimensions.getProportionateScreenHeight(17),
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF5E5E5E),
                          ),
                        ),
                      ),
                      const Expanded(child: MenuList()),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}

class MenuList extends GetView<MenuManagerController> {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: Dimensions.getProportionateScreenHeight(10)),
        itemCount: controller.listFood.value.count,
        itemBuilder: (context, index) => Container(
              height: Dimensions.getProportionateScreenHeight(100),
              decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFDEDEDE)),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(Dimensions.getProportionateScreenHeight(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          controller.listFood.value.rows!.elementAt(index).imageLink!,
                          fit: BoxFit.cover,
                          width: Dimensions.getProportionateScreenHeight(70),
                          height: Dimensions.getProportionateScreenHeight(70),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: Dimensions.getProportionateScreenWidth(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.listFood.value.rows!.elementAt(index).name!,
                                style: TextStyle(
                                  fontSize: Dimensions.getProportionateScreenHeight(15),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.getProportionateScreenHeight(7),
                              ),
                              Text(
                                "Thời gian chuẩn bị: " +
                                    (controller.listFood.value.rows!.elementAt(index).prepareTime! *
                                            10)
                                        .toString() +
                                    " phút",
                                style: TextStyle(
                                    fontSize: Dimensions.getProportionateScreenHeight(13),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF727272)),
                              ),
                              SizedBox(
                                height: Dimensions.getProportionateScreenHeight(7),
                              ),
                              Row(
                                children: [
                                  Text(
                                    NumberFormat("#,##0", "en_US").format(controller
                                            .listFood.value.rows!
                                            .elementAt(index)
                                            .price) +
                                        "đ",
                                    style: TextStyle(
                                      fontSize: Dimensions.getProportionateScreenHeight(17),
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
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      IconButton(
                        iconSize: Dimensions.getProportionateScreenHeight(20),
                        icon: const Icon(CustomIcons.more_horiz),
                        onPressed: () {
                          Get.to(() => const MenuUpdateView(),
                              arguments: [
                                controller.listFood.value.rows!.elementAt(index).id!,
                                controller.listFood.value.rows!.elementAt(index).name!,
                                controller.listFood.value.rows!.elementAt(index).imageLink!,
                                controller.listFood.value.rows!.elementAt(index).prepareTime!,
                                controller.listFood.value.rows!.elementAt(index).price!
                              ],
                              preventDuplicates: true);
                        },
                      ),
                    ])
                  ],
                ),
              ),
            ));
  }
}
