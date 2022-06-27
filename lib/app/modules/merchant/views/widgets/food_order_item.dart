import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/merchant/models/merchant_detail_model.dart';
import 'package:food_app_247/app/modules/merchant/views/food_detail.dart';
import 'package:food_app_247/re_use_function.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FoodOrderItem extends StatefulWidget {
  const FoodOrderItem({Key? key, required this.item, required this.callbackFunction}) : super(key: key);
  final Food item;
  final Function callbackFunction;

  @override
  State<FoodOrderItem> createState() => _FoodOrderItemState();
}

class _FoodOrderItemState extends State<FoodOrderItem> {
  bool state = false;
  callback(value) {
    setState(() {
      state = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    color: Color(0xFFe8e8e8)
                )
            )
        ),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 90,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.item.name!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                      Text(format(widget.item.price!), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.red)),
                    ]
                ),
              ),
            ),

            Container(
                padding: const EdgeInsets.only(left: 5),
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.item.imageLink != null ? NetworkImage(widget.item.imageLink!) : const AssetImage('assets/images/img_default.png') as ImageProvider,
                      fit: BoxFit.cover,
                    )
                )
            ),
          ],
        ),
      ),
      onTap: () async {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => FoodDetail(id: widget.item.id!, callbackFunction: callback),
        );
      },
    );
  }
}
