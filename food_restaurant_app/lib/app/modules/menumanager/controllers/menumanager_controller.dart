import 'package:ecommerce_flutter/app/modules/menumanager/models/menumanager_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apihandler/menumanager_api.dart';

class MenuManagerController extends GetxController {
  var listFood = MenuManagerModel().obs;
  late ScrollController scrollController;
  var isDataProcessing = false.obs;

  void getFoodData() async {
    try {
      isDataProcessing(true);
      var dataRes = await MenuManagerApi.getResDetail();
      if (dataRes.isNotEmpty) {
        listFood.value = MenuManagerModel.fromJson(dataRes);
      }
    } catch (exception) {
      isDataProcessing(false);
    } finally {
      isDataProcessing(false);
    }
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
    getFoodData();
  }

  Future refreshData() async {
    getFoodData();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
