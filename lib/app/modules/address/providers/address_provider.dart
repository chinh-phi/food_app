// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http/http.dart';
//
// import '../models/address_model.dart';
// import '../models/suggestion_models.dart';
//
// class AddressProvider {
//   final client = Client();
//
//   AddressProvider();
//
//
//   static const String androidKey = 'AIzaSyA_S467PnVL5OO5ysSLgArUfABFIwymzrQ';
//   static const String iosKey = 'AIzaSyA_S467PnVL5OO5ysSLgArUfABFIwymzrQ';
//   final apiKey = Platform.isAndroid ? androidKey : iosKey;
//
//   Future<List<SuggestionModel>> fetchSuggestions(String input, String lang) async {
//     final request =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:vn&key=$apiKey';
//     var uri = Uri.parse(request);
//     final response = await client.get(uri);
//
//     if (response.statusCode == 200) {
//       final result = json.decode(response.body);
//       if (result['status'] == 'OK') {
//         print(result);
//         // compose suggestions in a list
//         return result['predictions']
//             .map<SuggestionModel>((p) => SuggestionModel(p['place_id'], p['description']))
//             .toList();
//       }
//       if (result['status'] == 'ZERO_RESULTS') {
//         return [];
//       }
//       throw Exception(result['error_message']);
//     } else {
//       throw Exception('Failed to fetch suggestion');
//     }
//   }
//
//   Future<AddressModel> getPlaceDetailFromId(String placeId) async {
//     final request =
//         'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_component&key=$apiKey';
//     var uri = Uri.parse(request);
//     final response = await client.get(uri);
//
//     if (response.statusCode == 200) {
//       final result = json.decode(response.body);
//       print(result);
//       if (result['status'] == 'OK') {
//         final components =
//         result['result']['address_components'] as List<dynamic>;
//         // build result
//         final place = AddressModel();
//         for (var c in components) {
//           final List type = c['types'];
//           if (type.contains('street_number')) {
//             place.streetNumber = c['long_name'];
//           }
//           if (type.contains('route')) {
//             place.street = c['long_name'];
//           }
//           if (type.contains('locality')) {
//             place.city = c['long_name'];
//           }
//           if (type.contains('postal_code')) {
//             place.zipCode = c['long_name'];
//           }
//         }
//         return place;
//       }
//       throw Exception(result['error_message']);
//     } else {
//       throw Exception('Failed to fetch suggestion');
//     }
//   }
// }