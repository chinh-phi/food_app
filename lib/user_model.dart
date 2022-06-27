class UserModel {
  int? id;
  String? name;
  String? username;
  String? phoneNumber;
  String? email;
  String? gender;
  String? birthday;
  String? job;
  List<Address>? address;

  UserModel(
      {this.id,
        this.name,
        this.username,
        this.phoneNumber,
        this.email,
        this.gender,
        this.birthday,
        this.job,
        this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    gender = json['gender'];
    birthday = json['birthday'];
    job = json['job'];
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['job'] = job;
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? type;
  String? port;
  String? address;
  String? building;
  double? latitude;
  String? userNote;
  double? longitude;
  String? phoneNumber;

  Address(
      {this.type,
        this.port,
        this.address,
        this.building,
        this.latitude,
        this.userNote,
        this.longitude,
        this.phoneNumber});

  Address.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    port = json['port'];
    address = json['address'];
    building = json['building'];
    latitude = json['latitude'];
    userNote = json['userNote'];
    longitude = json['longitude'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['port'] = port;
    data['address'] = address;
    data['building'] = building;
    data['latitude'] = latitude;
    data['userNote'] = userNote;
    data['longitude'] = longitude;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
