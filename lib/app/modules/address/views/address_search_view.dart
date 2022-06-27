// import 'package:flutter/material.dart';
//
// import '../models/suggestion_models.dart';
// import '../providers/address_provider.dart';
//
// class AddressSearchView extends SearchDelegate<SuggestionModel> {
//   AddressSearchView() {
//     apiClient = AddressProvider();
//   }
//
//
//   AddressProvider? apiClient;
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         tooltip: 'Clear',
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       tooltip: 'Back',
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, SuggestionModel('', ''));
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return FutureBuilder(
//       future: query == ""
//           ? null
//           : apiClient!.fetchSuggestions(
//           query, 'vi'),
//       builder: (context,  AsyncSnapshot snapshot) => query == ''
//           ? Container(
//         padding: EdgeInsets.all(16.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 200.0,
//                   height: 200.0,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(
//                               "assets/images/placeholder.png"
//                           ),
//                           fit: BoxFit.fill
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text('Chà, không tìm thấy địa điểm này', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 10),
//                 Text('Bạn hãy thử một từ khóa khác để FastFood lục tìm tiếp nhé.', textAlign: TextAlign.center,)
//               ],
//             ),
//           ),
//         ),
//       )
//           : snapshot.hasData
//           ? ListView.builder(
//         itemBuilder: (context, index) => ListTile(
//           title:
//           Text((snapshot.data[index] as SuggestionModel).description),
//           onTap: () {
//             close(context, snapshot.data[index] as SuggestionModel);
//           },
//         ),
//         itemCount: snapshot.data.length,
//       )
//           : const Text('Loading...'),
//     );
//   }
// }
