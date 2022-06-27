import 'dart:convert';

import 'package:food_app_247/app/base/service/ServiceApi.dart';

class MerchantBranchListApi {

  static Future<List<dynamic>> getListBranch(List ids) async {
    var token = await ServiceApi.getAccessToken();
    var requestIds = ids.join(',');
    var response = await ServiceApi.client.get(Uri.parse('${ServiceApi.baseURL}/homepage/restaurants?filter=id&restaurantsId=$requestIds'),headers: <String, String>{
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
}