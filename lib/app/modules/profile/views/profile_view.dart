import 'package:flutter/material.dart';
import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/app/modules/merchant/api/fire_store_db.dart';
import 'package:food_app_247/app/modules/profile/views/address/address_view.dart';
import 'package:food_app_247/splash_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/controllers/login_controller.dart';
import '../controllers/profile_controller.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'settings/setting_view.dart';



class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      // padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          ProfileMenu(
            text: "Cài đặt",
            icon: Icons.settings,
            press: () {
              Get.to(() => SettingView());
            },
          ),
          ProfileMenu(
            text: "Đăng xuất",
            icon: Icons.logout,
            press: () async{
              var res = await ServiceApi.logout();
              if(res) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('accessToken');
                prefs.remove('refreshToken');
                prefs.remove('merchantId');
                prefs.remove('currentMerchantId');
                prefs.remove('merchantName');
                prefs.remove('currentMerchantName');
                await FireStoreDB().deleteAllItem();
                Get.offAll(() => const SplashScreen());
              } else {
                print(res);
              }


            },
          ),

        ],
      ),
    );
  }
}

