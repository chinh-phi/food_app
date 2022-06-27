import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/merchant/views/widgets/comment_item.dart';
import 'package:get/get.dart';

import '../controllers/partner_comment_controller.dart';


class PartnerComment extends GetView<PartnerCommentController> {
  PartnerComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PartnerCommentController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Đánh giá và Nhận xét', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
              color: Colors.black
          ),
          onPressed: () {
            Get.back();
          },
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xFFe8e8e8),
              height: 1.0,
            )
        ),
      ),
      body: CustomScrollView(
       slivers: [
         SliverList(
           delegate: SliverChildBuilderDelegate(
             (context, index) => CommentItem(item: controller.lists[index]),
             childCount: controller.lists.length
           ),

         )
       ], 
      )
    );
  }

}
