import 'package:food_app_247/app/modules/menu_result/views/menu_result_view.dart';
import 'package:food_app_247/app/modules/merchant/views/merchant_view.dart';
import 'package:food_app_247/app/modules/order/views/order_detail.dart';
import 'package:food_app_247/splash_screen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.MERCHANTDETAIL,
      page: () => const MerchantView(),
    ),
    GetPage(
      name: _Paths.ORDERDETAIL,
      page: () => const OrderDetail(),
    ),
    GetPage(
      name: _Paths.MENURESULT,
      page: () => const MenuResultView(),
    )
  ];
}