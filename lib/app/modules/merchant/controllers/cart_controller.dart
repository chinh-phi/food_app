import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app_247/app/modules/merchant/api/fire_store_db.dart';
import 'package:food_app_247/app/modules/merchant/api/merchant_detail_api.dart';
import 'package:food_app_247/app/modules/payment/models/payment_order_detail_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item_model.dart';

class CartController extends GetxController {
  late BuildContext context;
  CartController({required this.context});
  var cartList = <CartItemModel>[].obs;
  var cartMoney = 0.obs;
  var cartNumber = 0.obs;
  var state = false.obs;
  var cartInfo = [].obs;
  var orderDetail = PaymentOrderDetailModel().obs;
  var isDataProcessing = false.obs;


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getCartInfo();

  }

  getCartInfo() async {
    cartList.clear();
    cartMoney.value = 0;
    cartNumber.value = 0;
    await FirebaseFirestore.instance.collection('flutter_food_cart').get().then((value) async {
      if(value.docs.isNotEmpty) {
        for(int i = 0 ; i < value.docs.length; i++) {
          cartList.add(CartItemModel.fromJson(value.docs[i].data()));
          cartMoney.value = cartMoney.value + cartList[i].totalMoney!;
          cartNumber.value = cartNumber.value + cartList[i].number!;
          cartInfo.add({
            "idFood": cartList[i].id,
            "quantity": cartList[i].number
          });
        }
      } else {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('currentMerchantId');
        await prefs.remove('currentMerchantName');
        Get.delete<CartController>();
        Navigator.pop(context);

      }
    });
  }

  clickAddItem(CartItemModel item) async {
    state(true);
    await FireStoreDB().updateItem(item, 'plus');
    await updateUI();
    state(false);
  }

  clickRemoveItem(CartItemModel item) async {
    state(true);
    await FireStoreDB().updateItem(item, 'minus');
    await updateUI();
    state(false);
  }

  updateUI() async {
    if(state.value = true) {
      await getCartInfo();
    }
  }

  clickDeleteAll() async {
    state(true);
    await FireStoreDB().deleteAllItem();
    await updateUI();
    state(false);
  }

  createOrder() async {

    try {
      isDataProcessing(false);
      final prefs = await SharedPreferences.getInstance();
      var id = prefs.getString('currentMerchantId')!;
      var res = await MerchantDetailApi.createOrder(int.parse(id), 0, cartInfo);
      if (res != "fail") {
        orderDetail.value = PaymentOrderDetailModel.fromJson(res);
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('currentOrderId', orderDetail.value.id!);
        await FireStoreDB().createOrder(orderDetail.value);
        isDataProcessing(false);
      }
      // print((merchantDetailInfo.value))
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }


}