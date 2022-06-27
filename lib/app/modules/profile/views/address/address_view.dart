import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import 'add_address_view.dart';
import 'address_item.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Địa chỉ', style: TextStyle(color: Colors.black)),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              AddressItem(
                text: 'Thêm địa chỉ Nhà',
                icon: Icons.home_outlined,
                press: () {

                },
              ),
              AddressItem(
                text: 'Thêm địa chỉ Công ty',
                icon: Icons.work_outline_outlined,
                press: () {

                },
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const AddAddressView());
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Dimensions.primaryColor),
          ),
          child: const Text('Thêm địa chỉ mới', style: TextStyle(fontSize: 16),),
        ),
      ),
    );
  }
}
