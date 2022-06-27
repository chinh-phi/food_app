import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/search/models/search_result_.dart';
import 'package:food_app_247/app/modules/search/views/food_search.dart';
import 'package:get/get.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFe8e8e8)
          )
        )
      ),
      child: TextField(
        // controller: _controller,
        readOnly: true,
        onTap: () async {
          // Get.to(() => FoodSearch());
          // Get.to(FoodSearch());
          // final sessionToken = Uuid().v4();
          final SearchResultModel? result = await showSearch(
            context: context,
            delegate: FoodSearch(),
          );
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF4F4F4F),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.white)),
          hintText: 'Tìm nhà hàng, món ăn',
          contentPadding: const EdgeInsets.all(0),
          fillColor: const Color(0xFFF3F3F3),
          filled: true,

        ),
      ),
    );
  }
}
