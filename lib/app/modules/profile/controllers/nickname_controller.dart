import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NicknameController extends GetxController {

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void chooseOption() {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text('Chọn ảnh đai diện', style: TextStyle(fontSize: 18))),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFe1e1e1),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: Text('Chụp ảnh', style: TextStyle(fontSize: 20, color: Colors.blue))
                  ),
                ),
                onTap: () {
                  getImage(ImageSource.camera);
                },
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFe1e1e1),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                      child: Text('Chọn ảnh', style: TextStyle(fontSize: 20, color: Colors.blue))
                  ),
                ),
                onTap: () {
                  getImage(ImageSource.gallery);
                },
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFe1e1e1),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                  child: const Center(
                      child: Text('Hủy', style: TextStyle(fontSize: 18, color: Colors.blue))),
                  onTap: () {
                    Get.back();
                  },
                ),
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
}