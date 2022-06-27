class SearchResultModel {
  String? restaurantName;
  String? restaurantImage;
  int? restaurantId;
  String? restaurantAddress;
  int? totalReviews;
  String? avgRating;
  String? distance;
  List<String>? category;
  bool? isOpen;

  SearchResultModel(
      {this.restaurantName,
        this.restaurantImage,
        this.restaurantId,
        this.restaurantAddress,
        this.totalReviews,
        this.avgRating,
        this.distance,
        this.category,
        this.isOpen});

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    restaurantName = json['restaurantName'];
    restaurantImage = json['restaurantImage'];
    restaurantId = json['restaurantId'];
    restaurantAddress = json['restaurantAddress'];
    totalReviews = json['totalReviews'];
    avgRating = json['avgRating'];
    distance = json['Distance'];
    category = json['category'].cast<String>();
    isOpen = json['isOpen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurantName'] = restaurantName;
    data['restaurantImage'] = restaurantImage;
    data['restaurantId'] = restaurantId;
    data['restaurantAddress'] = restaurantAddress;
    data['totalReviews'] = totalReviews;
    data['avgRating'] = avgRating;
    data['Distance'] = distance;
    data['category'] = category;
    data['isOpen'] = isOpen;
    return data;
  }
}
