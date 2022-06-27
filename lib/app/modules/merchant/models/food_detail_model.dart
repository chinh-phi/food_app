class FoodDetailModel {
  int? id;
  int? idRes;
  String? name;
  int? prepareTime;
  String? imageLink;
  String? createdAt;
  String? updatedAt;
  int? oldPrice;
  int? newPrice;

  FoodDetailModel(
      {this.id,
        this.idRes,
        this.name,
        this.prepareTime,
        this.imageLink,
        this.createdAt,
        this.updatedAt,
        this.oldPrice,
        this.newPrice});

  FoodDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRes = json['idRes'];
    name = json['name'];
    prepareTime = json['prepareTime'];
    imageLink = json['imageLink'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    oldPrice = json['oldPrice'];
    newPrice = json['newPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idRes'] = idRes;
    data['name'] = name;
    data['prepareTime'] = prepareTime;
    data['imageLink'] = imageLink;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['oldPrice'] = oldPrice;
    data['newPrice'] = newPrice;
    return data;
  }
}
