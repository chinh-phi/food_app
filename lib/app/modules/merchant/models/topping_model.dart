class ToppingModel {
  String? name;
  int? maxTopping;
  List? toppingLists;
  ToppingModel({this.name, this.maxTopping, this.toppingLists});
}

class ToppingItemModel {
  String? name;
  String? price;
  ToppingItemModel({this.name, this.price});
}