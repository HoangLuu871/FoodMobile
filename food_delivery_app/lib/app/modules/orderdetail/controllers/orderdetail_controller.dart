import 'dart:async';

import 'package:ecommerce_flutter/app/modules/orderdetail/apihandler/order_detail_api.dart';
import 'package:ecommerce_flutter/app/modules/orderdetail/models/order_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  late ScrollController scrollController;
  var orderRes = OrderDetailModel().obs;
  var isDataProcessing = false.obs;
  var data = Get.arguments;

  Future<bool> getOrderById(int? id) async {
    try {
      isDataProcessing(true);
      return await OrderDetailApi.getOrderDetailById(id);
    } catch (exception) {
      isDataProcessing(false);
      print(exception);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

  void getOrderByIdNoUpdate(int? id) async {
    try {
      isDataProcessing(true);
      var dataRes = await OrderDetailApi.getOrderDetailByIdNoUpdate(id);
      if (dataRes.isNotEmpty) {
        orderRes.value = OrderDetailModel.fromJson(dataRes);
      }
    } catch (exception) {
      isDataProcessing(false);
      print(exception);
    } finally {
      isDataProcessing(false);
    }
  }

  Future<bool> getOrderByIdDeli(int? id) async {
    try {
      isDataProcessing(true);
      return await OrderDetailApi.getOrderDetailByIdDeli(id);

    } catch (exception) {
      isDataProcessing(false);
      print(exception);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

  Future<bool> getOrderByIdComp(int? id) async {
    try {
      isDataProcessing(true);
      return await OrderDetailApi.getOrderDetailByIdComp(id);

    } catch (exception) {
      isDataProcessing(false);
      print(exception);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
    print(data);
    getOrderByIdNoUpdate(data);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
