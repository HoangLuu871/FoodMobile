import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
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