import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/search/api/search_api.dart';
import 'package:food_app_247/app/modules/search/controllers/search_controller.dart';
import 'package:food_app_247/app/modules/search/models/search_result_.dart';
import 'package:food_app_247/app/modules/search/views/search_result_box.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

class FoodSearch extends SearchDelegate<SearchResultModel> {

  final _controller = Get.put(SearchController());

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back, color: Dimensions.primaryColor),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == ""
          ? null
          : SearchApi.searchFood(query, 1, 100),
      builder: (context, AsyncSnapshot<List<SearchResultModel>> snapshot) {
        if(query == '') {
          return Obx(() => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: const Color(0xFFeaeaea),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Lịch sử tìm kiếm', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 16)),
                      InkWell(
                        child: const Text('Xóa hết', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 16)),
                        onTap: () {
                          _controller.clearAllHistory();
                        },
                      )
                    ],
                  ),
                ),
              ),
              history(),
              SliverToBoxAdapter(
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text('Phổ biến', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 16))
                ),
              ),
              popular(),
            ],
          ));
        } else {
          if(snapshot.hasData) {
            print(snapshot.data!.length);
            return ListView.builder(
              itemBuilder: (context, index) => SearchResultBox(item: snapshot.data![index]),
              itemCount: snapshot.data!.length,
            );
          } else {
            print('No data');
            return const Text('Loading...');
          }
        }

      }
    );
  }

  Widget history() {
    final size = _controller.listHistory.length;
    return size>0 ? SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if(index == _controller.items.length) {
              return Container(
                color: Colors.white,
                child: _controller.listHistory.length > 3
                    ? TextButton(
                    onPressed: () {
                      _controller.displayAll.value ? _controller.hide() : _controller.show();
                    },
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                  ),
                    child: _controller.displayAll.value ? const Text("Ẩn bớt", style: TextStyle(fontSize: 16),) : const Text('Hiển thị thêm', style: TextStyle(fontSize: 16)),
                )
                    : Container(),
              );
            } else {
              return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(color: Color(0xFFe8e8e8))
                      )
                  ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${_controller.listHistory[index].searchText}', style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black87, fontSize: 16)),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.close, color: Colors.black54, size: 20,),
                      onPressed: () {
                        _controller.clearHistoryItem(_controller.listHistory[index].id, index);
                      },
                    )
                  ],
                )
              );
            }
          },
          childCount: (_controller.displayAll.value) ? _controller.listHistory.length + 1 : _controller.items.length + 1,
        ),
    ) : SliverToBoxAdapter();
  }

  Widget popular() {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 2.5,
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Card(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: _controller.listPopular[index].imageLink != null
                                  ? NetworkImage(_controller.listPopular[index].imageLink!)
                                  : const AssetImage('assets/images/img_default.png') as ImageProvider,
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(_controller.listPopular[index].name!, style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: _controller.listPopular.length,
        )
      );
  }
}