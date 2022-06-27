import 'package:food_app_247/app/modules/menu_result/api/menu_result_api.dart';
import 'package:food_app_247/app/modules/menu_result/models/menu_result_model.dart';
import 'package:get/get.dart';

class MenuResultController extends GetxController {
  var id = Get.parameters["id"]!.substring(1);
  var isDataProcessing = false.obs;
  var listResult = <MenuResultModel>[].obs;
  var categoryName = Get.arguments[0]["name"];

  @override
  void onInit() async {
    super.onInit();
    print(id);
    await getData();
  }

  getData() async {
    try {
      isDataProcessing(true);
      var res = await MenuResultApi.getMenuResult(id);
      if(res.isNotEmpty) {
        List<MenuResultModel> data = res.map((value) => MenuResultModel.fromJson(value)).toList();
        print(res.runtimeType);
        listResult.addAll(data);
        isDataProcessing(false);
      }
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
      print(exception.toString());
    }
  }
}