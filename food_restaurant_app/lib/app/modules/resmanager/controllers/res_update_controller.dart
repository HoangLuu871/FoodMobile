import 'package:ecommerce_flutter/app/modules/resmanager/apihandler/resmanager_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResUpdateController extends GetxController {
  var data = Get.arguments;
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
  TextEditingController openTimeEditingController = TextEditingController();
  TextEditingController closeTimeEditingController = TextEditingController();
  TextEditingController coverImageEditingController = TextEditingController();
  var isDataProcessing = false.obs;

  @override
  void onInit() {
    nameEditingController.text = "${data[0]}";
    addressEditingController.text = "${data[1]}";
    openTimeEditingController.text = "${data[2]}";
    closeTimeEditingController.text = "${data[3]}";
    coverImageEditingController.text = "${data[4]}";
    super.onInit();
  }

  Future<bool> updateRes(
      {String? name,
      String? address,
      String? openTime,
      String? closeTime,
      String? coverImageLink}) async {
    try {
      isDataProcessing(true);
      return await ResManagerApi.updateRes(
          name: name,
          address: address,
          openTime: openTime,
          closeTime: closeTime,
          coverImageLink: coverImageLink);
    } catch (exception) {
      print(exception);
      isDataProcessing(true);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }
}
