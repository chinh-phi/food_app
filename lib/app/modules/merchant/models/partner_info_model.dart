class PartnerInfoModel {
  String? address;
  List<openTime>? list;
  PartnerInfoModel({this.address, this.list});
}

// ignore: camel_case_types
class openTime {
  String? date;
  String? timeOpen;
  String? timeClose;
  openTime({this.date, this.timeOpen, this.timeClose});
}