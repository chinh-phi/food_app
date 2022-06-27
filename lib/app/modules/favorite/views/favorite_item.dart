import 'package:flutter/material.dart';
import '../controllers/favorite_controller.dart';
import '../models/favorite_model.dart';


class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key, required this.item, required this.controller}) : super(key: key);
  final FavoriteModel item;
  final FavoriteController controller;
  @override
  Widget build(BuildContext context) {
    var voucherLength = item.vouchers!.length;
    if (voucherLength > 3) {
      voucherLength = 3;
    }
    return InkWell(
      onTap: () {
        // Get.to(() => PartnerView());
      },
      child: Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          width: double.infinity,
          height: 130,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 110,
                child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 8, top: 10, bottom: 10),
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: item.restaurantImage != null ? NetworkImage(item.restaurantImage!) : const AssetImage('assets/images/img_default.png') as ImageProvider,
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      children: [
                                        const Icon(
                                            Icons.verified_user,
                                            color: Colors.yellow
                                        ),
                                        Flexible(
                                          child: Text(
                                            item.restaurantName!,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.left,
                                          ),
                                        )
                                      ]
                                  ),
                                  IntrinsicHeight(
                                      child:Row(
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
                                                  Text(item.avgRating!, style: TextStyle(color: Colors.black54, fontSize: 14)),
                                                ],
                                              )
                                          ),
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
                                                  Text('${item.distance!}km', style: const TextStyle(color: Colors.black54, fontSize: 14)),
                                                ],
                                              )
                                          ),
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
                                                  const Icon(
                                                      Icons.watch_later,
                                                      color: Colors.black54,
                                                      size: 16
                                                  ),
                                                  Text('${item.shippingTime!}min', style: const TextStyle(color: Colors.black54, fontSize: 14)),
                                                ],
                                              )
                                          ),
                                        ],
                                      )
                                  ),
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

                                ]
                            )
                        ),
                      )
                    ]
                ),
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 20,
                          width: 20,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.favorite, size: 20, color: Colors.red),
                            onPressed: () async {
                              await controller.deleteItem(item.restaurantId);
                            },
                          )
                      ),
                    ]
                ),
              )
            ],
          )
      ),
    );
  }

}
