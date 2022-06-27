
import 'dart:convert';

import 'package:food_app_247/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/address/providers/address_choose_provider.dart';
import 'package:get/get.dart';


class AddressChooseController extends GetxController {
  final addressController = TextEditingController();
  var isDataProcessing = false.obs;
  var data = [].obs;
  var currentAddressInfo = Address().obs;



  @override
  void onInit() async {
    super.onInit();
    // Fetch Data
    getData();
  }

  void getData() async {

    try {
      isDataProcessing(true);
      var response = await AddressChooseProvider.getUserInfo();
      if(response != null) {
        data.add(response);
        var currentAddress = data[0].address.where((value) => value.type == "currentAddress").toList();
        currentAddressInfo.value = currentAddress[0];
        isDataProcessing(false);
      } else {
        print('Lỗi');
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}