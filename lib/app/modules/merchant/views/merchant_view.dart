import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:food_app_247/app/modules/merchant/controllers/merchant_detail_controller.dart';
import 'package:food_app_247/app/modules/merchant/views/cart_view.dart';
import 'package:food_app_247/app/modules/merchant/views/merchant_comment.dart';
import 'package:food_app_247/app/modules/merchant/views/merchant_info.dart';
import 'package:food_app_247/app/modules/merchant/views/food_detail.dart';
import 'package:food_app_247/app/modules/payment/views/payment_view.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:food_app_247/re_use_function.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MerchantView extends GetView<MerchantDetailController> {
  const MerchantView({Key? key}) : super(key: key);
  callback(value) {
    controller.state.value = value;
    if(controller.state.value) {
      controller.updateCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MerchantDetailController());
    return Obx(() => Scaffold(
      body: controller.isDataProcessing.value
          ? const Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor))
          : SizedBox(height: Dimensions.screenHeight,child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollStartNotification) {
              controller.onStartScroll(scrollNotification.metrics);
            } else if (scrollNotification is ScrollUpdateNotification) {
              controller.onUpdateScroll(scrollNotification.metrics);
            } else if (scrollNotification is ScrollEndNotification) {
              controller.onEndScroll(scrollNotification.metrics);
            }
            return true;
          },
          child: Stack(
              children: [
                SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.4,
                            child: Stack(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height*0.3,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              image: DecorationImage(
                                                image: controller.merchantDetailInfo.value.coverImageLink != null ? NetworkImage(controller.merchantDetailInfo.value.coverImageLink!) : const AssetImage('assets/images/img_default.png') as ImageProvider,
                                                fit: BoxFit.cover,
                                              )
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: FractionalOffset.bottomCenter,
                                                end: FractionalOffset.topCenter,
                                                colors: [
                                                  Colors.grey.withOpacity(0.0),
                                                  const Color(0xFF424242).withOpacity(0.4),
                                                ],
                                                stops: const [
                                                  0.0,
                                                  1.0
                                                ]
                                            ),

                                          ),
                                        )
                                      ],
                                    )
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      child: Container(
                                          height: MediaQuery.of(context).size.height*0.2,
                                          margin: const EdgeInsets.symmetric(horizontal: 30),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.4),
                                                  blurRadius: 5.0, // soften the shadow
                                                  spreadRadius: 2.0, //extend the shadow
                                                  offset: const Offset(
                                                    1.0,
                                                    1.0,
                                                  ),
                                                )
                                              ]
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                        Icons.verified_rounded,
                                                        color: Dimensions.primaryColor
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text('ĐÔÍ TÁC CỦA 247', style: TextStyle(color: Dimensions.primaryColor, fontSize: 18))
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                        child: Text(
                                                          controller.merchantDetailInfo.value.name!,
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 22,
                                                              fontWeight: FontWeight.bold),
                                                          textAlign: TextAlign.center,
                                                        )
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                    height: 20
                                                ),
                                                Text(
                                                  '${controller.merchantDetailInfo.value.distance}km | ${controller.merchantDetailInfo.value.address}',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          )
                                      ),
                                      onTap: () {
                                        showCupertinoModalBottomSheet(
                                            context: context,
                                            builder: (context) => PartnerInfo(item: controller.dateInfo.value),
                                            expand: true,
                                            isDismissible: false,
                                            duration: Duration(milliseconds: 300)
                                        );
                                      },
                                    )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.yellow,
                                        size: 30,
                                      ),
                                      const SizedBox(width: 5),
                                      Text('${controller.merchantDetailInfo.value.avgRating}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      const SizedBox(width: 5),
                                      Text('(${controller.merchantDetailInfo.value.totalReviews})', style: const TextStyle(color: Colors.black87, fontSize: 16)),
                                      const SizedBox(width: 10),
                                      const Icon(
                                        Icons.shopping_basket_outlined,
                                        color: Colors.black87,
                                        size: 26,
                                      ),
                                      const SizedBox(width:5),
                                      Text('${controller.merchantDetailInfo.value.totalOrders} đã bán', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  child: const Text('Xem đánh giá', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Dimensions.primaryColor)),
                                  onTap: () {
                                    Get.to(() => PartnerComment());
                                  },
                                )
                              ],
                            ),
                          ),
                          for(var index = 0 ; index < controller.merchantDetailInfo.value.food!.length ; index++)
                            InkWell(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xFFe8e8e8)
                                        )
                                    )
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 90,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(controller.merchantDetailInfo.value.food![index].name!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                                              Text(format(controller.merchantDetailInfo.value.food![index].price!), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.red)),
                                            ]
                                        ),
                                      ),
                                    ),

                                    Container(
                                        padding: const EdgeInsets.only(left: 5),
                                        height: 110,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: controller.merchantDetailInfo.value.food![index].imageLink != null ? NetworkImage(controller.merchantDetailInfo.value.food![index].imageLink!) : const AssetImage('assets/images/img_default.png') as ImageProvider,
                                              fit: BoxFit.cover,
                                            )
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                showCupertinoModalBottomSheet(
                                  context: context,
                                  builder: (context) => FoodDetail(id: controller.merchantDetailInfo.value.food![index].id!, callbackFunction: callback),
                                );
                              },
                            )

                        ]
                    )
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    // margin: EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(top: 40, bottom: 20),
                    decoration: BoxDecoration(
                        color: controller.offsetScrollController.value != 0.0 ? Colors.white : Colors.transparent,
                        border: controller.offsetScrollController.value != 0.0
                            ? const Border(
                            bottom: BorderSide(
                                color: Color(0xFFe8e8e8)
                            )
                        )
                            : const Border()
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.arrow_back, color: controller.offsetScrollController.value != 0.0 ? Colors.black : Colors.white, size: 25,),
                              onPressed: () async {
                                await Get.delete<FavoriteController>();
                                Get.back();
                              },
                            ),
                            Expanded(
                                child: controller.offsetScrollController.value != 0.0
                                    ? Container(
                                  child: TextField(
                                    // controller: _controller,
                                    onTap: () async {
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: Color(0xFF3b3b3b),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.white)),
                                      hintText: 'Tìm kiếm ở đây',
                                      contentPadding: EdgeInsets.all(0),
                                      fillColor: Color(0xFFF3F3F3),
                                      filled: true,
                                    ),
                                  ),
                                )
                                    : Container()
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                                color: controller.isFavorite.value
                                    ? Colors.red
                                    : controller.offsetScrollController.value == 0.0 ? Colors.white : Colors.black,
                                size: 25,
                              ),
                              onPressed: () async {
                                await controller.clickFavorite();
                              },
                            ),
                            controller.offsetScrollController.value == 0.0
                                ? IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.search,
                                color: controller.offsetScrollController.value != 0.0
                                    ? Colors.black
                                    : Colors.white,
                                size: 25,
                              ),
                              onPressed: () {},
                            )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: controller.cartLength.value > 0 ? Container(
                    padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                    // height: 60,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 50,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Dimensions.primaryColor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_basket,
                                  color: Dimensions.primaryColor,
                                  size: 40,
                                ),
                                const SizedBox(width: 5,),
                                Text('${controller.cartLength.value}', style: const TextStyle(color: Dimensions.primaryColor, fontSize: 16))
                              ],
                            ),
                            onTap: () {
                              showCupertinoModalBottomSheet(
                                  context: context,
                                  builder: (context) => CartView(callbackFunction: callback),
                                  expand: true,
                                  isDismissible: false,
                                  duration: const Duration(milliseconds: 300)
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Dimensions.primaryColor,
                              ),
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(child: InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Trang thanh toán', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                                    SizedBox(width: 5,),
                                    const Icon(
                                        Icons.fiber_manual_record,
                                        size: 6,
                                        color: Colors.white
                                    ),
                                    SizedBox(width: 5,),
                                    Text(format(controller.cartTotal.value), style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500))
                                  ],
                                ),
                                onTap: () async {
                                  await controller.createOrder();
                                  Get.to(() => const PaymentView());
                                },
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ) : Container(),
                )
              ]
          )
      ),)
    ));
  }

}
