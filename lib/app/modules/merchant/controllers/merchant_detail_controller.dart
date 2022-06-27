import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/merchant/api/fire_store_db.dart';
import 'package:food_app_247/app/modules/merchant/api/merchant_detail_api.dart';
import 'package:food_app_247/app/modules/merchant/models/cart_item_model.dart';
import 'package:food_app_247/app/modules/merchant/models/food_detail_model.dart';
import 'package:food_app_247/app/modules/merchant/models/merchant_detail_model.dart';
import 'package:food_app_247/app/modules/merchant/models/merchant_time_info_model.dart';
import 'package:food_app_247/app/modules/order/models/OrderDetailModel.dart';
import 'package:food_app_247/app/modules/payment/models/payment_order_detail_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MerchantDetailController extends GetxController {
  var id = Get.parameters["id"]!.substring(1);
  var isDataProcessing = false.obs;
  var merchantDetailInfo = MerchantDetailModel().obs;
  var isScrolling = false.obs;
  late ScrollController scrollController;
  var offsetScrollController = 0.0.obs;
  var isFavorite = false.obs;
  var cartList = <CartItemModel>[].obs;
  var cartLength = 0.obs;
  var cartTotal = 0.obs;
  var state = false.obs;
  var currentId = ''.obs;
  var cartInfo = [].obs;
  var orderDetail = PaymentOrderDetailModel().obs;


  var dateInfo = MerchantTimeInfoModel().obs;

  @override
  void onInit() async {
    super.onInit();
    scrollController = ScrollController();
    await getData();

  }

  getCart() async {
    cartInfo.clear();
    print(cartInfo.length);
    cartList.clear();
    cartLength.value = 0;
    cartTotal.value = 0;
    final prefs = await SharedPreferences.getInstance();
    currentId.value = prefs.getString('currentMerchantId') ?? '';
    if(currentId.value == id) {
      await FirebaseFirestore.instance.collection('flutter_food_cart').get().then((value) {
        if(value.docs.isNotEmpty) {
          for(int i = 0 ; i < value.docs.length; i++) {
            cartList.add(CartItemModel.fromJson(value.docs[i].data()));
            cartInfo.add({
              "idFood": cartList[i].id,
              "quantity": cartList[i].number
            });
            cartLength.value = cartLength.value + cartList[i].number!;
            cartTotal.value = cartTotal.value + cartList[i].totalMoney!;
          }
        }
      });
    }
    print(cartInfo.length);

  }

  getData() async {
    try {
      isDataProcessing(true);
      var res = await MerchantDetailApi.getMerchantDetail(id);
      merchantDetailInfo.value = MerchantDetailModel.fromJson(res);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('merchantId', id);
      prefs.setString('merchantName', merchantDetailInfo.value.name!);
      await getCart();
      var res1 = await MerchantDetailApi.getMerchantTimeInfo(id);
      if(res1!="fail") {
        dateInfo.value = MerchantTimeInfoModel.fromJson(res);
        isDataProcessing(false);
      }
      isFavorite.value = merchantDetailInfo.value.isLike!;
      isDataProcessing(false);
    } catch (exception) {
      isDataProcessing(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  onStartScroll(ScrollMetrics metrics) {
    return '';
  }

  onUpdateScroll(ScrollMetrics metrics) {
    isScrolling.value = true;
    offsetScrollController.value = scrollController.offset;
    return '';
  }

  onEndScroll(ScrollMetrics metrics) {
    isScrolling.value = false;
    return '';
  }

  clickFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("updateFavorite", true);
    if(isFavorite.value) {
      var res = await MerchantDetailApi.deleteFavorite(int.parse(id));
      print(res);
      isFavorite.value = false;
    } else {
      var res = await MerchantDetailApi.addFavorite(int.parse(id));
      print(res);
      isFavorite.value = true;
    }
  }

  updateCart() async {
    await getCart();
  }

  createOrder() async {
    // cartInfo.clear();
    print(cartInfo.length);
    // cartInfo.forEach((element) => print(element));
    try {
      isDataProcessing(true);
      print(cartInfo.length);
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