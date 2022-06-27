import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/order/controllers/order_detail_controller.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:food_app_247/re_use_function.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetail extends GetView<OrderDetailController> {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderDetailController());
    return Scaffold(
        body: Obx(() => controller.isDataProcessing.value
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              expandedHeight: 40,
              backgroundColor: Colors.white,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'Chi tiết đơn hàng',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz_sharp,
                    color: Dimensions.primaryColor,
                  ),
                  onPressed: () {
                    print("More");
                  },
                )
              ],
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Dimensions.primaryColor,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Dimensions.primaryColor,
                            size: 18,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: const Divider(
                                color: Colors.grey,
                                height: 10,
                                thickness: 1,
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.fiber_manual_record,
                            color: Colors.grey,
                            size: 14,
                          ),
                          Expanded(
                            child: Container(
                              margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: const Divider(
                                color: Colors.grey,
                                height: 10,
                                thickness: 1,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: Colors.grey,
                            size: 14,
                          ),
                          // Icon(
                          //   Icons.check_circle,
                          //   color: Dimensions.primaryColor,
                          //   size: 18,
                          // ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 38),
                          child: Text('Đã đặt',
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: const Divider(
                              color: Colors.white,
                              height: 10,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Text('Đã lấy',
                                style:
                                TextStyle(color: Colors.grey, fontSize: 14))),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: const Divider(
                              color: Colors.white,
                              height: 10,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text('Hoàn thành',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 42),
                          child: Text(DateFormat('H:m').format(DateTime.parse(controller.orderInfo.value.orderedAt!)),
                              style: TextStyle(color: Colors.grey, fontSize: 13)),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: const Divider(
                              color: Colors.white,
                              height: 10,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 16),
                            child: controller.orderInfo.value.deliveredAt != null
                                ? Text('${DateFormat('H:m').format(DateTime.parse(controller.orderInfo.value.deliveredAt!))}',
                                style:
                                TextStyle(color: Colors.grey, fontSize: 13)) : Container()),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: const Divider(
                              color: Colors.white,
                              height: 10,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 38),
                            child: controller.orderInfo.value.pickedAt!=null ? Text('${DateFormat('H:m').format(DateTime.parse(controller.orderInfo.value.pickedAt!))}',
                                style:
                                TextStyle(color: Colors.grey, fontSize: 13)) : Container()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    color: Colors.grey,
                    height: 10,
                    thickness: 1,
                  ),
                )),
            SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Text('Giao đến',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
            ),
            SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          controller.orderInfo.value.address!.address!,
                          style: TextStyle(fontSize: 15)),
                      SizedBox(height: 10),
                      Text('Thời gian ${DateFormat('H:m').format(DateTime.parse(controller.orderInfo.value.createdAt!))} ${DateFormat('dd-MM-yyyy').format(DateTime.parse(controller.orderInfo.value.createdAt!))}')
                    ],
                  ),
                )),
            const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Divider(
                    color: Colors.grey,
                    height: 10,
                    thickness: 1,
                  ),
                )
            ),
            SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Flexible(
                          child: Text(
                              'Chi tiết đơn hàng',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis)),
                    ],
                  )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: controller.orderInfo.value.foods![index].imageLink != null
                                          ? NetworkImage(controller.orderInfo.value.foods![index].imageLink!)
                                          : const AssetImage('assets/images/img_default.png') as ImageProvider,
                                      fit: BoxFit.fill
                                  )
                              )
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text('${controller.orderInfo.value.foods![index].quantity} x ${controller.orderInfo.value.foods![index].name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 15)),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(format(controller.orderInfo.value.foods![index].price),
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                },
                childCount: controller.orderInfo.value.foods!.length,
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tổng',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        Text(format(controller.orderInfo.value.subTotal),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))
                      ],
                    ))),
            const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Divider(
                    color: Colors.grey,
                    height: 10,
                    thickness: 1,
                  ),
                )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Phí giao hàng'), Text(format(controller.orderInfo.value.shippingFee))],
                    ),
                    controller.orderInfo.value.voucher != null
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Giảm giá'), Text(format(controller.orderInfo.value.voucher!.value))],
                    )
                        : Container()
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    format(controller.orderInfo.value.grandTotal),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.right,
                  )),
            ),
            const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Divider(
                    color: Colors.grey,
                    height: 10,
                    thickness: 1,
                  ),
                )),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('Đánh giá');
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                                'Đánh giá',
                                style:
                                TextStyle(fontSize: 18, color: Colors.deepOrange),
                              )),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print('Đặt lại');
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepOrange),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.deepOrange,
                            ),
                            child: Center(
                                child: Text(
                                  'Đặt lại',
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ))),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ))
    );
  }
}
