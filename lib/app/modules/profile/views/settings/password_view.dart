import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PasswordController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Mật khẩu', style: TextStyle(color: Colors.black)),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back,
                color: Colors.deepOrange
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('Nhập Mật khẩu hiện tại', style: TextStyle(fontSize: 16))
                    ),
                    TextFormField(
                      // controller: controller.emailController,
                      // onChanged: (value) => controller.input(value),
                      decoration: InputDecoration(
                        hintText: 'Mật khẩu hiện tại',
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text('Nhập Mật khẩu mới', style: TextStyle(fontSize: 16))
                    ),
                    TextFormField(
                      // controller: controller.emailController,
                      // onChanged: (value) => controller.input(value),
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu mới',
                          fillColor: Colors.white,
                          filled: true,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFe8e8e8))
                        ),
                      ),
                    ),
                    TextFormField(
                      // controller: controller.emailController,
                      // onChanged: (value) => controller.input(value),
                      decoration: InputDecoration(
                          hintText: 'Xác nhận',
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: controller.isEmpty.value ? null : () {

                        },
                        child: Text('Lưu', style: TextStyle(fontSize: 18)),
                        style: ButtonStyle(
                          backgroundColor: controller.isEmpty.value ? MaterialStateProperty.all<Color>(Colors.deepOrange) : MaterialStateProperty.all<Color>(Color(0xFFe1e1e1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}
