import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/app/modules/login/models/SignInResponse.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/login_api.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  var error = "";

  Future<String> login({String? username, String? password}) async {
    error = "";
    try {
      loginProcess(true);
      String loginResp = await LoginApi.login(username: username, password: password);
      if (loginResp == 'success') {
        error = "";
        loginProcess(false);
      } else {
        error = loginResp;
        loginProcess(false);
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }

  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("refreshToken");
    bool logoutResp = await LoginApi.logout(token: token!);
    return logoutResp;
  }
}