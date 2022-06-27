import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../controllers/order_controller.dart';
import 'order_coming_view.dart';
import 'order_evaluate_view.dart';
import 'order_history_view.dart';



class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 0.0,
                stretch: true,
                backgroundColor: Colors.white,
                // backgroundColor: Colors.white,
                bottom: TabBar(
                  controller: controller.tabController,
                  labelColor: Dimensions.primaryColor,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Dimensions.primaryColor,

                  tabs: controller.myTabs
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller.tabController,
            children: [
              OrderComingView(),
              OrderHistoryView(),
              OrderEvaluateView()
            ],
          ),
        )
    );
  }
}
