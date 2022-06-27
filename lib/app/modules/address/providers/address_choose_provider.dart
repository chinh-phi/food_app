import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AddressChooseProvider {
  static var client = http.Client();
  static const _baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<UserModel?> getUserInfo() async {
    var token = await ServiceApi.getAccessToken();

    var response = await client.get(Uri.parse('$_baseURL/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
    );

    if(response.statusCode == 200) {
      UserModel data = UserModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      // var refreshRes = await ServiceApi.refreshToken();
      // if(refreshRes) {
      //   await getUserInfo();
      // }
      // return null;
    }
    return null;

  }
}
