import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class FavoriteApi {

  static Future<List<dynamic>> getFavorite() async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/user/favourite'),headers: <String, String>{
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

  static Future<String> deleteFavorite(id) async {
    var token = await ServiceApi.getAccessToken();
    var response = await ServiceApi.client.delete(Uri.parse('${ServiceApi.baseURL}/user/favourite'),headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    },
      body: jsonEncode({"idRes": id}));
    if(response.statusCode == 200) {
      var json = response.body;
      return json;
    } else {
      return 'Lỗi';
    }
  }
}
