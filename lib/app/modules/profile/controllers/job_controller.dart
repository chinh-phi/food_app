import 'package:food_app_247/app/modules/profile/controllers/setting_user_info_controller.dart';
import 'package:get/get.dart';

import '../api/setting_api.dart';
import '../views/settings/setting_user_info.dart';

class JobController extends GetxController {
  var isDataProcessing = false.obs;
  List<String> jobLists = [
    'Nhân viên văn phòng',
    'Freelancer',
    'Sinh viên/ Học sinh',
    'Ở nhà',
    'Nghề nghiệp khác'
  ];
  var checked = List.filled(5, false).obs;
  var isChosen = false.obs;

  var curIndex = -1.obs;
  void clickJob(index) {
    isChosen.value = true;
    if(curIndex == -1) {
      checked[index] = true;
      curIndex = index;
    } else {
      checked[curIndex] = false;
      checked[index] = true;
      curIndex = index;
    }
  }

  clickSave(column, value) async {
    try {
      isDataProcessing(true);
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

class JobModel {
  String jobName;
  bool chosen;
  JobModel(this.jobName, [this.chosen = false]);

  void setChosen(bool chosen) {
    this.chosen = chosen;
  }
}