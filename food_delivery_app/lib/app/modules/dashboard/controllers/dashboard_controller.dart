import 'dart:convert';

import 'package:ecommerce_flutter/app/modules/dashboard/apihandler/dashboard_api.dart';
import 'package:ecommerce_flutter/app/modules/dashboard/models/dashboard_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';

class DashboardController extends GetxController {
  late ScrollController scrollController;
  var isDataProcessing = false.obs;
  var orderLists = List<DashboardModel>.empty(growable: true).obs;

  @override
    void onInit() {
    scrollController = ScrollController();
    getAllOrder();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Mess " + message.toString());
      if (message.notification == null) {
        var res = message.data['order'];
        print(res);
        var resJson = jsonDecode(res);
        orderLists.add(DashboardModel.fromJson(resJson));
      } else {
        var res = message.data['order'];
        print(res);
        var resJson = jsonDecode(res);
        orderLists.add(DashboardModel.fromJson(resJson));
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
      }
    });
    super.onInit();
  }

  void getAllOrder() async {
    try {
      isDataProcessing(true);
      var dataRes = await DashboardApi.getOrder();
      if (dataRes.isNotEmpty) {
        List<DashboardModel> tmp = List<DashboardModel>.from(dataRes.map((model)=> DashboardModel.fromJson(model)));
        orderLists.addAll(tmp);
      }
    } catch (exception) {
      print(exception);
    } finally {
      isDataProcessing(false);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}