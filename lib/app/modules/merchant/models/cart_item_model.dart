import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  int? id;
  String? name;
  int? totalMoney;
  int? oldPrice;
  int? newPrice;
  int? number;

  CartItemModel({
    this.id,
    this.name,
    this.totalMoney,
    this.oldPrice,
    this.newPrice,
    this.number
  });

  static CartItemModel fromSnapshot(DocumentSnapshot snap) {
    CartItemModel cartItem = CartItemModel(
        id: snap["id"],
        name: snap["name"],
        totalMoney: snap["totalMoney"],
        oldPrice: snap["oldPrice"],
        newPrice: snap["newPrice"],
        number: snap["number"]
    );
    return cartItem;
  }

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalMoney = json['totalMoney'];
    oldPrice = json['oldPrice'];
    newPrice = json['newPrice'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['totalMoney'] = totalMoney;
    data['oldPrice'] = oldPrice;
    data['newPrice'] = newPrice;
    data['number'] = number;
    return data;
  }
}