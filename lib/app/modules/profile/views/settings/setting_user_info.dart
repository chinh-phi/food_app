import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/profile/views/settings/phone_number_view.dart';
import 'package:food_app_247/app/modules/profile/views/settings/setting_user_item.dart';
import 'package:food_app_247/app/modules/profile/views/settings/setting_view.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/setting_user_info_controller.dart';


class SettingUserInfo extends GetView<SettingUserInfoController> {
  const SettingUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingUserInfoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Thông tin người dùng', style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
              color: Dimensions.primaryColor
          ),
          onPressed: () {
            Get.to(() =>  SettingView());
          },
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xFFe8e8e8),
              height: 1.0,
            )
        ),
      ),
      body: Obx(() => controller.isDataProcessing.value
          ? const Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor))
          : SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingUserItem(
                press: () {
                  controller.getAvatar();
                },
                child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/avatar.png')
                    )
                ),
                hintText: 'Đổi hình đại diện',
                haveChild: true,
                color: Dimensions.primaryColor,
              ),
              const SizedBox(height: 10),
              SettingUserItem(
                press: (){

                },
                text: 'Tên đăng nhập',
                hintText: '${controller.userInfo.value.username}',
                color: Colors.black87,
                option: false,
              ),
              SettingUserItem(
                press: () {
                  Get.to(() => const PhoneNumberView(), arguments: {"phoneNumber": controller.userInfo.value.phoneNumber ?? 'Cập nhật ngay'});
                },
                text: 'Số điện thoại',
                hintText: controller.userInfo.value.phoneNumber ?? 'Cập nhật ngay',
                color: controller.userInfo.value.phoneNumber != null ? Colors.black87 : const Color(0xFFe8e8e8),
              ),
              const SizedBox(height: 10),
              SettingUserItem(
                press: () {
                  controller.getName();
                },
                text: 'Tên',
                hintText: '${controller.userInfo.value.name}',
                color: Colors.black87,
              ),
              SettingUserItem(
                press: () {
                  controller.getEmail();
                },
                text: 'Email',
                hintText: controller.userInfo.value.email != null? '${controller.userInfo.value.email}' : 'Nhập Email',
                color: controller.userInfo.value.email != null ? Colors.black87 : Color(0xFFe8e8e8),
              ),
              SettingUserItem(
                press: () {
                  controller.getSex();
                },
                text: 'Giới tính',
                hintText: controller.gender.value != ''
                    ? controller.gender.value
                    : 'Cập nhật ngay',
                color: controller.userInfo.value.gender != null ? Colors.black87 : Color(0xFFe8e8e8),
              ),
              SettingUserItem(
                press: () {
                  controller.getBirthday();
                },
                text: 'Ngày sinh',
                hintText: controller.date.value != ''
                    ? controller.date.value
                    : 'Cập nhật ngay',
                color: controller.userInfo.value.birthday != null ? Colors.black87 : Color(0xFFe8e8e8),
              ),
              SettingUserItem(
                press: () {
                  controller.getJob();
                },
                text: 'Nghề nghiệp',
                hintText: controller.userInfo.value.job != null ? '${controller.userInfo.value.job}' : 'Cập nhật ngay',
                color: controller.userInfo.value.job != null ? Colors.black87 : Color(0xFFe8e8e8),
              )
            ],
          ),
        ),
      )
      )
    );
  }
}
