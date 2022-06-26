import 'package:ecommerce_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MerchantApp());
}

class MerchantApp extends StatelessWidget {
  const MerchantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EAT Merchant",
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
