import 'package:ecommerce_flutter/app/modules/dashboard/models/order_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../apihandler/dashboard_api.dart';
import 'dashboard_controller.dart';

class OrderDetailController extends GetxController {
  var id = Get.arguments;
  var orderRes = OrderDetailModel().obs;
  late ScrollController scrollController;
  var isDataProcessing = false.obs;
  var status = Status().obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
    getOrderById(id);
  }

  void getOrderById(int? id) async {
    try {
      isDataProcessing(true);
      var dataRes = await DashboardApi.getOrderDetailById(id);
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

  Future<bool> confirmOrder(int? id) async {
    try {
      isDataProcessing(true);
      return await DashboardApi.confirmOrder(id);
    } catch (exception) {
      isDataProcessing(false);
      print(exception);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

  bool checkPending() {
    if(orderRes.value.status! == "Pending") {
      return true;
    } else {
      return false;
    }
  }

  Status getStatus() {
    switch(orderRes.value.status!) {
      case "Pending":
        status.value.setValue("assets/image/order_waiting.png", "Đang đợi duyệt", const Color(
            0xFFDCAC00));
        break;
      case "Confirmed":
        status.value.setValue("assets/image/order_preparing.png", "Đang chuẩn bị", const Color(0xFFDCAC00));
        break;
      case "Preparing":
        status.value.setValue("assets/image/order_preparing.png", "Đang chuẩn bị", const Color(0xFFDCAC00));
        break;
      case "Delivering":
        status.value.setValue("assets/image/order_delivering.png", "Đang giao hàng", const Color(
            0xFF00BBDC));
        break;
      case "Completed":
        status.value.setValue("assets/image/order_completed.png", "Đã hoàn thành", const Color(
            0xFF01C61E));
        break;
      case "Reviewed":
        status.value.setValue("assets/image/order_completed.png", "Đã hoàn thành", const Color(
            0xFF01C61E));
        break;
      default:
        status.value.setValue("assets/image/order_cancelled.png", "Đã hủy", const Color(
            0xFFC60101));
        break;
    }
    return status.value;
  }

  @override
  void onClose() {

    scrollController.dispose();
    super.onClose();
  }
}