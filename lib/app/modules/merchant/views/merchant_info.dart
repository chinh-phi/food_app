import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/merchant/models/merchant_time_info_model.dart';

class PartnerInfo extends StatelessWidget {
  const PartnerInfo({Key? key, required this.item}) : super(key: key);
  final MerchantTimeInfoModel item;

  @override
  Widget build(BuildContext context) {
    var listOfDate = [
      'Chủ nhật',
      'Thứ hai',
      'Thứ ba',
      'Thứ tư',
      'Thứ năm',
      'Thứ sáu',
      'Thứ bảy'
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Thông tin thêm', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.black
              ),
              onPressed: () {
                // Get.delete<MerchantTimeInfoController>;
                Navigator.pop(context);
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Địa chỉ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(item.address!, style: const TextStyle(fontSize: 16)),

                ],
              ),
            ),
          ),
          const SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverToBoxAdapter(
                child: Text(
                    'Thời gian mở cửa',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                ),
              )
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(listOfDate[index], style: const TextStyle(fontSize: 16)),
                      Text(
                          '${item.openTime} - ${item.closeTime}',
                          style: const TextStyle(fontSize: 16)
                      ),
                    ],
                  );
                },
                childCount: 7,
              ),
            ),
          )
        ],
      ),
    );
  }
}
