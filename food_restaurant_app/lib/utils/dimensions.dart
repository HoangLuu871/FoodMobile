import 'package:get/get.dart';

class Dimensions {
  //width: 411.4
  //height: 683.4
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;


  static double getProportionateScreenHeight(double inputHeight) {
    return screenHeight / (683.4 / inputHeight);
  }

  static double getProportionateScreenWidth(double inputWidth) {
    return screenWidth / (411.4 / inputWidth);
  }
}