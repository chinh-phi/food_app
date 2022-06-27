import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/profile/api/setting_api.dart';
import 'package:food_app_247/app/modules/profile/controllers/setting_user_info_controller.dart';
import 'package:get/get.dart';

import '../views/settings/setting_user_info.dart';

class NameController extends GetxController {
  var nameController = TextEditingController();
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
    nameController.dispose();
    super.onClose();
  }

  void updateName(column, value) async {
    try {
      isDataProcessing(true);
      isEmpty(true);
      var res = await SettingApi.updateInfo(column, value);
      isDataProcessing(false);
      Get.delete<SettingUserInfoController>();
      Get.to(() => SettingUserInfo());
      print(res);
    } catch(e) {
      isDataProcessing(false);
      print("Lỗi xử lý");
    }
  }

}