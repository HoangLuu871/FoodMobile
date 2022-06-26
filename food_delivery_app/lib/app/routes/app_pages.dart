import 'package:ecommerce_flutter/app/modules/orderdetail/views/orderdetail_view.dart';
import 'package:ecommerce_flutter/utils/splash_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerce_flutter/app/modules/login/views/login_view.dart';

import '../modules/dashboard/views/dashboard_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
    ),
    GetPage(
      name: Routes.ORDERDETAIL,
      page: () => const OrderDetailView(),
    ),
  ];
}
