import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/dashboard/views/dashboard_view.dart';
import 'package:food_app_247/app/modules/payment/controllers/payment_controller.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:food_app_247/re_use_function.dart';
import 'package:get/get.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PaymentController());
    return Obx(() => controller.isDataProcessing.value
        ? Scaffold(body: Center(child: CircularProgressIndicator()),)
        : Scaffold(
      backgroundColor: Color(0xFFe8e8e8),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('Trang thanh toán'),
                centerTitle: true,
                elevation: 0,
                pinned: true,
                leading: IconButton(
                  icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black
                  ),
                  onPressed: () async {
                    await controller.removeOrder();
                    Get.back();
                  },
                ),
                backgroundColor: Colors.white,
                bottom: PreferredSize(
                    child: Container(
                      color: const Color(0xFFe8e8e8),
                      height: 1.0,
                    ),
                    preferredSize: const Size.fromHeight(1.0)
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/logo-delivery.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Giao bởi tài xế', style: TextStyle(fontSize: 16)),
                                    InkWell(
                                      child: Text('Thay đổi', style: TextStyle(color: Dimensions.primaryColor, fontSize: 16, fontWeight: FontWeight.w500)),
                                      onTap: () {

                                      },
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Địa chỉ', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                    children: [
                                      Flexible(child: Text(controller.data.value.address!.address!, overflow: TextOverflow.ellipsis,))
                                    ]
                                )
                              ],
                            )
                        )
                      ],
                    ),
                  )
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 10)),
              _buildMyOrder(),
              _buildNote(),
              _buildTotal(),
              _buildVoucher(),
            ],
          ),
          controller.isApplyVoucher.value ? const Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor)) : Container(),

        ],
      ),
      bottomNavigationBar: _buildButtonBar(),
    ));
  }

  _buildMyOrder() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFe8e8e8))
              )
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text('${controller.data.value.foods![index].quantity!}x', style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 15)),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.data.value.foods![index].name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      // SizedBox(height: 5),
                    ],
                  )
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(format(controller.data.value.foods![index].price), style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 15, color: Colors.black.withOpacity(0.6))),
                    Text(format(controller.data.value.foods![index].price), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                InkWell(
                  child: Icon(
                    Icons.cancel_rounded,
                    color: Colors.grey.withOpacity(0.8),
                    size: 18,
                  ),
                  onTap: (){

                  },
                ),
              ],
            ),
          );
        },
        childCount: controller.data.value.foods!.length,
      ),
    );
  }

  _buildNote() {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color(0xFFe8e8e8))
            )
        ),
        padding: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Bạn có muốn nhắn gì tới nhà hàng không ?',
            prefixIcon: Icon(
              Icons.description_rounded,
            ),
            border: InputBorder.none,
          ),

        ),
      ),
    );
  }

  _buildTotal() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tạm tính', style: TextStyle(fontSize: 15)),
                Text(format(controller.data.value.subTotal), style: TextStyle(fontSize: 15))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Phí áp dụng', style: TextStyle(fontSize: 15)),
                    Icon(
                      Icons.keyboard_double_arrow_up_rounded,
                      color: Colors.orange,
                    ),
                    Icon(
                      Icons.help_rounded,
                      size: 18,
                      color: Colors.grey
                    ),
                  ],
                ),
                Text(format(controller.data.value.shippingFee), style: TextStyle(fontSize: 15))
              ]
            ),
            controller.data.value.voucher != null
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Phiếu mua hàng', style: TextStyle(fontSize: 15, color: Colors.orangeAccent)),
                Text('-${format(controller.data.value.voucher!.value!)}', style: TextStyle(fontSize: 16, color: Colors.orangeAccent)),
              ],
            )
                : Container(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tổng tiền', style: TextStyle(fontSize: 15, color: Dimensions.primaryColor)),
                Text(format(controller.data.value.grandTotal), style: TextStyle(fontSize: 16, color: Dimensions.primaryColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildVoucher() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10),
            itemCount: controller.listVoucher.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: InkWell(
                            child: Row(
                              children: [
                                Container(
                                  width: 5,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      color: Dimensions.primaryColor
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    // color: Colors.white,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(controller.listVoucher[index].name!, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.7))),
                                        Text(controller.listVoucher[index].name!, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                                        const SizedBox(height: 5),
                                        const Text('HSD: 31.12.2022', style: TextStyle(fontSize: 12))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              print('info');
                            }
                          )
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              color: !controller.listVoucherStatus.contains(controller.listVoucher[index].id) ? Dimensions.primaryColor : Colors.white,
                            ),
                            child: Center(child: !controller.listVoucherStatus.contains(controller.listVoucher[index].id) ? Text('Hủy') : Text('Chọn')),
                          ),
                          onTap: () async {
                            await controller.clickVoucher(controller.listVoucher[index].id);
                            // print('click');
                          }
                        ),
                      )
                    ],
                  )
              );
            },
          ),
        ),
      )
    );
  }

  _buildButtonBar() {
    return Container(
      width: double.infinity,
      height: Dimensions.screenHeight*0.15,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tiền mặt', style: TextStyle(fontSize: 18)),
                    Icon(
                      Icons.expand_less_rounded,
                      size: 24,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: Dimensions.screenHeight*0.15*0.3,
                width: 1,
                color: Color(0xFFadadad),
              ),
              Expanded(
                child: Center(child: Text('ADD A PROMO', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Dimensions.primaryColor))),
              )
            ],
          ),
          SizedBox(height: 10,),
          TextButton(
            child: SizedBox(
                height: Dimensions.screenHeight*0.15*0.2,
                child: Center(child: Text('Đặt hàng', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)))
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color(0xFFe8e8e8);
                    }
                    return controller.isApplyVoucher.value ?  Colors.grey.withOpacity(0.3) : Dimensions.primaryColor;
                  }),
            ),
            onPressed: () async {
              await controller.confirmOrder();
              Get.offAll(() => DashboardView());
            },
          )
        ],
      ),
    );
  }

}

