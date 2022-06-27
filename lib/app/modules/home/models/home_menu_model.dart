class HomeMenuModel {
  int? id;
  String? name;
  String? imageLink;

  HomeMenuModel({this.id, this.name, this.imageLink});

  HomeMenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['imageLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageLink'] = imageLink;
    return data;
  }
}
