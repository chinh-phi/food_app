import 'package:food_app_247/app/modules/merchant/api/fire_store_db.dart';
import 'package:food_app_247/app/modules/payment/api/payment_api.dart';
import 'package:food_app_247/app/modules/payment/models/payment_order_detail_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  var isDataProcessing = false.obs;
  var isApplyVoucher = false.obs;
  var listVoucher = <Voucher>[].obs;
  var data = PaymentOrderDetailModel().obs;
  var listVoucherStatus = [].obs;
  var currentVoucherId = 0.obs;


  @override
  void onInit() async {
    super.onInit();
    isDataProcessing(true);
    await getOrderDetail();
    await getVoucher();
    listVoucherStatus.value = listVoucher.map((element) => element.id).toList();
    // temp.value = listVoucherStatus;
    isDataProcessing(false);
  }

  getOrderDetail() async {
    final prefs = await SharedPreferences.getInstance();
    var orderId = prefs.getInt('currentOrderId');
    data.value = await FireStoreDB().getOrder(orderId);
  }

  getVoucher() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var idRes = prefs.getString("currentMerchantId");
      var response = await PaymentApi.getListVoucher(idRes);
      if(response != null) {
        var temp = response.map((value) => Voucher.fromJson(value)).toList();
        listVoucher.addAll(temp);
      } else {
        print('Lỗi');
      }
    } catch (exception) {
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  clickVoucher(voucherId) async {
    if(listVoucherStatus.contains(voucherId)) {
      await applyVoucher(voucherId);
    } else {
      await cancelVoucher(voucherId);
    }
  }

  applyVoucher(voucherId) async {
    // print(voucherId);
    // currentVoucherId.value = voucherId;
    try {
      isApplyVoucher(true);
      final prefs = await SharedPreferences.getInstance();
      var orderId = prefs.getInt('currentOrderId');
      print(orderId);
      var response = await PaymentApi.applyVoucher(orderId, voucherId);
      // print(response);
      var temp = PaymentOrderDetailModel.fromJson(response);
      if(listVoucher.length == listVoucherStatus.length) {
        currentVoucherId.value = voucherId;
        listVoucherStatus.remove(voucherId);
        print(temp.voucher!.value);
        data.value = temp;
        isApplyVoucher(false);
      } else {

      }

      // print(data.value.voucher!.id);
      // print(data.value.voucher!.value);
      // print(data.value.voucher);

      // if(response != null) {
      //   // print('123');
      //   // voucherStatus.value = true;
      //   if(listVoucher.length == listVoucherStatus.length) {
      //     // print('123');
      //     listVoucherStatus.remove(voucherId);
          // currentVoucherId.value = voucherId;
      //     data = PaymentOrderDetailModel().obs;
      //     data.value = PaymentOrderDetailModel.fromJson(response);
      //     print(data.value.voucher!.id);
      //     print(data.value.voucher!.value);
      //     isApplyVoucher(false);
      //   } else {
      //     listVoucherStatus.add(currentVoucherId.value);
      //     listVoucherStatus.remove(voucherId);
      //     // currentVoucherId.value = voucherId;
      //     data.value = PaymentOrderDetailModel.fromJson(response);
      //     print(data.value.voucher!.id!);
      //     print(data.value.voucher!.value);
      //     isApplyVoucher(false);
      //   }
      // } else {
      //   isApplyVoucher(false);
      //   print('Lỗi');
      // }
    } catch (exception) {
      isApplyVoucher(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }


  }

  cancelVoucher(voucherId) async {
    try {
      isApplyVoucher(true);
      final prefs = await SharedPreferences.getInstance();
      var orderId = prefs.getInt('currentOrderId');
      var response = await PaymentApi.cancelVoucher(orderId, voucherId);
      if(response != null) {
        // voucherStatus.value = true;
        listVoucherStatus.add(voucherId);
        data.value = PaymentOrderDetailModel.fromJson(response);
        print(data.value.voucher!.id!);
        isApplyVoucher(false);
      } else {
        isApplyVoucher(false);
        print('Lỗi');
      }
    } catch (exception) {
      isApplyVoucher(false);
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  removeOrder() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var orderId = prefs.getInt('currentOrderId');
      var response = await PaymentApi.deleteOrder(orderId);
      if(response == 'success') {
        await FireStoreDB().deleteAllOrder();
      } else {
        print('Lỗi');
      }
    } catch (exception) {
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  confirmOrder() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var orderId = prefs.getInt('currentOrderId');
      var response = await PaymentApi.confirmOrder(orderId);
      if(response == 'success') {
        await FireStoreDB().deleteAllOrder();
        await FireStoreDB().deleteAllItem();
        prefs.remove('merchantId');
        prefs.remove('currentMerchantId');
        prefs.remove('merchantName');
        prefs.remove('currentMerchantName');
        prefs.remove('currentOrderId');
      } else {
        print('Lỗi');
      }
    } catch (exception) {
      // showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
}