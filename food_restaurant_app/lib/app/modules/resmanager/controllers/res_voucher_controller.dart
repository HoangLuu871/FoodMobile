import 'package:ecommerce_flutter/app/modules/resmanager/apihandler/res_voucher_api.dart';
import 'package:ecommerce_flutter/app/modules/resmanager/models/res_voucher_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResVoucherController extends GetxController {
  var voucherRes = ResVoucherModel().obs;
  var isDataProcessing = false.obs;
  late ScrollController scrollController;
  TextEditingController voucherNameEditingController = TextEditingController();
  TextEditingController paymentEditingController = TextEditingController();
  TextEditingController totalEditingController = TextEditingController();

  void refreshData() {
    getVoucher();
  }

  void getVoucher() async {
    try {
      isDataProcessing(true);
      var dataRes = await ResVoucherApi.getVouchers();
      if (dataRes.isNotEmpty) {
        voucherRes.value = ResVoucherModel.fromJson(dataRes);
      }
    } catch (exception) {
      print(exception);
      isDataProcessing(false);
    } finally {
      isDataProcessing(false);
    }
  }

  Future<bool> addVoucher({String? name, String? paymentMethod, String? totalPay}) async {
    try {
      isDataProcessing(true);
      return await ResVoucherApi.addVoucher(
          name: name, paymentMethod: paymentMethod, totalPay: totalPay);
    } catch (exception) {
      print(exception);
      isDataProcessing(true);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

  Future<bool> removeVoucher({dynamic id}) async {
    try {
      isDataProcessing(true);
      return await ResVoucherApi.removeVoucher(id: id);
    } catch (exception) {
      print(exception);
      isDataProcessing(true);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
    getVoucher();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
