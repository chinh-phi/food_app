class SignInResponse {
  String? accesstoken;
  String? refreshtoken;

  SignInResponse({this.accesstoken, this.refreshtoken});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    accesstoken = json['accesstoken'];
    refreshtoken = json['refreshtoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['accesstoken'] = accesstoken;
    data['refreshtoken'] = refreshtoken;
    return data;
  }
}
