import 'package:ecommerce_flutter/app/modules/menumanager/controllers/menumanager_controller.dart';
import 'package:ecommerce_flutter/app/modules/menumanager/views/menumanager_view.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/controllers/resmanager_controller.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/views/resmanger_view.dart';
import 'package:ecommerce_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';

class DrawerNavigationWidget extends StatelessWidget {
  const DrawerNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppColors.mainColor,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.getProportionateScreenWidth(20)),
          children: [
            SizedBox(
              height: Dimensions.getProportionateScreenHeight(48),
            ),
            buildMenuItem(
                text: "Quản lý đơn hàng",
                iconData: Icons.sticky_note_2,
                onClicked: () => selectedItem(context, 0)),
            SizedBox(
              height: Dimensions.getProportionateScreenHeight(16),
            ),
            buildMenuItem(
                text: "Quản lý Menu",
                iconData: Icons.food_bank,
                onClicked: () => selectedItem(context, 1)),
            SizedBox(
              height: Dimensions.getProportionateScreenHeight(24),
            ),
            Divider(
              height: Dimensions.getProportionateScreenHeight(2),
              color: Colors.white70,
            ),
            SizedBox(
              height: Dimensions.getProportionateScreenHeight(24),
            ),
            buildMenuItem(
                text: "Quản lý tài khoản đối tác",
                iconData: Icons.account_circle,
                onClicked: () => selectedItem(context, 2)),
            SizedBox(
              height: Dimensions.getProportionateScreenHeight(16),
            ),
            buildMenuItem(
                text: "Thông tin",
                iconData: Icons.sticky_note_2,
                onClicked: () => selectedItem(context, 3)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData iconData,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        iconData,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(
            color: color,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.getProportionateScreenHeight(17)),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Get.toNamed("/dashboard");
        break;
      case 1:
        Get.toNamed("/menumanager");
        break;
      case 2:
        Get.toNamed("/resmanager");
        break;
    }
  }
}
