
import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/app/modules/search/models/search_result_.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchApi {


  static Future<List<dynamic>> getHistorySearch() async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/user/search/history?limit=10'),headers: <String, String>{
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

  static Future<dynamic> deleteHistoryById(id) async {

    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.delete(Uri.parse('${ServiceApi.baseURL}/user/search/history/$id'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if(response.statusCode == 200) {
      return 'Success';
    } else {
      return '';
    }
  }

  static Future<dynamic> deleteAllHistory() async {
    var token = await ServiceApi.getAccessToken();

    var response = await ServiceApi.client.delete(Uri.parse('${ServiceApi.baseURL}/user/search/history'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });

    if(response.statusCode == 200) {
      return 'Success';
    } else {
      return '';
    }
  }

  static Future<List<dynamic>> getPopularFood() async {
    var token = await ServiceApi.getAccessToken();

    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/restaurant/category/popular?limit=8'),
        headers: <String, String>{
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

  static Future<List<SearchResultModel>> searchFood(searchValue, pageNumber, pageSize) async {
    var token = await ServiceApi.getAccessToken();

    var response = await ServiceApi.client.post(Uri.parse('${ServiceApi.baseURL}/homepage/search'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({"searchValue": searchValue, "pageNumber": pageNumber, "pageSize": pageSize, "isSearch": true}));

    if(response.statusCode == 200) {
      var json = response.body;
      List<SearchResultModel> tmp = List<SearchResultModel>.from(jsonDecode(json).map((model)=> SearchResultModel.fromJson(model)));
      return tmp;
    } else {
      return [];
    }
  }
}