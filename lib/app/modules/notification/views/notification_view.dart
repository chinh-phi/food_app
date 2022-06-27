import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Thông báo', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          const SliverToBoxAdapter(
              child: Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              )
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 1, color: Dimensions.primaryColor)
                    ),
                    child: Icon(
                      Icons.sell_outlined,
                      color: Dimensions.primaryColor
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Khuyến mãi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Dimensions.primaryColor)),
                          Text('CHỈ 1K THẢ GA ĂN XẾ')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.chevron_right_outlined,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              )
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 1, color: Dimensions.primaryColor)
                    ),
                    child: Icon(
                      Icons.campaign_outlined,
                      color: Dimensions.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tin tức', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Dimensions.primaryColor)),
                          Text('Chưa có tin tức nào')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.chevron_right_outlined,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Color(0xFFe0e0e0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Cập nhật quan trọng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87)),
                  Text('Đọc tất cả', style: TextStyle(fontSize: 16, color: Colors.grey))
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/img_default.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Đơn hàng tại Family Chicken - Gà Rán, Bánh Gà & Đồ Ăn Vặt - Hồ Tùng Mậu đã hoàn tất', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 10),
                                Text('29/04/2022 02:01', style: TextStyle(fontSize: 13, color: Colors.grey))
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Colors.grey,
                        height: 10,
                        thickness: 1,
                      )
                    ]
                  ),
                );
              },
              childCount: 10, // 1000 list items
            ),
          ),
        ],
      )
    );
  }
}
