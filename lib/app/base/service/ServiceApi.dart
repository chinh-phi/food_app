import 'dart:convert';

import 'package:food_app_247/app/modules/login/models/SignInResponse.dart';
import 'package:food_app_247/splash_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  static var client = http.Client();
  static const baseURL = "https://shopee-food-mobile.herokuapp.com";


  static setToken(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", accessToken);
    prefs.setString('refreshToken', refreshToken);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken");
    return token;
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("refreshToken");
    return token;
  }

  static Future<bool> refreshToken() async {
    var refreshToken = await getRefreshToken();
    var res =
    await client.post(Uri.parse('$baseURL/auth/refresh-token'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body:
        jsonEncode({"refreshtoken": refreshToken}));

    if(res.statusCode == 200) {
      var data = SignInResponse.fromJson(jsonDecode(res.body));
      await ServiceApi.setToken(data.accesstoken!, data.refreshtoken!);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> logout() async {
    var refreshToken = await getRefreshToken();
    print(refreshToken);
    var res =
    await client.post(Uri.parse('$baseURL/auth/logout'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body:
        jsonEncode({"refreshtoken": refreshToken}));

    if(res.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

}