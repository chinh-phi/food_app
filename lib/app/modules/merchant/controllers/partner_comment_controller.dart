import 'package:get/get.dart';

import '../models/comment_item_model.dart';

class PartnerCommentController extends GetxController {
  List<CommentItemModel> lists = [];
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    lists = [
      CommentItemModel(urlImage: 'assets/images/avatar.png', name: 'Chính', rate: '4.8', comment: 'Ngon lắm luôn nhá, mọi người phải mua ở đây nhé, đừng mua chỗ khác', date: '19-03-2021', time: '20:30'),
      CommentItemModel(urlImage: 'assets/images/avatar.png', name: 'Quân', rate: '4.8', comment: 'Ngon lắmmmmmmmmmmmmmmm', date: '19-03-2021', time: '20:30'),
      CommentItemModel(urlImage: 'assets/images/avatar.png', name: 'Lan', rate: '3.8', comment: 'Ngon tuyệt', date: '19-03-2021', time: '20:30'),
      CommentItemModel(urlImage: 'assets/images/avatar.png', name: 'Chính', rate: '4.8', comment: 'Ngon lắm', date: '19-03-2021', time: '20:30'),
      CommentItemModel(urlImage: 'assets/images/avatar.png', name: 'Chính', rate: '4.8', comment: 'Ngon lắm', date: '19-03-2021', time: '20:30'),
      CommentItemModel(urlImage: 'assets/images/avatar.png', name: 'Chính', rate: '4.8', comment: 'Ngon lắm', date: '19-03-2021', time: '20:30'),
      CommentItemModel(urlImage: 'assets/images/avatar.png', name: 'Chính', rate: '4.8', comment: 'Ngon lắm', date: '19-03-2021', time: '20:30'),
    ];
  }
}