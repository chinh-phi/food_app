import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/order/controllers/order_evaluate_detail_controller.dart';
import 'package:get/get.dart';

class OrderEvaluateDetail extends GetView<OrderEvaluateDetailController> {
  static const RATE = 5;

  const OrderEvaluateDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrderEvaluateDetailController());
    return Obx(() => Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              expandedHeight: 40,
              backgroundColor: Colors.white,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'Đánh giá tài xế',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Trần Doãn Hưng', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(var i = 0 ; i < RATE ; i++)
                          InkWell(
                              child: Icon(
                                  (i <= controller.indexStar.value) ? Icons.star_outlined : Icons.star_border_outlined,
                                size: 50,
                                color: Colors.yellow
                              ),
                            onTap: () {
                                controller.onTapStar(i);

                            },
                          )
                      ],
                    ),
                    (controller.isChoosen.value) ? Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(controller.evaluations[controller.indexStar.value], style: TextStyle(fontSize: 18)),
                    ) : Container(),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Divider(
                        color: Colors.grey,
                        height: 10,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            controller.isChoosen.value ? SliverToBoxAdapter(
              child: Column(
                children: [
                  (controller.indexStar.value<4)
                      ? const Text('Đề xuất để tài xế cải thiện hơn?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                      : const Text('Gửi lời khen của bạn', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                  ,
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        for(var i = 0 ; i < controller.suggests.length; i++)
                          Container(
                              color: Color(0xFFe8e8e8),
                              padding: EdgeInsets.all(5),
                              child: Text(
                                controller.suggests[i],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              )
                          )
                      ],
                    ),
                  )
                ],
              ),
            ) : SliverToBoxAdapter(),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                color: Colors.white,
                child: TextField(
                  autofocus: true,
                  maxLines: 6,
                  maxLength: 500,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Chia sẻ đánh giá của bạn. Đánh giá và bình luận của bạn sẽ được giữ dưới chế độ ẩn danh.'
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {},
          color: Colors.deepOrange,
          textColor: Colors.white,
          child: Text('Gửi', style: TextStyle(fontSize: 18)),
        ),
      ),
    ));
  }
}
