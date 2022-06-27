import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/app/modules/login/models/SignInError.dart';

class RegisterApi {

  static Future<String> register({String? username, String? password, String? name}) async {
    var res = await ServiceApi.client.post(
        Uri.parse('${ServiceApi.baseURL}/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
        jsonEncode(<String, String>{
          "username": username ?? '',
          "password": password ?? '',
          "name": name ?? '',
          "role": "user"
        }));

    if (res.statusCode == 200) {

      return "success";
    } else {
      return SignInError.fromJson(jsonDecode(res.body)).error!.message!;
    }
  }
}