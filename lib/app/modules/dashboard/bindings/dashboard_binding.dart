import 'package:food_app_247/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:food_app_247/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:get/get.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}