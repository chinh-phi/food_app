
import 'dart:convert';
import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/app/modules/login/models/SignInError.dart';
import 'package:food_app_247/app/modules/login/models/SignInResponse.dart';
import 'package:http/http.dart' as http;

class LoginApi {

  static Future<String> login({String? username, String? password}) async {
    var res = await ServiceApi.client.post(Uri.parse('${ServiceApi.baseURL}/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
        jsonEncode(<String, String>{"username": username ?? '', "password": password ?? ''}));

    if(res.statusCode == 200) {
      var data = SignInResponse.fromJson(jsonDecode(res.body));
      print(data.accesstoken);

      await ServiceApi.setToken(data.accesstoken!, data.refreshtoken!);
      return "success";
    } else {
      return SignInError.fromJson(jsonDecode(res.body)).error!.message!;
    }


  }


  static Future<bool> logout({String? token}) async {
    var res =
    await ServiceApi.client.post(Uri.parse('${ServiceApi.baseURL}/auth/logout'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body:
        jsonEncode({"refreshtoken": token}));

    if(res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
