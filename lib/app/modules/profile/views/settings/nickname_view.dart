import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/profile/views/settings/setting_user_item.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/nickname_controller.dart';


class NicknameView extends GetView<NicknameController> {
  const NicknameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NicknameController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nickname', style: TextStyle(color: Colors.black)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
              color: Dimensions.primaryColor
          ),
          onPressed: () {
            Get.back();
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(padding: const EdgeInsets.all(10), child: const Text('Ảnh đại diện', style: TextStyle(fontSize: 16))),
              SettingUserItem(
                press: () {
                  controller.chooseOption();
                },
                hintText: 'Đổi hình đại diện',
                haveChild: true,
                color: Dimensions.primaryColor,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Obx(() => CircleAvatar(
                    radius: 30,
                    backgroundImage: controller.selectedImagePath.value == ''
                    ? const AssetImage('assets/images/avatar.png')
                        : FileImage(File(controller.selectedImagePath.value)) as ImageProvider
                  ))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
