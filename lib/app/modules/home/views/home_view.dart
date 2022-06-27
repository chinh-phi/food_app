
import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/address/views/address_choose_view.dart';
import 'package:food_app_247/app/modules/home/controllers/home_controller.dart';
import 'package:food_app_247/app/modules/home/models/suggestion_model.dart';
import 'package:food_app_247/app/modules/home/views/menu/menu_grid.dart';
import 'package:food_app_247/app/modules/home/views/search/search_bar.dart';
import 'package:food_app_247/app/modules/home/views/suggestion/suggestion_box.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      // backgroundColor: Color(0xFFe8e8e8),
      body: Obx(() => controller.isDataProcessing.value
          ? const Center(child: CircularProgressIndicator(backgroundColor: Dimensions.primaryColor))
          : Stack(
        children: [
          _buildContent(),
          _buildTopBar()
        ],
      ),)
    );
  }

  _buildContent() {
    return CustomScrollView(
      slivers: [
        _buildSliderShow(),
        _buildMenu(),
        // _buildSales(),
        const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            sliver: SliverToBoxAdapter(
                child: Text('Quanh đây có gì ngon?', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold))
            )
        ),
        _buildSuggestion()
      ],
    );
  }

  _buildSliderShow() {
    return SliverToBoxAdapter(
        child: Container(
            margin: const EdgeInsets.only(top: 150),
            // child: SliderShowView()
        )
    );
  }

  _buildMenu() {
    return SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 10), sliver: MenuGrid(lists: controller.listMenu));
  }

  _buildSuggestion() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          var data = SuggestionModel.fromJson(controller.listSuggestion[index]);
          return SuggestionBox(
            item: data,
          );
        },
        childCount: controller.listSuggestion.length, // 1000 list items
      ),
    );
  }

  _buildTopBar() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.home,
                        color: Color(0xFF2e3a59),
                        size: 36.0,
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              const Text("Địa chỉ"),
                              InkWell(
                                child: Obx(() => Text(
                                    controller.address.value,
                                    overflow: TextOverflow.ellipsis)),
                                onTap: () {
                                  Get.to(() => const AddressChooseView());
                                },
                              )

                            ]),
                      ),
                      const SizedBox(
                        width: 52,
                        height: 52,
                        child: Icon(Icons.favorite,
                            color: Color(0xFF97d5c8), size: 36.0),
                      )
                    ]),
                const SearchBar()
              ],
            ))
    );
  }
}