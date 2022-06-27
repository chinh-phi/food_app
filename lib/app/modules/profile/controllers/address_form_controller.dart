import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressFormController extends GetxController {
  var name = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var building = ''.obs;
  var gate = ''.obs;
  var option = ''.obs;
  var note = ''.obs;
  var data = [].obs;

  List<String> options = [
    'Nhà', 'Công ty', 'Khác'
  ];
  var checked = List.filled(3, false).obs;
  var isChosen = false.obs;

  var curIndex = -1.obs;
  void clickOption(index) {
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

  @override
  void onInit() {
    data.value = Get.arguments;
  }
}