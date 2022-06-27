import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/home/models/res_branch_model.dart';
import 'package:food_app_247/app/modules/home/providers/suggestion_res_provider.dart';
import 'package:food_app_247/app/modules/home/views/suggestion/res_branch_card.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SuggestionController extends GetxController {


  var listData = List<dynamic>.empty(growable: true).obs;
  var listBranch = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;

  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // To Save Task
  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  void getData() async {
    try {
      isDataProcessing(true);
      var res = await SuggestionResProvider.getSuggestion();
      if(res.isNotEmpty) {
        listData.addAll(res);
        isDataProcessing(false);
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  void clickMerchant(id) {
    Get.toNamed('/merchant-detail/:$id');
  }

  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  showModalBottomSheet(context, listBranch) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) =>CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Sữa Chua Trân Châu Hạ Long', style: TextStyle(color: Colors.black)),
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
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, crossAxisSpacing: 5, childAspectRatio: 3.1),
              delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
                var value = ResBranchModel.fromJson(listBranch[index]);
                return ResBranchCard(item: value);
              }, childCount: listBranch.length),
            )
          ],
        ),
        enableDrag: false,
        duration: const Duration(milliseconds: 500)
    );
  }

}