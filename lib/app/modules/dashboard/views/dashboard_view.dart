import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../favorite/views/favorite_view.dart';
import '../../home/views/home_view.dart';
import '../../notification/views/notification_view.dart';
import '../../order/views/order_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/dashboard_controller.dart';


class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DashboardController());
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      body: controller.getScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: controller.selectIndex,
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Dimensions.primaryColor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          _bottomNavigationBarItem(
              label: 'Home' ,
              icon: Icons.restaurant
          ),
          _bottomNavigationBarItem(
              label: 'Đơn hàng' ,
              icon: Icons.receipt
          ),
          _bottomNavigationBarItem(
              label: 'Thích' ,
              icon: Icons.favorite
          ),
          _bottomNavigationBarItem(
              label: 'Thông báo' ,
              icon: Icons.notifications
          ),
          _bottomNavigationBarItem(
              label: 'Tôi' ,
              icon: Icons.person
          ),
        ],
      ),
    ));
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}