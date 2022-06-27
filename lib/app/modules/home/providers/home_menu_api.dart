import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/app/modules/home/models/home_menu_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeMenuApi {

  static List<HomeMenuModel> parses(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<HomeMenuModel>((json) => HomeMenuModel.fromJson(json)).toList();
  }


  static Future<List<HomeMenuModel>> getMenuGrid() async {
    var accessToken = await ServiceApi.getAccessToken();

    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/restaurant/category/popular?limit=12'),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken'
        });

    if(response.statusCode == 200) {
      var json = response.body;
      return parses(json);
    } else {
      print(response.statusCode);
      var refreshRes = await ServiceApi.refreshToken();
    }
    return [];
  }
}