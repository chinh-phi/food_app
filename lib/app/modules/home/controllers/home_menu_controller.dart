import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/home/models/home_menu_model.dart';
import 'package:food_app_247/app/modules/home/providers/home_menu_api.dart';
import 'package:get/get.dart';

class HomeMenuController extends GetxController {
  var listMenu = List<HomeMenuModel>.empty(growable: true).obs;
  var isDataProcessing = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      isDataProcessing(true);
      var res = await HomeMenuApi.getMenuGrid();
      if(res.isNotEmpty) {
        listMenu.addAll(res);
        isDataProcessing(false);
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
      print(exception.toString());
    }
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}