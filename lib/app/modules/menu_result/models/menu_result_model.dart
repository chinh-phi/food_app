class MenuResultModel {
  String? category;
  String? restaurantName;
  String? restaurantImage;
  int? restaurantId;
  String? restaurantAddress;
  String? avgRating;
  String? distance;
  int? shippingTime;
  List<Vouchers>? vouchers;

  MenuResultModel(
      {this.category,
        this.restaurantName,
        this.restaurantImage,
        this.restaurantId,
        this.restaurantAddress,
        this.avgRating,
        this.distance,
        this.shippingTime,
        this.vouchers});

  MenuResultModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
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
        vouchers!.add(Vouchers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['restaurantName'] = restaurantName;
    data['restaurantImage'] = restaurantImage;
    data['restaurantId'] = restaurantId;
    data['restaurantAddress'] = restaurantAddress;
    data['avgRating'] = avgRating;
    data['Distance'] = distance;
    data['shippingTime'] = shippingTime;
    if (vouchers != null) {
      data['Vouchers'] = vouchers!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idRes'] = idRes;
    data['name'] = name;
    return data;
  }
}
