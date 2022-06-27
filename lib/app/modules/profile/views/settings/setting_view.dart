import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/dashboard/views/dashboard_view.dart';
import 'package:food_app_247/app/modules/profile/views/payment/payment_item.dart';
import 'package:food_app_247/app/modules/profile/views/settings/password_view.dart';
import 'package:food_app_247/app/modules/profile/views/settings/setting_user_info.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';


class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt', style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
              color: Dimensions.primaryColor
          ),
          onPressed: () {
            // Get.back();
            Get.to(() => DashboardView());
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: const Text(
                  'CÀI ĐẶT TÀI KHOẢN',
                  style: TextStyle(fontSize: 16, color: Colors.grey)
                ),
              ),
              PaymentItem(
                text: 'Thông tin & Liên hệ',
                press: () {
                  Get.to(() => SettingUserInfo());
                },
              ),
              PaymentItem(
                text: 'Mật khẩu',
                press: () {
                  Get.to(() => PasswordView());
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: const Text(
                    'CÀI ĐẶT ỨNG DỤNG',
                    style: TextStyle(fontSize: 16, color: Colors.grey)
                ),
              ),
              PaymentItem(
                text: 'Cài đặt thông báo',
                press: () {

                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
