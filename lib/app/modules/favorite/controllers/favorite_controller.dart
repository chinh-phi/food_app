import 'package:get/get.dart';

import '../api/favorite_api.dart';
import '../models/favorite_model.dart';

class FavoriteController extends GetxController {

  var lists = List<FavoriteModel>.empty(growable: true).obs;
  var isDataProcessing = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData() async {
    try {
      isDataProcessing(true);
      var res = await FavoriteApi.getFavorite();
      if(res.isNotEmpty) {
        var tempList = res.map((value) => FavoriteModel.fromJson(value));
        lists.addAll(tempList);
        isDataProcessing(false);
      } else {

      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  deleteItem(id) async {
    try {
      isDataProcessing(true);
      var res = await FavoriteApi.deleteFavorite(id);
      if(res == "Lỗi") {

      } else {
        lists.clear();
        await getData();
        isDataProcessing(false);
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }


}