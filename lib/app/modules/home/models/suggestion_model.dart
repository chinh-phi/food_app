class SuggestionModel {
  String? restaurantName;
  String? restaurantImage;
  int? restaurantId;
  String? restaurantAddress;
  String? avgRating;
  String? distance;
  int? shippingTime;
  List<Vouchers>? vouchers;
  List<int>? restaurantBranch;

  SuggestionModel(
      {this.restaurantName,
        this.restaurantImage,
        this.restaurantId,
        this.restaurantAddress,
        this.avgRating,
        this.distance,
        this.shippingTime,
        this.vouchers,
        this.restaurantBranch});

  SuggestionModel.fromJson(Map<String, dynamic> json) {
    restaurantName = json['restaurantName'];
    restaurantImage = json['restaurantImage'];
    restaurantId = json['restaurantId'];
    restaurantAddress = json['restaurantAddress'];
    avgRating = json['avgRating'];
    distance = json['Distance'];
    shippingTime = json['shippingTime'];
    if (json['Vouchers'] != null) {
      vouchers = <Vouchers>[];
      json['Vouchers'].forEach((v) {
        vouchers!.add(new Vouchers.fromJson(v));
      });
    }
    restaurantBranch = json['restaurantBranch'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantName'] = this.restaurantName;
    data['restaurantImage'] = this.restaurantImage;
    data['restaurantId'] = this.restaurantId;
    data['restaurantAddress'] = this.restaurantAddress;
    data['avgRating'] = this.avgRating;
    data['Distance'] = this.distance;
    data['shippingTime'] = this.shippingTime;
    if (this.vouchers != null) {
      data['Vouchers'] = this.vouchers!.map((v) => v.toJson()).toList();
    }
    data['restaurantBranch'] = this.restaurantBranch;
    return data;
  }
}

class Vouchers {
  int? id;
  int? idRes;
  String? name;

  Vouchers({this.id, this.idRes, this.name});

  Vouchers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRes = json['idRes'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idRes'] = this.idRes;
    data['name'] = this.name;
    return data;
  }
}
