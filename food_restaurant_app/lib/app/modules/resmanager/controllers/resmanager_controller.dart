import 'package:ecommerce_flutter/app/modules/resmanager/apihandler/resmanager_api.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/models/resmanager_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResManagerController extends GetxController {
  var resData = ResManagerModel().obs;
  late ScrollController scrollController;
  var isDataProcessing = false.obs;

  void getResData() async {
    try {
      isDataProcessing(true);
      var dataRes = await ResManagerApi.getResDetail();
      if (dataRes.isNotEmpty) {
        resData.value = ResManagerModel.fromJson(dataRes);
      }
    } catch (exception) {
      isDataProcessing(false);
    } finally {
      isDataProcessing(false);
    }
  }

  refreshData() async {
    getResData();
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
    getResData();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
