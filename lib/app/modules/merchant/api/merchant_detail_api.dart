import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';

class MerchantDetailApi {
  static Future<dynamic> getMerchantDetail(id) async {

    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/restaurant/$id/details'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
    if(response.statusCode == 200) {
      var json = response.body;
      // var res = SuggestionModel.fromJson(jsonDecode(response.body));
      return jsonDecode(json);
    } else {
      return "lỗi";
    }
  }

  static Future<dynamic> getMerchantTimeInfo(id) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/restaurant/$id/merchant-info'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
    if(response.statusCode == 200) {
      var json = response.body;
      // var res = SuggestionModel.fromJson(jsonDecode(response.body));
      return jsonDecode(json);
    } else {
      return "fail";
    }
  }

  static Future<dynamic> getFoodDetail(id) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/food/$id'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
    if(response.statusCode == 200) {
      var json = response.body;
      // var res = SuggestionModel.fromJson(jsonDecode(response.body));
      return jsonDecode(json);
    } else {
      return "fail";
    }
  }

  static Future<String> addFavorite(resId) async{
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.post(Uri.parse('${ServiceApi.baseURL}/user/favourite'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    },body:
    jsonEncode({"idRes": resId}));
    if(response.statusCode == 200) {
      return 'success';
    } else {
      return "fail";
    }
  }

  static Future<String> deleteFavorite(resId) async{
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.delete(Uri.parse('${ServiceApi.baseURL}/user/favourite'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    },body:
    jsonEncode({"idRes": resId}));
    if(response.statusCode == 200) {
      return 'success';
    } else {
      return "fail";
    }
  }

  static Future<dynamic> createOrder(idRes, discount, food) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.post(Uri.parse('${ServiceApi.baseURL}/user/order'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    },body: jsonEncode({
      "idRes": idRes,
      "discount": discount,
      "foods": food
    }));
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "fail";
    }
  }
}