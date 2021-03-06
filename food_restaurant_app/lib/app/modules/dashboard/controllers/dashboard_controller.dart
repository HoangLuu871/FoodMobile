import 'package:ecommerce_flutter/app/modules/dashboard/apihandler/dashboard_api.dart';
import 'package:ecommerce_flutter/app/modules/dashboard/models/dashboard_model.dart';
import 'package:ecommerce_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('accessToken');
      prefs.remove('refreshToken');
      isDataProcessing(false);
      print(exception);
      Get.offNamed("/login");
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

    tabController = TabController(length: 5, vsync: this);
    scrollController = ScrollController();
    super.onInit();
    getAllOrder();
    tabController.addListener(() {
      if(tabController.index == 0){
        getAllOrder();
      } else if (tabController.index == 1) {
        getOrderByStatus("Preparing");
      } else if (tabController.index == 2) {
        getOrderByStatus("Delivering");
      } else if (tabController.index == 3) {
        getOrderByStatus2("Completed", "Reviewed");
      } else if (tabController.index == 4) {
        getOrderByStatus("Cancelled");
      }
    });
  }

  Future refreshData() async {
    if(tabController.index == 0){
      getAllOrder();
    }else if (tabController.index == 1) {
      getOrderByStatus("Preparing");
    } else if (tabController.index == 2) {
      getOrderByStatus("Delivering");
    } else if (tabController.index == 3) {
      getOrderByStatus2("Completed", "Reviewed");
    } else if (tabController.index == 4) {
      getOrderByStatus("Cancelled");
    }
  }

  Status getStatus(int i) {
    switch(orderRes.value.rows!.elementAt(i).status!) {
      case "Pending":
        status.value.setValue("assets/image/order_waiting.png", "??ang ?????i duy???t", const Color(
            0xFFDCAC00));
        break;
      case "Confirmed":
        status.value.setValue("assets/image/order_preparing.png", "??ang chu???n b???", const Color(0xFFDCAC00));
        break;
      case "Preparing":
        status.value.setValue("assets/image/order_preparing.png", "??ang chu???n b???", const Color(0xFFDCAC00));
        break;
      case "Delivering":
        status.value.setValue("assets/image/order_delivering.png", "??ang giao h??ng", const Color(
            0xFF00BBDC));
        break;
      case "Completed":
        status.value.setValue("assets/image/order_completed.png", "???? ho??n th??nh", const Color(
            0xFF01C61E));
        break;
      case "Reviewed":
        status.value.setValue("assets/image/order_completed.png", "???? ho??n th??nh", const Color(
            0xFF01C61E));
        break;
      default:
        status.value.setValue("assets/image/order_cancelled.png", "???? h???y", const Color(
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