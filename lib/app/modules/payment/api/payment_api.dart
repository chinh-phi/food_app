import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';

class PaymentApi {
  static Future<List<dynamic>> getListVoucher(idRes) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/user/vouchers/$idRes'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
    if(response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json);
    } else {
      return [];
    }
  }

  static Future<dynamic> applyVoucher(orderId, voucherId) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.post(Uri.parse('${ServiceApi.baseURL}/user/order/$orderId/apply-voucher/$voucherId'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if(response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json);
    } else {
      return [];
    }
  }

  static Future<dynamic> cancelVoucher(orderId, voucherId) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.delete(Uri.parse('${ServiceApi.baseURL}/user/order/$orderId/remove-voucher/$voucherId'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if(response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json);
    } else {
      return [];
    }
  }

  static Future<dynamic> deleteOrder(orderId) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.delete(Uri.parse('${ServiceApi.baseURL}/user/order/$orderId'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if(response.statusCode == 200) {
      return 'success';
    } else {
      return 'fail';
    }
  }

  static Future<dynamic> confirmOrder(orderId) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.put(Uri.parse('${ServiceApi.baseURL}/user/order/confirm/$orderId'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if(response.statusCode == 200) {
      return 'success';
    } else {
      return 'fail';
    }
  }



}