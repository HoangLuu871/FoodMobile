import 'dart:convert';

LoginResp loginRespFromJson(String str) => LoginResp.fromJson(json.decode(str));

String loginRespToJson(LoginResp data) => json.encode(data.toJson());

class LoginResp {
  LoginResp({
    required this.accesstoken,
    required this.refreshtoken,
  });

  String accesstoken;
  String refreshtoken;

  factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp(
    accesstoken: json["accesstoken"],
    refreshtoken: json["refreshtoken"],
  );

  Map<String, dynamic> toJson() => {
    "accesstoken": accesstoken,
    "refreshtoken": refreshtoken,
  };
}
