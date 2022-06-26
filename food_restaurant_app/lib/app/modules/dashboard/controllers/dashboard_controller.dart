import 'package:ecommerce_flutter/app/modules/dashboard/apihandler/dashboard_api.dart';
import 'package:ecommerce_flutter/app/modules/dashboard/models/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  var orderRes = DashboardModel().obs;
  late TabController tabController;
  late ScrollController scrollController;
  var isDataProcessing = false.obs;
  var status = Status().obs;

  void getAllOrder() async {
    try {
      isDataProcessing(true);
      var dataRes = await DashboardApi.getAllOrder();
      if (dataRes.isNotEmpty) {
        orderRes.value = DashboardModel.fromJson(dataRes);
      }
    } catch (exception) {
      isDataProcessing(false);
      print(exception);
    } finally {
      isDataProcessing(false);
    }
  }

  void getOrderByStatus(String? status) async {
    try {
      isDataProcessing(true);
      var dataRes = await DashboardApi.getOrderByStatus(status);
      if (dataRes.isNotEmpty) {
        orderRes.value = DashboardModel.fromJson(dataRes);
      }
    } catch (exception) {
      isDataProcessing(false);
    } finally {
      isDataProcessing(false);
    }
  }

  void getOrderByStatus2(String? status, String? status2) async {
    try {
      isDataProcessing(true);
      var dataRes = await DashboardApi.getOrderByStatus2(status, status2);
      if (dataRes.isNotEmpty) {
        orderRes.value = DashboardModel.fromJson(dataRes);
      }
    } catch (exception) {
      isDataProcessing(false);
    } finally {
      isDataProcessing(false);
    }
  }

  @override
  void onInit() {

    tabController = TabController(length: 6, vsync: this);
    scrollController = ScrollController();
    super.onInit();
    getAllOrder();
    tabController.addListener(() {
      if(tabController.index == 0){
        getAllOrder();
      }else if(tabController.index == 1) {
        getOrderByStatus("Pending");
      } else if (tabController.index == 2) {
        getOrderByStatus2("Confirmed", "Preparing");
      } else if (tabController.index == 3) {
        getOrderByStatus("Delivering");
      } else if (tabController.index == 4) {
        getOrderByStatus2("Completed", "Reviewed");
      } else if (tabController.index == 5) {
        getOrderByStatus("Cancelled");
      }
    });
  }

  Future refreshData() async {
    if(tabController.index == 0){
      getAllOrder();
    }else if(tabController.index == 1) {
      getOrderByStatus("Pending");
    } else if (tabController.index == 2) {
      getOrderByStatus2("Preparing", "Confirmed");
    } else if (tabController.index == 3) {
      getOrderByStatus("Delivering");
    } else if (tabController.index == 4) {
      getOrderByStatus2("Completed", "Reviewed");
    } else if (tabController.index == 5) {
      getOrderByStatus("Cancelled");
    }
  }

  Status getStatus(int i) {
    switch(orderRes.value.rows!.elementAt(i).status!) {
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
    tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }

}

class Status {
  late String imageAsset;
  late String status;
  late Color color;

  setValue(String imageAsset, String status, Color color) {
    this.imageAsset = imageAsset;
    this.status = status;
    this.color = color;
  }
}