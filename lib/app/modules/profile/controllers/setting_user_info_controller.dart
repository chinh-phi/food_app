
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/profile/api/setting_api.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:food_app_247/user_model.dart';
import 'package:get/get.dart';


import '../views/settings/email_view.dart';
import '../views/settings/job_view.dart';
import '../views/settings/name_view.dart';
import '../views/settings/nickname_view.dart';
import '../views/settings/setting_user_info.dart';

class SettingUserInfoController extends GetxController {

  var isDataProcessing = false.obs;
  var userInfo = UserModel().obs;
  var date = ''.obs;
  var gender = ''.obs;


  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUserInfo() async {
    try {
      isDataProcessing(true);
      var res = await SettingApi.getUserInfo();
      if(res!=null) {
        userInfo.value = res;
        var temp = '';
        temp = userInfo.value.birthday ?? '';
        if(temp.isNotEmpty) {
          date.value = temp.substring(0,10);
        }
        gender.value = userInfo.value.gender ?? '';
        isDataProcessing(false);
      }
    } catch(e) {
      isDataProcessing(false);
    }
  }

  void getAvatar() {
    Get.to(() => NicknameView());
  }

  void getSex() {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            children: [
              InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.transgender,
                    color: gender.value == '' ? Dimensions.primaryColor : Colors.black,
                  ),
                  title: Text('None', style: TextStyle(color: gender.value == '' ? Dimensions.primaryColor : Colors.black)),
                ),
                onTap: () async {
                  gender.value = '';
                  await setSex('gender', gender.value);
                  // Get.back();
                },
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFe1e1e1),
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.male,
                    color: gender.value == 'Nam' ? Dimensions.primaryColor : Colors.black,
                  ),
                  title: Text('Nam', style: TextStyle(color: gender.value == 'Nam' ? Dimensions.primaryColor : Colors.black)),
                ),
                onTap: () async {
                  gender.value = 'Nam';
                  await setSex('gender', gender.value);
                  // Get.back();
                },
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFe1e1e1),
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.female,
                    color: gender.value == 'Nữ' ? Dimensions.primaryColor : Colors.black,
                  ),
                  title: Text('Nữ', style: TextStyle(color: gender.value == 'Nữ' ? Dimensions.primaryColor : Colors.black)),
                ),
                onTap: () async {
                  gender.value = 'Nữ';
                  await setSex('gender', gender.value);
                  // Get.back();
                },
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFe1e1e1),
              ),
              InkWell(
                child: const SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Center(
                      child: Text('Hủy', style: TextStyle(fontSize: 18))),
                ),
                onTap: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        isDismissible: false,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }

  void getBirthday() {
    Get.bottomSheet(
        SizedBox(
          height: Dimensions.screenHeight*0.3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: const Text('Hủy bỏ', style: TextStyle(fontSize: 16)),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    InkWell(
                      child: const Text('Xong', style: TextStyle(fontSize: 16, color: Dimensions.primaryColor)),
                      onTap: () async {
                        var birthdayValue = date.value;
                        // date.value = ;
                        await setBirthday("birthday", birthdayValue);
                      }
                    ),

                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFe1e1e1),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (date) {
                    var value = date.toString();
                        this.date.value = value.substring(0,10);
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        enableDrag: false,
        isDismissible: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
    );
  }

  setBirthday(column, value) async {
    try {
      await SettingApi.updateInfo(column, value);
      Get.back();
    } catch(e) {
      print("Lỗi xử lý");
    }
  }

  setSex(column, value) async {
    try {
      await SettingApi.updateInfo(column, value);
      Get.back();
    } catch(e) {
      print("Lỗi xử lý");
    }
  }

  void getJob() {
    Get.to(() => JobView());
  }

  void getEmail() {
    Get.to(() => EmailView());
  }

  void getName() {
    Get.to(() => NameView());
  }

}
