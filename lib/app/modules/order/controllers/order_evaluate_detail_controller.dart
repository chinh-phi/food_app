import 'package:get/get.dart';

class OrderEvaluateDetailController extends GetxController {
  final List<String> evaluations = [
    'Rất tệ',
    'Tệ',
    'Tạm được',
    'Tốt',
    'Tuyệt vời'
  ];
  final List<String> badSuggests = [
    'Không giao hàng',
    'Giao trễ',
    'Không hỗ trợ',
    'Không mặc đồng phục',
    'Đổ vỡ món',
    'Thái độ không tốt',
    'Không thực hiện phòng chống covid',
    'Sai/Thiếu món',
    'Yêu cầu thêm tiền'
  ];

  final List<String> goodSuggests = [
    'Thân thiện',
    'Bảo quản đơn cẩn thận',
    'Giao nhanh',
    'Hỗ trợ nhiệt tình',
    'Đồng phục gọn gàng'
  ];

  var suggests = [].obs;
  var isEvaluated = false.obs;
  var isChoosen = false.obs;
  var indexStar = (-1).obs;
  @override
  void onInit() {
    isEvaluated.value = false;
    isChoosen.value = false;
  }

  void onTapStar(int index) {
    isChoosen.value = true;
    indexStar.value = index;
    if(index < 4) {
      suggests.value = badSuggests;
    } else {
      suggests.value = goodSuggests;
    }
  }
}