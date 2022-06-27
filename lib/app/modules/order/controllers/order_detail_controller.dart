import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/order/models/OrderDetailModel.dart';
import 'package:food_app_247/app/modules/order/providers/order_api.dart';
import 'package:food_app_247/app/modules/payment/models/payment_order_detail_model.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  var orderInfo = PaymentOrderDetailModel().obs;
  var id = Get.parameters["id"]!;
  var isDataProcessing = false.obs;

  @override
  void onInit() async {
    super.onInit();
    // Fetch Data
    await getData(id);
  }

  getData(id) async {
    try {
      isDataProcessing(true);
      var res = await OrderApi.getOrderDetail(id);
      print(res);
      if(res != '') {
        orderInfo.value = PaymentOrderDetailModel.fromJson(res);
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