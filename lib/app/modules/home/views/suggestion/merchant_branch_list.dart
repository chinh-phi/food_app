import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/home/controllers/merchant_branch_list_controller.dart';
import 'package:food_app_247/app/modules/home/views/suggestion/res_branch_card.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../models/res_branch_model.dart';

class MerchantBranchList extends GetView<MerchantBranchListController> {
  const MerchantBranchList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MerchantBranchListController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(controller.title, style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            centerTitle: true,
            pinned: true,
            leading: Container(),
            actions: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () { Get.back(); },
              ),
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: const Color(0xFFe8e8e8),
                  height: 2.0,
                )
            ),
          ),
          Obx(() =>
              controller.isDataProcessing.value
                  ? SliverToBoxAdapter(
                  child: SizedBox(
                    height: Dimensions.screenHeight,
                    width: Dimensions.screenWidth,
                    child: const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Dimensions.primaryColor,
                        )
                    ),
                  )
              )
                  : SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, crossAxisSpacing: 5, childAspectRatio: 3.1),
                delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
                  var value = ResBranchModel.fromJson(controller.listBranchMerchant[index]);
                  return ResBranchCard(item: value);
                }, childCount: controller.listBranchMerchant.length),
              ))
        ],
      ),
    );
  }
}
