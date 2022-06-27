import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/home/models/home_menu_model.dart';
import 'package:food_app_247/app/modules/home/views/menu/menu_item_home.dart';


class MenuGrid extends StatelessWidget {
  const MenuGrid({Key? key, required this.lists}) : super(key: key);
  final List<HomeMenuModel> lists;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) => MenuItemHome(item: lists[index]),
        childCount: lists.length,
      ),
    );
  }
}
