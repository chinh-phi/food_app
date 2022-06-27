import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/merchant/controllers/food_detail_controller.dart';
import 'package:food_app_247/app/modules/merchant/models/cart_item_model.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:food_app_247/re_use_function.dart';
import 'package:get/get.dart';


class FoodDetail extends GetView<FoodDetailController> {
  const FoodDetail({Key? key, required this.id, required this.callbackFunction}) : super(key: key);
  final int id;
  final Function callbackFunction;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FoodDetailController(context: context));
    controller.foodId.value = id;
    return Obx(() => controller.isDataProcessing.value
        ? const Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor))
        : Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(controller.foodDetail.value.name!, style: TextStyle(color: Dimensions.primaryColor),),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.close_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Get.delete<FoodDetailController>();
                callbackFunction(false);
                Get.back();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: controller.foodDetail.value.imageLink != null ? NetworkImage(controller.foodDetail.value.imageLink!) : const AssetImage('assets/images/img_default.png') as ImageProvider,
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(controller.foodDetail.value.name!, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                    )
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      controller.foodDetail.value.oldPrice != null
                          ? Text(format(controller.foodDetail.value.oldPrice!), style: TextStyle(decoration: TextDecoration.lineThrough))
                          : Container(),
                      Text(format(controller.foodDetail.value.newPrice!))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.screenHeight*0.1,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)
                            // border: Border.all(color: Colors.deepOrange),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.remove_rounded, color: !controller.isBlock.value ? Dimensions.primaryColor : Colors.grey.withOpacity(0.3)),
                            onPressed: () {
                              controller.clickRemove();

                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text('${controller.numOfFood.value}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                        const SizedBox(width: 15),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)
                            // border: Border.all(color: Colors.deepOrange),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.add_rounded, color: Dimensions.primaryColor,),
                            onPressed: () {
                              controller.clickAdd();

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Dimensions.primaryColor,

                  ),
                  child: InkWell(
                    child: Center(
                      child: Text('Thêm ${format(controller.totalMoney.value)}', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                    onTap: () async {
                      await controller.clickAddToCart(
                          CartItemModel(
                              id: controller.foodDetail.value.id!,
                              name: controller.foodDetail.value.name!,
                              totalMoney: controller.totalMoney.value,
                              oldPrice: controller.foodDetail.value.oldPrice!,
                              newPrice: controller.foodDetail.value.newPrice!,
                              number: controller.numOfFood.value
                          ),
                      );
                      // controller.state(true);
                      callbackFunction(true);
                      Get.delete<FoodDetailController>();
                      Get.back();
                    },
                  ),
                )
            )

          ],
        ),
      ),
    )
    );
  }
}
