import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/order/controllers/order_evaluate_controller.dart';
import 'package:food_app_247/app/modules/order/models/order_empty_notify_model.dart';
import 'package:food_app_247/app/modules/order/views/order_empty_view.dart';
import 'package:food_app_247/app/modules/order/views/order_evaluate_detail.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:food_app_247/re_use_function.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderEvaluateView extends GetView<OrderEvaluateController> {
  const OrderEvaluateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderEvaluateController());
    return Scaffold(
      body: Obx(() {
        if (controller.isDataProcessing.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if(controller.lists.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => OrderEvaluateDetail());
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Mã đơn hàng: ${controller.lists[index].id}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black54)),
                            Text('${DateFormat('H:m').format(DateTime.parse(controller.lists[index].createdAt!))} ${DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.lists[index].createdAt!))}')
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: controller.lists[index].restaurant!.coverImageLink != null
                                          ? NetworkImage(controller.lists[index].restaurant!.coverImageLink!)
                                          : const AssetImage('assets/images/img_default.png') as ImageProvider,
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            Expanded(

                              child: Container(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.lists[index].restaurant!.name!, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 5),
                                    Text(controller.lists[index].restaurant!.address!, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                                    const SizedBox(height: 5),
                                    Text('Tổng tiền: ${format(controller.lists[index].grandTotal!)}')
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Colors.black26,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Hoàn thành', style: TextStyle(fontSize: 16)),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('Đánh giá');
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.deepOrange),
                                          color: Colors.white
                                      ),
                                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                                      child: const Text('Đánh giá', style: TextStyle(fontSize: 16, color: Dimensions.primaryColor),)
                                  ),

                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    print('Đặt lại');
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Dimensions.primaryColor, width: 1),
                                          color: Dimensions.primaryColor
                                      ),
                                      child: const Text('Đặt lại', style: TextStyle(fontSize: 16, color: Colors.white),)
                                  ),

                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.lists.length,
            );
          } else {
            return OrderEmptyView(
              item: OrderEmptyNotifyModel(urlImage: 'assets/images/star_bell.png',
                title: 'Chưa có đơn để đánh giá',
                subtitle: 'Quào! Tất cả các đơn hàng đều đã được đánh giá!',),
            );
          }
        }
      }),
    );

  }
}
