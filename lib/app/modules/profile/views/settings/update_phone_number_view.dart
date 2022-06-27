
import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/phone_controller.dart';

class UpdatePhoneNumberView extends GetView<PhoneController> {
  const UpdatePhoneNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PhoneController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cập nhật số điện thoại', style: TextStyle(color: Colors.black)),
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
      body: Obx(() => SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.phoneController,
                        onChanged: (value) => controller.input(value),
                        decoration: const InputDecoration(
                            hintText: 'Số điện thoại',
                            fillColor: Colors.white,
                            filled: true,
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFe8e8e8))
                            ),
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.black,
                            )
                        ),
                        autofocus: true,
                        keyboardType: TextInputType.number,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: controller.isEmpty.value ? null : () {
                            controller.updatePhone('phoneNumber', controller.phoneController.text);
                          },
                          style: ButtonStyle(
                            backgroundColor: controller.isEmpty.value ? MaterialStateProperty.all<Color>(Color(0xFFe1e1e1)) : MaterialStateProperty.all<Color>(Dimensions.primaryColor),
                          ),
                          child: Text('Lưu', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            controller.isDataProcessing.value
                ? Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor))
                : Container()
          ],
        ),
      )
    ));
  }
}
