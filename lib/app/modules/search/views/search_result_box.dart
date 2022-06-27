import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/search/models/search_result_.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

class SearchResultBox extends StatelessWidget {
  const SearchResultBox({Key? key, required this.item}) : super(key: key);
  final SearchResultModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/merchant-detail/:${item.restaurantId}');
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
                    image: item.restaurantImage != null
                        ? NetworkImage(item.restaurantImage!)
                        : const AssetImage('assets/images/img_default.png') as ImageProvider,
                    fit: BoxFit.fill
                )
            )
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
                              // Container(
                              //     margin: const EdgeInsets.only(left: 5),
                              //     child: Row(
                              //       children: [
                              //         const Icon(Icons.watch_later,
                              //             color: Colors.black54, size: 16),
                              //         item.shippingTime != null
                              //             ? Text('${item.shippingTime}min',
                              //             style: const TextStyle(
                              //                 color: Colors.black54,
                              //                 fontSize: 14))
                              //             : const Text(''),
                              //       ],
                              //     )),
                            ],
                          )),
                    ])),
          )
        ]),
      ),
    );
  }
}
