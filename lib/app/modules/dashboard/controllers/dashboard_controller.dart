import 'package:flutter/cupertino.dart';
import 'package:food_app_247/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import '../../favorite/views/favorite_view.dart';
import '../../notification/views/notification_view.dart';
import '../../order/views/order_view.dart';
import '../../profile/views/profile_view.dart';

class DashboardController extends GetxController {

  var selectedIndex = 0.obs;
  List<Widget> screenList = [
    HomeView(),
    OrderView(),
    FavoriteView(),
    NotificationView(),
    ProfileView(),
  ];

  selectIndex(int index) => selectedIndex.value = index;
  getScreen() => screenList[selectedIndex.value];
  // var tabIndex = 0;
  //
  // void changeTabIndex(int index) {
  //   tabIndex = index;
  //   update();
  // }

}