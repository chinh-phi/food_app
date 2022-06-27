import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  var oldPasswordController = TextEditingController();
  var isEmpty = false.obs;

  void input(String value) {
    if(value.isEmpty) {
      isEmpty.value = false;
    } else {
      isEmpty.value = true;
    }
  }
}