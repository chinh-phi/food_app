import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/merchant/api/fire_store_db.dart';
import 'package:food_app_247/app/modules/merchant/api/merchant_detail_api.dart';
import 'package:food_app_247/app/modules/merchant/models/cart_item_model.dart';
import 'package:food_app_247/app/modules/merchant/models/food_detail_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodDetailController extends GetxController {
  late BuildContext context;

  FoodDetailController({required this.context});

  var foodDetail = FoodDetailModel().obs;
  var isDataProcessing = false.obs;
  var foodId = 0.obs;
  var numOfFood = 1.obs;
  var money = 0.obs;
  var totalMoney = 0.obs;
  var isBlock = true.obs;
  var cartList = <CartItemModel>[].obs;
  var state = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getFoodDetail(foodId);
    money.value = foodDetail.value.newPrice ?? 0;
    totalMoney.value = foodDetail.value.newPrice ?? 0;
  }

  getFoodDetail(foodId) async {
    try {
      isDataProcessing(true);
      var res = await MerchantDetailApi.getFoodDetail(foodId);
      if (res != "fail") {
        foodDetail.value = FoodDetailModel.fromJson(res);
        isDataProcessing(false);
      }
      // print((merchantDetailInfo.value))
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  void clickAdd() {
    numOfFood++;
    isBlock.value = false;
    totalMoney.value = money.value * numOfFood.value;
  }

  void clickRemove() {
    if (numOfFood.value > 2) {
      isBlock.value = false;
      if (!isBlock.value) {
        numOfFood--;
        totalMoney.value = money.value * numOfFood.value;
      }
    } else if (numOfFood.value == 2) {
      numOfFood.value = 1;
      totalMoney.value = money.value * numOfFood.value;
      isBlock.value = true;
    } else {
      isBlock.value = true;
    }
  }

  clickAddToCart(item) async {
    cartList.clear();
    final prefs = await SharedPreferences.getInstance();
    // print(prefs.getString('merchantId'));
    // print(prefs.getString('currentMerchantId'));
    // print(prefs.getString('merchantName'));
    // print(prefs.getString('currentMerchantName'));
    // await prefs.remove('merchantId');
    // await prefs.remove('currentMerchantId');
    // await prefs.remove('merchantName');
    // await prefs.remove('currentMerchantName');

    var merchantId = prefs.getString('merchantId');
    var currentMerchantId = prefs.getString('currentMerchantId');
    var merchantName = prefs.getString('merchantName');
    if (currentMerchantId == null) {
      await prefs.setString('currentMerchantId', merchantId!);
      await prefs.setString('currentMerchantName', merchantName!);
      await FireStoreDB().addNewItem(item);
    } else {
      if (merchantId != currentMerchantId) {
        var currentMerchantName = prefs.getString('currentMerchantName');
        print('Xác nhận tạo giỏ hàng mới');
        await createAlertDialog(context, currentMerchantName!, item);
      } else {
        await FireStoreDB().addNewItem(item);
      }
    }
  }

  createAlertDialog(BuildContext context, String currentMerchantName, item) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('merchantName');
    var merchantId = prefs.getString('merchantId');
    var merchantName = prefs.getString('merchantName');
    return await showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Tạo giỏ hàng mới?"),
            actions: [
              CupertinoDialogAction(onPressed: () {
                Navigator.of(context).pop();
              },
                  child: Text("Hủy")
              ),
              CupertinoDialogAction(onPressed: () async {
                await FireStoreDB().deleteAllItem();
                await FireStoreDB().addNewItem(item);
                await prefs.setString('currentMerchantId', merchantId!);
                await prefs.setString('currentMerchantName', merchantName!);
                Navigator.of(context).pop();
              }, child: Text("Ok")),
            ],
            content: Text(
                "Bạn có muốn xóa giỏ hàng tại $currentMerchantName và thêm món mới này?"),
          );
        });
  }


}
