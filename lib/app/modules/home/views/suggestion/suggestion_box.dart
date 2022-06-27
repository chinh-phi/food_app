import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/home/models/res_branch_model.dart';
import 'package:food_app_247/app/modules/home/models/suggestion_model.dart';
import 'package:food_app_247/app/modules/home/providers/suggestion_res_provider.dart';
import 'package:food_app_247/app/modules/home/views/suggestion/merchant_branch_list.dart';
import 'package:food_app_247/app/modules/home/views/suggestion/res_branch_card.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SuggestionBox extends StatelessWidget {
  const SuggestionBox({Key? key, required this.item}) : super(key: key);
  final SuggestionModel item;

  @override
  Widget build(BuildContext context) {
    var voucherLength = item.vouchers!.length;
    var numberOfBranch = item.restaurantBranch!.length;
    if (voucherLength > 3) {
      voucherLength = 3;
    }
    return InkWell(
      onTap: () {
        clickItem(item.restaurantId);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 130,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Color(0xFFe8e8e8)))),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: item.restaurantImage != null ? NetworkImage(item.restaurantImage!) : const AssetImage('assets/images/img_default.png') as ImageProvider,
                  fit: BoxFit.cover,
                )
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        const Icon(Icons.verified_rounded,
                            color: Dimensions.primaryColor),
                        Flexible(
                          child: Text(
                            item.restaurantName ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ]),
                      IntrinsicHeight(
                          child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  item.avgRating != null
                                      ? Text('${item.avgRating}',
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14))
                                      : const Text(''),
                                ],
                              )),
                          const VerticalDivider(
                            color: Colors.black26,
                            width: 1,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.place,
                                    color: Colors.black54,
                                    size: 16,
                                  ),
                                  item.distance != null
                                      ? Text('${item.distance}km',
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14))
                                      : const Text(''),
                                ],
                              )),
                          const VerticalDivider(
                            color: Colors.black26,
                            width: 1,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  const Icon(Icons.watch_later,
                                      color: Colors.black54, size: 16),
                                  item.shippingTime != null
                                      ? Text('${item.shippingTime}min',
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14))
                                      : const Text(''),
                                ],
                              )),
                        ],
                      )),
                      Row(children: [
                        for (var i = 0; i < voucherLength; i++)
                          Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red)),
                              child: Text(item.vouchers![i].name!,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 12)))
                      ]),
                      numberOfBranch > 0 ? InkWell(
                        onTap: () async {
                          var names = item.restaurantName?.split('-').toList();
                          names!.removeAt(names.length - 1);
                          await clickBranch(item.restaurantBranch, context, names.join(" - ").toString());
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Text('Xem $numberOfBranch địa điểm khác',
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 12)),
                                const Icon(Icons.chevron_right, size: 16),
                              ],
                            )),
                      ) : Container()
                    ])),
          )
        ]),
      ),
    );
  }

  clickBranch(ids, context, title) {
    Get.to(() => const MerchantBranchList(), arguments: [
      {"listId": ids},
      {"title": title}
    ]);
  }

  clickItem(id) {
    Get.toNamed('/merchant-detail/:$id');
  }


}
