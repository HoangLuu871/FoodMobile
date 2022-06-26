import 'package:ecommerce_flutter/app/modules/orderdetail/controllers/orderdetail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlng/latlng.dart';

import '../../../../utils/colors.dart';
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
                    "Đơn hàng",
                    style: TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.w700),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(CustomIcons.account_circle))
                ],
              ),
              pinned: true,
              floating: false,
              forceElevated: isScrolled,
            )
          ];
        },
        body: Container(),
      ));
  }
}
