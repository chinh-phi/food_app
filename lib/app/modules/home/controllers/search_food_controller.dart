import 'package:get/get.dart';

class HistoryInfo {
  String name;
  HistoryInfo(this.name);
}

class SearchFoodController extends GetxController {
  var originalItems = <HistoryInfo>[];
  var items = <HistoryInfo>[].obs;
  final historyInfos = [
    HistoryInfo("Mỳ xào"),
    HistoryInfo("Mỳ bò"),
    HistoryInfo("Bún đậu"),
    HistoryInfo("Sữa chua trân châu"),
    HistoryInfo("Mì trộn"),
    HistoryInfo("Trà sữa"),
    HistoryInfo("Cơm"),
    HistoryInfo("Bún trộn"),
    HistoryInfo("Cơm thố"),
    HistoryInfo("Sữa chua"),
    HistoryInfo("Caf phe"),
    HistoryInfo("tao"),
    HistoryInfo("banh trang"),
  ];

  var _displayAll = false.obs;
  bool get displayAll => _displayAll.value;
  set displayAll(bool value) { this._displayAll.value = value ;}
  @override
  void onInit() {
    if(historyInfos.length <= 3) {
      items.addAll(historyInfos);
    } else {
      items.addAll(historyInfos.getRange(0,3));
    }
    originalItems = items.value;
    super.onInit();
  }

  void Show() {
    _displayAll.value = true;
    items.value = historyInfos;
    update();
  }

  void Hide() {
    _displayAll.value = false;
    items.value = originalItems;
    update();
  }
}