import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:food_app_247/re_use_function.dart';
import 'package:get/get.dart';

import '../../payment/views/payment_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key, required this.callbackFunction}) : super(key: key);
  final Function callbackFunction;
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController(context: context));
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title:
                const Text('Giỏ hàng', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                pinned: true,
                leading: IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.black),
                  onPressed: () {
                    callbackFunction(false);
                    Get.delete<CartController>();
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Center(
                    child: InkWell(
                      child: Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: const Text('Xóa', style: TextStyle(color: Colors.red, fontSize: 18))
                      ),
                      onTap: () async {
                        await controller.clickDeleteAll();
                        callbackFunction(true);

                      },
                    ),
                  )
                ],
                bottom: PreferredSize(
                    child: Container(
                      color: Color(0xFFe8e8e8),
                      height: 1.0,
                    ),
                    preferredSize: Size.fromHeight(1.0)
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFe8e8e8)
                              )
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.cartList[index].name!, style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 5,),
                          // Text(controller.cartList[index].detail!, overflow: TextOverflow.ellipsis,),
                          // const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(format(controller.cartList[index].oldPrice!), style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black.withOpacity(0.6))),
                                  const SizedBox(width: 5),
                                  Text(format(controller.cartList[index].newPrice!), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                                ],
                              ),
                              Row(
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
                                        icon: const Icon(Icons.remove_rounded, color: Dimensions.primaryColor,),
                                        onPressed: () async {
                                          await controller.clickRemoveItem(controller.cartList[index]);
                                          callbackFunction(true);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text('${controller.cartList[index].number!}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                                    const SizedBox(width: 10),
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
                                        onPressed: () async {
                                          await controller.clickAddItem(controller.cartList[index]);
                                          callbackFunction(true);
                                        },
                                      ),
                                    ),
                                  ]
                              )
                            ],
                          )


                        ],
                      ),
                    );
                  },
                  childCount: controller.cartList.length, // 1000 list items
                ),
              ),
            ],
          ),
          controller.isDataProcessing.value ? Center(child: CircularProgressIndicator()) : Center()
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              await controller.createOrder();
              Get.to(() => PaymentView());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Dimensions.primaryColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${controller.cartNumber.value} Món', style: TextStyle(fontSize: 18),),
                const Text('Trang thanh toán', style: TextStyle(fontSize: 18)),
                Text(format(controller.cartMoney.value), style: TextStyle(fontSize: 18))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
