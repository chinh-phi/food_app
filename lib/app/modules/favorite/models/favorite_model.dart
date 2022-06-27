class FavoriteModel {
  String? distance;
  int? shippingTime;
  String? restaurantName;
  String? restaurantImage;
  int? restaurantId;
  List<Vouchers>? vouchers;
  String? avgRating;

  FavoriteModel(
      {this.distance,
        this.shippingTime,
        this.restaurantName,
        this.restaurantImage,
        this.restaurantId,
        this.vouchers,
        this.avgRating});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    distance = json['Distance'];
    shippingTime = json['shippingTime'];
    restaurantName = json['restaurantName'];
    restaurantImage = json['restaurantImage'];
    restaurantId = json['restaurantId'];
    if (json['Vouchers'] != null) {
      vouchers = <Vouchers>[];
      json['Vouchers'].forEach((v) {
        vouchers!.add(Vouchers.fromJson(v));
      });
    }
    avgRating = json['avgRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Distance'] = distance;
    data['shippingTime'] = shippingTime;
    data['restaurantName'] = restaurantName;
    data['restaurantImage'] = restaurantImage;
    data['restaurantId'] = restaurantId;
    if (vouchers != null) {
      data['Vouchers'] = vouchers!.map((v) => v.toJson()).toList();
    }
    data['avgRating'] = avgRating;
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
