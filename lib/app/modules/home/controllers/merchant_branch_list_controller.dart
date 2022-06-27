import 'package:food_app_247/app/modules/home/providers/merchant_branch_list_api.dart';
import 'package:get/get.dart';

class MerchantBranchListController extends GetxController {
  var listBranchMerchant = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var title = Get.arguments[1]["title"];
  var ids = [].obs;

  @override
  void onInit() {
    super.onInit();
    ids.value = Get.arguments[0]["listId"];
    getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getData() async {
    try {
      isDataProcessing(true);
      var res = await MerchantBranchListApi.getListBranch(ids);
      if(res.isNotEmpty) {
        listBranchMerchant.addAll(res);
        isDataProcessing(false);
      }
      // isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
}
