import 'package:ecommerce_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../main.dart';
import '../apihandler/fcm_api.dart';

class NotificationController {
  LoginController loginController = Get.put(LoginController());

  Future<bool> postFcmToken() async {
    try {
      loginController.isLoginProcessing(true);
      return await FcmApi.postFcmToken(await FirebaseMessaging.instance.getToken());
    } catch (exception) {
      loginController.isLoginProcessing(false);
      print(exception);
      return false;
    } finally {
      loginController.isLoginProcessing(true);
    }
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(0, "Testing ", "Oke message", NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          importance: Importance.high,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        )
    ));
  }
}