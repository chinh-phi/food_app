import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/profile/views/settings/update_phone_number_view.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Số điện thoại', style: TextStyle(color: Colors.black)),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Số điện thoại', style: TextStyle(fontSize: 16)),
                    Text('${Get.arguments["phoneNumber"]}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const UpdatePhoneNumberView(), arguments: {"phoneNumber": "${Get.arguments["phoneNumber"]}"});
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Dimensions.primaryColor),
                  ),
                  child: const Text('Cập nhật số điện thoại', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
