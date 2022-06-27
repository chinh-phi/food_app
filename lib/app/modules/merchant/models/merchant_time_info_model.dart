class MerchantTimeInfoModel {
  int? id;
  String? address;
  String? openTime;
  String? closeTime;

  MerchantTimeInfoModel({this.id, this.address, this.openTime, this.closeTime});

  MerchantTimeInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['address'] = address;
    data['openTime'] = openTime;
    data['closeTime'] = closeTime;
    return data;
  }
}
