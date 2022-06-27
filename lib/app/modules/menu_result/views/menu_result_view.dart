import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/menu_result/controllers/menu_result_controller.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MenuResultView extends GetView<MenuResultController> {
  const MenuResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MenuResultController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.isDataProcessing.value
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(controller.categoryName, style: TextStyle(color: Colors.black)),
          elevation: 0,
          pinned: true,
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
        SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.6)),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Sắp xếp'),
                              Icon(
                                Icons.expand_more_rounded,
                                color: Colors.black.withOpacity(0.8),
                                size: 18,
                              ),
                            ],
                          ),
                          onTap: () {
                            _clickSort(context);
                          },
                        )
                    ),
                    const SizedBox(width: 5),
                    const Center(child: Text('Lọc: ')),
                    const SizedBox(width: 5),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.6)),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Danh mục'),
                                Icon(
                                  Icons.expand_more_rounded,
                                  color: Colors.black.withOpacity(0.8),
                                  size: 18,
                                ),
                              ],
                            ),
                            onTap: () {
                              _clickFilter(context);
                            }
                        )
                    ),
                    const SizedBox(width: 5),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.6)),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Đang mở cửa'),
                          ],
                        )
                    ),
                  ],
                )
            )
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xFFe8e8e8)
                          )
                      )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: controller.listResult[index].restaurantImage != null ? NetworkImage(controller.listResult[index].restaurantImage!) : const AssetImage('assets/images/img_default.png') as ImageProvider,
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      children: [
                                        Icon(
                                            Icons.verified_rounded,
                                            color: Color(0xFF3ac5c9)
                                        ),
                                        Flexible(
                                          child: Text(
                                            controller.listResult[index].restaurantName!,
                                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.left,
                                          ),
                                        )
                                      ]
                                  ),
                                  IntrinsicHeight(
                                      child:Row(
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(right: 5),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 16,
                                                  ),
                                                  Text(controller.listResult[index].avgRating!, style: TextStyle(color: Colors.black54, fontSize: 14)),
                                                ],
                                              )
                                          ),
                                          const VerticalDivider(
                                            color: Colors.black26,
                                            width: 1,
                                            thickness: 1,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                          Container(
                                              margin: EdgeInsets.all(5),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.place,
                                                    color: Colors.black54,
                                                    size: 16,
                                                  ),
                                                  Text('${controller.listResult[index].distance!}km', style: const TextStyle(color: Colors.black54, fontSize: 14)),
                                                ],
                                              )
                                          ),
                                          const VerticalDivider(
                                            color: Colors.black26,
                                            width: 1,
                                            thickness: 1,
                                            indent: 10,
                                            endIndent: 10,
                                          ),
                                          Container(
                                              margin: const EdgeInsets.only(left: 5),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                      Icons.watch_later,
                                                      color: Colors.black54,
                                                      size: 16
                                                  ),
                                                  Text('${controller.listResult[index].shippingTime!}min', style: const TextStyle(color: Colors.black54, fontSize: 14)),
                                                ],
                                              )
                                          ),
                                        ],
                                      )
                                  ),
                                  Row(children: [
                                    for (var i = 0; i < (controller.listResult[index].vouchers!.length > 3 ? 3 : controller.listResult[index].vouchers!.length); i++)
                                      Container(
                                          margin: const EdgeInsets.all(5),
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.red)),
                                          child: Text(controller.listResult[index].vouchers![i].name!,
                                              style: const TextStyle(
                                                  color: Colors.red, fontSize: 12)))
                                  ]),
                                ]
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.toNamed('/merchant-detail/:${controller.listResult[index].restaurantId}');
                },
              );
            },
            childCount: controller.listResult.length,
          ),
        ),
      ],
    ))
    );
  }

  _clickSort(context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Sắp xếp', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.black
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }
          ),

        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Gần tôi', style: TextStyle(fontSize: 18)),
                  Icon(
                    Icons.radio_button_unchecked_rounded,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Đánh giá tốt', style: TextStyle(fontSize: 18)),
                  Icon(
                    Icons.radio_button_unchecked_rounded,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Phổ biến', style: TextStyle(fontSize: 18)),
                  Icon(
                    Icons.radio_button_unchecked_rounded,
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  _clickFilter(context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Danh mục', style: TextStyle(color: Colors.black)),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
                icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.black
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }
            ),

          ),
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Trà/ Cà ph', style: TextStyle(fontSize: 18)),
                    Icon(
                      Icons.check_box_outline_blank_outlined,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Trà sữa', style: TextStyle(fontSize: 18)),
                    Icon(
                      Icons.check_box_outline_blank_outlined,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Sinh tố', style: TextStyle(fontSize: 18)),
                    Icon(
                      Icons.check_box_outline_blank_outlined,
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

}
