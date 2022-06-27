import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/name_controller.dart';

class NameView extends GetView<NameController> {
  const NameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NameController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tên', style: TextStyle(color: Colors.black)),
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
      ),
      body: Obx(() => Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.nameController,
                        autofocus: true,
                        onChanged: (value) => controller.input(value),
                        decoration: const InputDecoration(
                            hintText: 'Tên',
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: controller.isEmpty.value ? null : () {
                            controller.updateName("name", controller.nameController.text);
                          },
                          style: ButtonStyle(
                            backgroundColor: controller.isEmpty.value ? MaterialStateProperty.all<Color>(Color(0xFFe1e1e1)) : MaterialStateProperty.all<Color>(Dimensions.primaryColor) ,
                          ),
                          child: const Text('Lưu', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          controller.isDataProcessing.value
              ? const Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor))
              : Container()
        ]
      )

    ));
  }
}
