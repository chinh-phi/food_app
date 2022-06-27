import 'dart:convert';
import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/app/modules/address/providers/address_choose_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SettingApi {

  static getUserInfo() async {
    return await AddressChooseProvider.getUserInfo();
  }

  static updateInfo(String column, String value) async {

    var token = await ServiceApi.getAccessToken();

    var response = await ServiceApi.client.put(Uri.parse('${ServiceApi.baseURL}/user/update-info'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(<String, String>{"column": column, "updateValue": value}));
    if(response.statusCode == 200) {
      return response.body;
    } else {
      return "Lỗi";
    }
  }

}