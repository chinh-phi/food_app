import 'package:food_app_247/app/modules/home/models/home_menu_model.dart';
import 'package:food_app_247/app/modules/search/api/search_api.dart';
import 'package:food_app_247/app/modules/search/models/history_search_model.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var displayAll = false.obs;
  var items = [].obs;
  var isDataProcessing = false.obs;
  var listHistory = List<HistorySearchModel>.empty(growable: true).obs;
  var listPopular = List<HomeMenuModel>.empty(growable: true).obs;


  @override
  void onInit() async {
    super.onInit();
    // Fetch Data
    getHistory();
    getPopularFood();
  }

  void show() {
    displayAll.value = true;
    items.value = listHistory;
  }

  void hide() {
    displayAll.value = false;
    items.value = listHistory.getRange(0, 3).toList();
  }

  void getHistory() async {
    try {
      isDataProcessing(true);
      var res = await SearchApi.getHistorySearch();
      if(res.isNotEmpty) {
        List<HistorySearchModel> tmp = List<HistorySearchModel>.from(res.map((model)=> HistorySearchModel.fromJson(model)));
        listHistory.addAll(tmp);
        if(listHistory.length <= 3) {
          items.addAll(listHistory);
        } else {
          items.addAll(listHistory.getRange(0,3));
        }
        isDataProcessing(false);
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      print('a');
    }
  }

  void clearHistoryItem(id, index) async {
    try {
      isDataProcessing(true);
      var res = await SearchApi.deleteHistoryById(id);
      if(res.isNotEmpty) {
        listHistory.removeAt(index);
        print(res);
        isDataProcessing(false);
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      print('a');
    }
  }

  void clearAllHistory() async {
    try {
      isDataProcessing(true);
      var res = await SearchApi.deleteAllHistory();
      if(res.isNotEmpty) {
        listHistory.clear();
        print(res);
        isDataProcessing(false);
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      print('a');
    }
  }

  void getPopularFood() async {
    try {
      isDataProcessing(true);
      var res = await SearchApi.getPopularFood();
      if(res.isNotEmpty) {
        List<HomeMenuModel> tmp = List<HomeMenuModel>.from(res.map((model)=> HomeMenuModel.fromJson(model)));
        listPopular.addAll(tmp);
        isDataProcessing(false);
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      print('a');
    }
  }



  // void searchFood(input) async {
  //   try {
  //     isDataProcessing(true);
  //     var res = await SearchApi.searchFood(input, 1, 100);
  //     if(res.isNotEmpty) {
  //       listHistory.addAll(res);
  //       print(listHistory.length);
  //       isDataProcessing(false);
  //     }
  //     isDataProcessing(false);
  //   } catch (exception) {
  //     isDataProcessing(false);
  //     print('loi');
  //   }
  // }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}