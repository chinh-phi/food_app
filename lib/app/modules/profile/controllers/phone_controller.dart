import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/address/providers/address_choose_provider.dart';
import 'package:food_app_247/app/modules/profile/api/setting_api.dart';
import 'package:food_app_247/app/modules/profile/controllers/setting_user_info_controller.dart';
import 'package:food_app_247/app/modules/profile/views/settings/setting_user_info.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController {
  var phoneController = TextEditingController();
  var isEmpty = true.obs;
  var isDataProcessing = false.obs;

  void input(String value) {
    if(value.trim().isNotEmpty) {
      isEmpty.value = false;
    } else {
      isEmpty.value = true;
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void updatePhone(column, value) async {
    try {
      isDataProcessing(true);
      isEmpty(true);
      var res = await SettingApi.updateInfo(column, value);
      isDataProcessing(false);
      Get.delete<SettingUserInfoController>();
      Get.to(() => SettingUserInfo());
    } catch(e) {
      isDataProcessing(false);
      print("Lỗi xử lý");
    }
  }

}