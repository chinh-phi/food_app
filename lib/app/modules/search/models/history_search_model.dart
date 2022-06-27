class HistorySearchModel {
  int? id;
  int? idUser;
  String? searchText;

  HistorySearchModel({this.id, this.idUser, this.searchText});

  HistorySearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['idUser'];
    searchText = json['searchText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idUser'] = idUser;
    data['searchText'] = searchText;
    return data;
  }
}
