import 'package:intl/intl.dart';

String format(value) {
  String formatString =  NumberFormat.currency(locale: 'vi', decimalDigits: 0).format(value);

  String result = '${formatString.substring(0, formatString.length - 4)}đ';
  return result;
}

String statusOrder(status) {
  String result = '';
  switch(status) {
    case 'Confirmed':
      result = 'Đã đặt';
      break;
    case 'Delivering' :
      result = 'Đang giao hàng...';
      break;
    case 'Preparing':
      result = 'Đang chuẩn bị...';
      break;
    case 'Completed':
      result = 'Đã nhận hàng';
      break;
    case 'Reviewed':
      result = 'Chưa đánh giá';
      break;
  }

  return result;
}