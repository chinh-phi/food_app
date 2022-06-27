import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/address/models/suggestion_models.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:food_app_247/user_model.dart';
import 'package:get/get.dart';

import '../../profile/views/address/add_address_view.dart';
import '../../profile/views/address/address_item.dart';
import '../controllers/address_choose_controller.dart';
import '../providers/address_provider.dart';
import 'address_search_view.dart';

class AddressChooseView extends GetView<AddressChooseController> {
  const AddressChooseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressChooseController());
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
      body: Obx(() => SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                color: const Color(0xFFe1e1e1),
                child: TextField(
                  controller: controller.addressController,
                  readOnly: true,
                  onTap: () async {
                    // final SuggestionModel? result = await showSearch(
                    //   context: context,
                    //   delegate: AddressSearchView(),
                    // );
                    // // This will change the text displayed in the TextField
                    // if (result != null) {
                    //   final placeDetails = await AddressProvider()
                    //       .getPlaceDetailFromId(result.placeId);
                    //   controller.setPlace(result, placeDetails);
                    // }
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.black87),
                    hintText: "Nhập địa chỉ",
                    border: InputBorder.none,
                    fillColor: Colors.grey,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              controller.isDataProcessing.value
                  ? const Center(child: CircularProgressIndicator(
                color: Dimensions.primaryColor,

              ))
                  : controller.data.isEmpty ? _buildEmpty(context) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentAddress(),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: const Text('Đã lưu', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                    AddressItem(
                      text: 'Thêm địa chỉ Nhà',
                      icon: Icons.home_outlined,
                      press: () {
                        Get.to(() => const AddAddressView(option: 'Nhà'), arguments: [
                          {"name": controller.data[0].name},
                          {"phone": controller.data[0].phoneNumber}
                        ]);
                      },
                    ),
                    AddressItem(
                      text: 'Thêm địa chỉ Công ty',
                      icon: Icons.work_outline_outlined,
                      press: () {
                        Get.to(() => const AddAddressView(option: 'Công ty'), arguments: [
                          {"name": controller.data[0].name},
                          {"phone": controller.data[0].phoneNumber}
                        ]);
                      },
                    ),
                  ],
                ),




            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const AddAddressView(option: 'Khác'));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Dimensions.primaryColor),
          ),
          child: const Text('Thêm địa chỉ mới', style: TextStyle(fontSize: 16),),
        ),
      ),
    );
  }

  Widget currentAddress() {
    return Container(
        padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.place, size: 20, color: Dimensions.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(controller.currentAddressInfo.value.address.toString(), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16), overflow: TextOverflow.ellipsis,)),
                    InkWell(
                      child: const Text('Sửa', style: TextStyle(color: Dimensions.primaryColor)),
                      onTap: () {
                        Get.to(() => const AddAddressView(option: 'Khác'), arguments: [
                          {"name": controller.data[0].name},
                          {"phone": controller.data[0].phoneNumber}
                        ]);
                      },
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                    controller.currentAddressInfo.value.address.toString(),
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Colors.black.withOpacity(0.8))),
                const SizedBox(height: 5),
                Text('${controller.data[0].name}  ${controller.data[0].phoneNumber}', style: const TextStyle(fontSize: 16)),
              ],
            ),
          )
        ],
      )
    );
  }

  _buildEmpty(context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height *2/3,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/deliver.png'
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Text('Không có địa chỉ đã lưu', style: TextStyle(fontSize: 22, color: Colors.black.withOpacity(0.7))),
              ],
            )
        )
    );
  }

}
