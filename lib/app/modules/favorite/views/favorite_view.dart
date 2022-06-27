import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';
import 'favorite_item.dart';


class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavoriteController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Nhà hàng yêu thích', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Obx(() => controller.isDataProcessing.value
          ? const Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor))
          : controller.lists.isEmpty
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/favorite.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Text('Thả tim vào quán bạn yêu nào!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Text('Hãy lấp đầy dạ dày bằng một trái tim xinh. Thả tim <3 để lưu lại quán ngon bạn thích nhé!', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
          )
        ],
      )
          : ListView.builder(
        itemBuilder: (_, index) => FavoriteItem(item: controller.lists[index], controller: controller),
        itemCount: controller.lists.length,
      )
      )
    );
  }
}
