class OrderDetailModel {
  int? id;
  int? idRes;
  int? idUser;
  int? idReview;
  String? status;
  String? description;
  int? shippingFee;
  int? tax;
  int? subTotal;
  int? total;
  int? discount;
  int? grandTotal;
  String? createdAt;
  String? updatedAt;
  Review? review;
  Restaurant? restaurant;
  List<Foods>? foods;

  OrderDetailModel(
      {this.id,
        this.idRes,
        this.idUser,
        this.idReview,
        this.status,
        this.description,
        this.shippingFee,
        this.tax,
        this.subTotal,
        this.total,
        this.discount,
        this.grandTotal,
        this.createdAt,
        this.updatedAt,
        this.review,
        this.restaurant,
        this.foods});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRes = json['idRes'];
    idUser = json['idUser'];
    idReview = json['idReview'];
    status = json['status'];
    description = json['description'];
    shippingFee = json['shippingFee'];
    tax = json['tax'];
    subTotal = json['subTotal'];
    total = json['total'];
    discount = json['discount'];
    grandTotal = json['grandTotal'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    review =
    json['Review'] != null ? Review.fromJson(json['Review']) : null;
    restaurant = json['Restaurant'] != null
        ? Restaurant.fromJson(json['Restaurant'])
        : null;
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods!.add(Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idRes'] = idRes;
    data['idUser'] = idUser;
    data['idReview'] = idReview;
    data['status'] = status;
    data['description'] = description;
    data['shippingFee'] = shippingFee;
    data['tax'] = tax;
    data['subTotal'] = subTotal;
    data['total'] = total;
    data['discount'] = discount;
    data['grandTotal'] = grandTotal;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (review != null) {
      data['Review'] = review!.toJson();
    }
    if (restaurant != null) {
      data['Restaurant'] = restaurant!.toJson();
    }
    if (foods != null) {
      data['foods'] = foods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Review {
  int? id;
  int? idRes;
  int? idUser;
  String? description;
  int? rating;
  int? totalLikes;
  String? createdAt;
  String? updatedAt;

  Review(
      {this.id,
        this.idRes,
        this.idUser,
        this.description,
        this.rating,
        this.totalLikes,
        this.createdAt,
        this.updatedAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRes = json['idRes'];
    idUser = json['idUser'];
    description = json['description'];
    rating = json['rating'];
    totalLikes = json['totalLikes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idRes'] = idRes;
    data['idUser'] = idUser;
    data['description'] = description;
    data['rating'] = rating;
    data['totalLikes'] = totalLikes;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Restaurant {
  int? id;
  int? idUser;
  String? name;
  String? address;
  String? avgRating;
  int? totalReviews;
  int? totalFavourites;
  int? totalViews;
  String? priceRange;
  String? qualityScore;
  String? serviceScore;
  String? spaceScore;
  String? priceScore;
  String? locationScore;
  String? openTime;
  String? closeTime;
  double? latitude;
  double? longtitude;
  String? preparationTime;
  List<String>? category;
  List<String>? fit;
  String? capacity;
  List<String>? cuisines;
  List<String>? suitable;
  List<String>? fuitable;
  String? coverImageLink;
  String? groupName;
  String? createdAt;
  String? updatedAt;

  Restaurant(
      {this.id,
        this.idUser,
        this.name,
        this.address,
        this.avgRating,
        this.totalReviews,
        this.totalFavourites,
        this.totalViews,
        this.priceRange,
        this.qualityScore,
        this.serviceScore,
        this.spaceScore,
        this.priceScore,
        this.locationScore,
        this.openTime,
        this.closeTime,
        this.latitude,
        this.longtitude,
        this.preparationTime,
        this.category,
        this.fit,
        this.capacity,
        this.cuisines,
        this.suitable,
        this.fuitable,
        this.coverImageLink,
        this.groupName,
        this.createdAt,
        this.updatedAt});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['idUser'];
    name = json['name'];
    address = json['address'];
    avgRating = json['avgRating'];
    totalReviews = json['totalReviews'];
    totalFavourites = json['totalFavourites'];
    totalViews = json['totalViews'];
    priceRange = json['priceRange'];
    qualityScore = json['qualityScore'];
    serviceScore = json['serviceScore'];
    spaceScore = json['spaceScore'];
    priceScore = json['priceScore'];
    locationScore = json['locationScore'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    latitude = json['latitude'];
    longtitude = json['longtitude'];
    preparationTime = json['preparationTime'];
    category = json['category'].cast<String>();
    fit = json['fit'].cast<String>();
    capacity = json['capacity'];
    cuisines = json['cuisines'].cast<String>();
    suitable = json['suitable'].cast<String>();
    fuitable = json['fuitable'].cast<String>();
    coverImageLink = json['coverImageLink'];
    groupName = json['groupName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idUser'] = idUser;
    data['name'] = name;
    data['address'] = address;
    data['avgRating'] = avgRating;
    data['totalReviews'] = totalReviews;
    data['totalFavourites'] = totalFavourites;
    data['totalViews'] = totalViews;
    data['priceRange'] = priceRange;
    data['qualityScore'] = qualityScore;
    data['serviceScore'] = serviceScore;
    data['spaceScore'] = spaceScore;
    data['priceScore'] = priceScore;
    data['locationScore'] = locationScore;
    data['openTime'] = openTime;
    data['closeTime'] = closeTime;
    data['latitude'] = latitude;
    data['longtitude'] = longtitude;
    data['preparationTime'] = preparationTime;
    data['category'] = category;
    data['fit'] = fit;
    data['capacity'] = capacity;
    data['cuisines'] = cuisines;
    data['suitable'] = suitable;
    data['fuitable'] = fuitable;
    data['coverImageLink'] = coverImageLink;
    data['groupName'] = groupName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Foods {
  int? id;
  int? idRes;
  String? name;
  int? price;
  int? prepareTime;
  String? imageLink;
  String? createdAt;
  String? updatedAt;
  int? quantity;

  Foods(
      {this.id,
        this.idRes,
        this.name,
        this.price,
        this.prepareTime,
        this.imageLink,
        this.createdAt,
        this.updatedAt,
        this.quantity});

  Foods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRes = json['idRes'];
    name = json['name'];
    price = json['price'];
    prepareTime = json['prepareTime'];
    imageLink = json['imageLink'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idRes'] = idRes;
    data['name'] = name;
    data['price'] = price;
    data['prepareTime'] = prepareTime;
    data['imageLink'] = imageLink;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['quantity'] = quantity;
    return data;
  }
}
