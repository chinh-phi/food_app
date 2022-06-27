import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabController;
  final List<Tab> myTabs = <Tab>[
    const Tab(
        child: Text('Đang đến', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
    ),
    const Tab(
        child: Text('Lịch sử', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
    ),
    const Tab(
        child: Text('Đánh giá', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
    )
  ];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }
}