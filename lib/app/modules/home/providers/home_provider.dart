import 'dart:convert';
import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider {

  static var client = http.Client();
  static const _baseURL = "https://shopee-food-mobile.herokuapp.com";

  static Future<bool> setAddress(Position position, String? address) async {
    var accessToken = await ServiceApi.getAccessToken();

    var response = await client.put(Uri.parse('$_baseURL/user/location'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
        body:
        jsonEncode({"address": address ?? '', "latitude": position.latitude, "longitude": position.longitude}));

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }
}