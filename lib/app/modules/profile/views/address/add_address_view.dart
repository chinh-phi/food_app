import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/address_form_controller.dart';

class AddAddressView extends GetView<AddressFormController> {
  const AddAddressView({Key? key, this.option}) : super(key: key);
  final String? option;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressFormController());
    for(var i = 0 ; i < controller.options.length ; i++) {
      if(option!.compareTo(controller.options[i]) == 0) {
        controller.clickOption(i);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm địa chỉ mới', style: TextStyle(color: Colors.black)),
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
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: TextEditingController(text: controller.data[0]["name"]),
                  decoration: const InputDecoration(
                    hintText: 'Tên',
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFe1e1e1))
                    )
                  ),
                ),
                TextFormField(
                  controller: TextEditingController(text: controller.data[1]["phone"]),
                  decoration: const InputDecoration(
                      hintText: 'Số điện thoại',
                      fillColor: Colors.white,
                      filled: true,
                    border: InputBorder.none
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Chọn địa chỉ',
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFe1e1e1))
                      )
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Tòa nhà/ Số tầng (Không bắt buộc)',
                    fillColor: Colors.white,
                    filled: true,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFe1e1e1))
                      )
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Cổng (Không bắt buộc)',
                    fillColor: Colors.white,
                    filled: true,
                    border: InputBorder.none
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      for(var i = 0 ; i < controller.options.length ; i++)
                        InkWell(
                          onTap: () {
                            controller.clickOption(i);
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    border: controller.checked[i] ? Border.all(color: Dimensions.primaryColor) : Border.all(color: Colors.white),
                                    color: controller.checked[i] ? Colors.white : const Color(0xFFe8e8e8),
                                    borderRadius: BorderRadius.circular(2)
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Text(
                                  controller.options[i],
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              controller.checked[i]
                                  ? Positioned(child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Dimensions.primaryColor,
                                ),
                                child: const Icon(Icons.check, size: 14, color: Colors.white),

                              ))
                                  : Container()

                            ],
                          ),
                        )

                    ]

                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Ghi chú cho tài xế (Không bắt buộc)',
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Dimensions.primaryColor),
          ),
          child: const Text('Lưu', style: TextStyle(fontSize: 16),),
        ),
      ),
    );
  }
}

