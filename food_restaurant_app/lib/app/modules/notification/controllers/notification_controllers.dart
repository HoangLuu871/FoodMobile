import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../main.dart';
import '../apihandler/fcm_api.dart';

class NotificationController {
  Future<bool> postFcmToken() async {
    try {
      return await FcmApi.postFcmToken(await FirebaseMessaging.instance.getToken());
    } catch (exception) {
      print(exception);
      return false;
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