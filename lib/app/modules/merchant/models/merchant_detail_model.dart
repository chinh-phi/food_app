class MerchantDetailModel {
  int? id;
  String? name;
  String? address;
  String? avgRating;
  String? totalReviews;
  String? coverImageLink;
  List<Food>? food;
  String? distance;
  int? shippingTime;
  String? totalOrders;
  bool? isLike;

  MerchantDetailModel(
      {this.id,
        this.name,
        this.address,
        this.avgRating,
        this.totalReviews,
        this.coverImageLink,
        this.food,
        this.distance,
        this.shippingTime,
        this.totalOrders,
        this.isLike});

  MerchantDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    avgRating = json['avgRating'];
    totalReviews = json['totalReviews'];
    coverImageLink = json['coverImageLink'];
    if (json['Food'] != null) {
      food = <Food>[];
      json['Food'].forEach((v) {
        food!.add(Food.fromJson(v));
      });
    }
    distance = json['Distance'];
    shippingTime = json['shippingTime'];
    totalOrders = json['totalOrders'];
    isLike = json['isLike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['avgRating'] = avgRating;
    data['totalReviews'] = totalReviews;
    data['coverImageLink'] = coverImageLink;
    if (food != null) {
      data['Food'] = food!.map((v) => v.toJson()).toList();
    }
    data['Distance'] = distance;
    data['shippingTime'] = shippingTime;
    data['totalOrders'] = totalOrders;
    data['isLike'] = isLike;
    return data;
  }
}

class Food {
  int? id;
  String? name;
  int? price;
  String? imageLink;
  String? category;
  List<Toppings>? toppings;

  Food(
      {this.id,
        this.name,
        this.price,
        this.imageLink,
        this.category,
        this.toppings});

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageLink = json['imageLink'];
    category = json['category'];
    if (json['toppings'] != null) {
      toppings = <Toppings>[];
      json['toppings'].forEach((v) {
        toppings!.add(Toppings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['imageLink'] = imageLink;
    data['category'] = category;
    if (toppings != null) {
      data['toppings'] = toppings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Toppings {
  String? name;
  int? limit;
  int? price;

  Toppings({this.name, this.limit, this.price});

  Toppings.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    limit = json['limit'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['limit'] = limit;
    data['price'] = price;
    return data;
  }
}
