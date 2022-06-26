import 'dart:convert';

ResVoucherModel resVoucherModelFromJson(String str) => ResVoucherModel.fromJson(json.decode(str));

String resVoucherModelToJson(ResVoucherModel data) => json.encode(data.toJson());

class ResVoucherModel {
  ResVoucherModel({
    this.count,
    this.rows,
  });

  int? count;
  List<Rows>? rows;

  factory ResVoucherModel.fromJson(Map<String, dynamic> json) => ResVoucherModel(
    count: json["count"],
    rows: List<Rows>.from(json["rows"].map((x) => Rows.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "rows": List<dynamic>.from(rows!.map((x) => x.toJson())),
  };
}

class Rows {
  Rows({
    this.id,
    this.idRes,
    this.name,
    this.paymentMethod,
    this.totalPay,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idRes;
  String? name;
  String? paymentMethod;
  dynamic totalPay;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Rows.fromJson(Map<String, dynamic> json) => Rows(
    id: json["id"],
    idRes: json["idRes"],
    name: json["name"],
    paymentMethod: json["paymentMethod"],
    totalPay: json["totalPay"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idRes": idRes,
    "name": name,
    "paymentMethod": paymentMethod,
    "totalPay": totalPay,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
