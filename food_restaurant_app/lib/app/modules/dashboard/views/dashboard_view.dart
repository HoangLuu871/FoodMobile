import 'package:ecommerce_flutter/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ecommerce_flutter/app/modules/dashboard/views/order_detail_view.dart';
import 'package:ecommerce_flutter/utils/colors.dart';
import 'package:ecommerce_flutter/utils/dimensions.dart';
import 'package:ecommerce_flutter/utils/drawer_navigation.dart';
import 'package:ecommerce_flutter/utils/refresh_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../main.dart';
import '../../notification/controllers/notification_controllers.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = Get.put(DashboardController());
  @override
  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
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
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('A new Message event was published!');
      print(message.data);
      RemoteNotification notification = message.notification!;
      AndroidNotification androidNotification = message.notification!.android!;
      if (notification != null && androidNotification != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                )));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        drawer: const DrawerNavigationWidget(),
        body: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder: (BuildContext context, bool isScrolled) {
              return <Widget>[
                SliverAppBar(
                  iconTheme: const IconThemeData(color: Color(0xFFbc2c3d)),
                  backgroundColor: Colors.white,
                  title: Row(children: [
                    Container(
                      alignment: Alignment.center,
                      height: Dimensions.getProportionateScreenHeight(36),
                      width: Dimensions.getProportionateScreenWidth(280),
                      child: TextField(
                        cursorColor: AppColors.mainColor,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFFB2B2B2),
                          ),
                          hintText: "T??m ki???m ????n h??ng theo ID",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.all(Dimensions.getProportionateScreenHeight(1)),
                          hintStyle: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: Dimensions.getProportionateScreenHeight(17),
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFB2B2B2)),
                        ),
                      ),
                      decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
                    ),
                  ]),
                  pinned: true,
                  floating: false,
                  forceElevated: isScrolled,
                  bottom: TabBar(
                    isScrollable: true,
                    controller: controller.tabController,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: Dimensions.getProportionateScreenHeight(14),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    unselectedLabelColor: Colors.black,
                    indicator: MaterialIndicator(
                        color: AppColors.mainColor,
                        bottomLeftRadius: Dimensions.getProportionateScreenHeight(5),
                        bottomRightRadius: Dimensions.getProportionateScreenHeight(5),
                        horizontalPadding: Dimensions.getProportionateScreenWidth(10),
                        tabPosition: TabPosition.bottom),
                    tabs: const [
                      Tab(text: "T???t c???"),
                      Tab(text: "????n m???i"),
                      Tab(text: "V???n chuy???n"),
                      Tab(text: "L???ch s???"),
                      Tab(text: "???? h???y"),
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [
                OrderList(),
                OrderList(),
                OrderList(),
                OrderList(),
                OrderList(),
              ],
              controller: controller.tabController,
            )));
  }
}

class OrderList extends GetView<DashboardController> {
  OrderList({Key? key}) : super(key: key);
  final keyRefresh = GlobalKey<RefreshIndicatorState>();
  final NotificationController notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                      "S??? l?????ng ????n h??ng (" + controller.orderRes.value.count!.toString() + ")",
                      style: TextStyle(
                        fontSize: Dimensions.getProportionateScreenHeight(17),
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF5E5E5E),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: Dimensions.getProportionateScreenHeight(10)),
                      itemCount: controller.orderRes.value.count!,
                      itemBuilder: (context, index) => Container(
                        height: Dimensions.getProportionateScreenHeight(250),
                        decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Color(0xFFDEDEDE)),
                              bottom: BorderSide(color: Color(0xFFDEDEDE)),
                            ),
                            color: Colors.white),
                        margin:
                            EdgeInsets.only(bottom: Dimensions.getProportionateScreenHeight(10)),
                        child: InkWell(
                          onTap: () => {
                            Get.to(() => const OrderDetailView(),
                                arguments: controller.orderRes.value.rows!.elementAt(index).id!)
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
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
                                                    fontSize:
                                                        Dimensions.getProportionateScreenHeight(20),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              )),
                                          Text(
                                            "#" +
                                                controller.orderRes.value.rows!
                                                    .elementAt(index)
                                                    .id
                                                    .toString(),
                                            style: TextStyle(
                                                color: AppColors.mainColor,
                                                fontSize:
                                                    Dimensions.getProportionateScreenHeight(18),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.getProportionateScreenWidth(15),
                                            bottom: Dimensions.getProportionateScreenHeight(15)),
                                        child: Text(
                                          "?????t h??ng l??c " +
                                              DateFormat("HH:mm - dd/MM/yyyy").format(controller
                                                  .orderRes.value.rows!
                                                  .elementAt(index)
                                                  .createdAt!),
                                          style: const TextStyle(color: Color(0xFF8B8B8B)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      height: Dimensions.getProportionateScreenHeight(80),
                                      width: Dimensions.getProportionateScreenWidth(150),
                                      child: Image.asset(
                                        controller.getStatus(index).imageAsset,
                                        fit: BoxFit.contain,
                                      )),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.getProportionateScreenWidth(15),
                                    bottom: Dimensions.getProportionateScreenHeight(5)),
                                child: Text(
                                  "Ng?????i ?????t h??ng: " +
                                      controller.orderRes.value.rows!.elementAt(index).user!.name!,
                                  style: TextStyle(
                                      fontSize: Dimensions.getProportionateScreenHeight(16)),
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
                                      "Tr???ng th??i: ",
                                      style: TextStyle(color: Color(0xFF8B8B8B)),
                                    ),
                                    Text(
                                      controller.getStatus(index).status,
                                      style: TextStyle(
                                          color: controller.getStatus(index).color,
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.getProportionateScreenWidth(150)),
                                      child: Text(
                                        "T???ng ti???n:",
                                        style: TextStyle(
                                          color: const Color(0xFF8B8B8B),
                                          fontSize: Dimensions.getProportionateScreenHeight(16),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      NumberFormat("#,##0", "en_US").format(controller
                                              .orderRes.value.rows!
                                              .elementAt(index)
                                              .subTotal) +
                                          "??",
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
