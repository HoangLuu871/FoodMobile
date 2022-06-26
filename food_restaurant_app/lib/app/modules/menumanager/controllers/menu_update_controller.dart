import 'package:ecommerce_flutter/app/modules/menumanager/apihandler/menumanager_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MenuUpdateController extends GetxController {
  var data = Get.arguments;
  TextEditingController idEditingController = TextEditingController();
  TextEditingController foodNameEditingController = TextEditingController();
  TextEditingController imageLinkEditingController = TextEditingController();
  TextEditingController prepareEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  var isDataProcessing = false.obs;

  @override
  void onInit() {
    idEditingController.text = "${data[0]}";
    foodNameEditingController.text = "${data[1]}";
    imageLinkEditingController.text = "${data[2]}";
    prepareEditingController.text = "${data[3]}";
    priceEditingController.text = "${data[4]}";
    super.onInit();
  }

  Future<bool> updateFood({dynamic id, String? name, dynamic price, dynamic prepareTime, String? imageLink}) async {
    try{
      isDataProcessing(true);
      return await MenuManagerApi.updateFood(id: id, name: name, price: price, prepareTime: prepareTime, imageLink: imageLink);
    } catch (exception) {
      print(exception);
      isDataProcessing(true);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

  Future<bool> removeFood({dynamic id}) async {
    try{
      isDataProcessing(true);
      return await MenuManagerApi.removeFood(id: id);
    } catch (exception) {
      print(exception);
      isDataProcessing(true);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

}