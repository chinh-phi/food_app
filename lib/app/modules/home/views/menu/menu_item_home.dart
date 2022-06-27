import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/menu_result/views/menu_result_view.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../models/home_menu_model.dart';
class MenuItemHome extends StatelessWidget {
  const MenuItemHome({Key? key, required this.item}) : super(key: key);
  final HomeMenuModel item;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color(0xFFd6d6d6),
      strokeWidth: 1,
      dashPattern: const [
        5,
        5,
      ],
      child: InkWell(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                // child: Image(
                //   image: item.imageLink != null ? NetworkImage(item.imageLink!) : AssetImage('assets/images/burger.png') as ImageProvider,
                //   fit: BoxFit.fill,
                // ),
                child: item.imageLink != null ? Image.network(item.imageLink!) : Image.asset('assets/images/burger.png')
              ),
              Text(
                item.name!,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                textAlign: TextAlign.center
              )
            ],
          ),
        ),
        onTap: () {
          // Get.to(() => MenuResultView());
          Get.toNamed('/menu-result/${item.id}', arguments: [{"name": item.name}]);
        },
      ),
    );
  }
}
