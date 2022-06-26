import 'package:ecommerce_flutter/app/modules/menumanager/apihandler/menumanager_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MenuAddController extends GetxController {
  TextEditingController foodNameEditingController = TextEditingController();
  TextEditingController imageLinkEditingController = TextEditingController();
  TextEditingController prepareEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  var isDataProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> addFood({String? name, dynamic price, dynamic prepareTime, String? imageLink}) async {
    try{
      isDataProcessing(true);
      return await MenuManagerApi.addFood(name: name, price: price, prepareTime: prepareTime, imageLink: imageLink);
    } catch (exception) {
      print(exception);
      isDataProcessing(true);
      return false;
    } finally {
      isDataProcessing(false);
    }
  }

}