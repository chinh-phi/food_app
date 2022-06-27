import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/order/controllers/order_coming_controller.dart';
import 'package:food_app_247/app/modules/order/views/order_detail.dart';
import 'package:food_app_247/app/modules/order/views/order_empty_view.dart';
import 'package:food_app_247/re_use_function.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/order_empty_notify_model.dart';


class OrderComingView extends GetView<OrderComingController> {
  const OrderComingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderComingController());
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
                    Get.toNamed('/order-detail/${controller.lists[index].id}');
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
                            const Text('Đã đặt', style: TextStyle(fontSize: 16)),
                            Text(statusOrder(controller.lists[index].status!), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
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
            return OrderEmptyView(item: OrderEmptyNotifyModel(urlImage: 'assets/images/empty_order.png',
              title: 'Quên chưa đặt món rồi bạn ơi?',
              subtitle: 'Những đơn hàng đã được xác nhận, đang được chuẩn bị và giao đi sẽ được hiển thị ở đây để bạn có thể theo dõi nhé!',));
          }
        }
      }),
    );
  }


}
