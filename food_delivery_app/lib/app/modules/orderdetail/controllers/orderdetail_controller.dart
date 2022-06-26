import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  late ScrollController scrollController;
  var isDataProcessing = false.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
