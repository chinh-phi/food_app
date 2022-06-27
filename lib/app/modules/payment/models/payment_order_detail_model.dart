class PaymentOrderDetailModel {
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
  int? idShipper;
  Address? address;
  String? orderedAt;
  String? deliveredAt;
  String? pickedAt;
  String? createdAt;
  String? updatedAt;
  List<Foods>? foods;
  Voucher? voucher;

  PaymentOrderDetailModel(
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
        this.idShipper,
        this.address,
        this.orderedAt,
        this.deliveredAt,
        this.pickedAt,
        this.createdAt,
        this.updatedAt,
        this.foods,
        this.voucher});

  PaymentOrderDetailModel.fromJson(Map<String, dynamic> json) {
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
    idShipper = json['idShipper'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    orderedAt = json['orderedAt'];
    deliveredAt = json['deliveredAt'];
    pickedAt = json['pickedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods!.add(new Foods.fromJson(v));
      });
    }
    voucher =
    json['voucher'] != null ? new Voucher.fromJson(json['voucher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idRes'] = this.idRes;
    data['idUser'] = this.idUser;
    data['idReview'] = this.idReview;
    data['status'] = this.status;
    data['description'] = this.description;
    data['shippingFee'] = this.shippingFee;
    data['tax'] = this.tax;
    data['subTotal'] = this.subTotal;
    data['total'] = this.total;
    data['discount'] = this.discount;
    data['grandTotal'] = this.grandTotal;
    data['idShipper'] = this.idShipper;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['orderedAt'] = this.orderedAt;
    data['deliveredAt'] = this.deliveredAt;
    data['pickedAt'] = this.pickedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toJson()).toList();
    }
    if (this.voucher != null) {
      data['voucher'] = this.voucher!.toJson();
    }
    return data;
  }
}

class Address {
  String? address;
  double? latitude;
  double? longitude;

  Address({this.address, this.latitude, this.longitude});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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
  Null? createdAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idRes'] = this.idRes;
    data['name'] = this.name;
    data['price'] = this.price;
    data['prepareTime'] = this.prepareTime;
    data['imageLink'] = this.imageLink;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Voucher {
  int? id;
  int? idRes;
  String? name;
  String? paymentMethod;
  int? totalPay;
  String? type;
  int? value;
  String? createdAt;
  String? updatedAt;
  OrderVoucher? orderVoucher;

  Voucher(
      {this.id,
        this.idRes,
        this.name,
        this.paymentMethod,
        this.totalPay,
        this.type,
        this.value,
        this.createdAt,
        this.updatedAt,
        this.orderVoucher});

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRes = json['idRes'];
    name = json['name'];
    paymentMethod = json['paymentMethod'];
    totalPay = json['totalPay'];
    type = json['type'];
    value = json['value'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderVoucher = json['OrderVoucher'] != null
        ? new OrderVoucher.fromJson(json['OrderVoucher'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idRes'] = this.idRes;
    data['name'] = this.name;
    data['paymentMethod'] = this.paymentMethod;
    data['totalPay'] = this.totalPay;
    data['type'] = this.type;
    data['value'] = this.value;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.orderVoucher != null) {
      data['OrderVoucher'] = this.orderVoucher!.toJson();
    }
    return data;
  }
}

class OrderVoucher {
  int? idOrder;
  int? idVoucher;
  String? createdAt;
  String? updatedAt;

  OrderVoucher({this.idOrder, this.idVoucher, this.createdAt, this.updatedAt});

  OrderVoucher.fromJson(Map<String, dynamic> json) {
    idOrder = json['idOrder'];
    idVoucher = json['idVoucher'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idOrder'] = this.idOrder;
    data['idVoucher'] = this.idVoucher;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
