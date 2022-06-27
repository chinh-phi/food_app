import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/order/models/order_coming_model.dart';
import 'package:get/get.dart';

import '../providers/order_api.dart';


class OrderComingController extends GetxController {
  var lists = List<OrderComingModel>.empty(growable: true).obs;
  var isDataProcessing = false.obs;

  @override
  void onInit() async {
    super.onInit();
    // Fetch Data
    getData();
  }

  void getData() async {
    try {
      isDataProcessing(true);
      var res = await OrderApi.getListOrder('/user/orders/incoming');
      if(res.isNotEmpty) {
        List<OrderComingModel> tmp = List<OrderComingModel>.from(res.map((model)=> OrderComingModel.fromJson(model)));
        lists.addAll(tmp);
        isDataProcessing(false);
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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}