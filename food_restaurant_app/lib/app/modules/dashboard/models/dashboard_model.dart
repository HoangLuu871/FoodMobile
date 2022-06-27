import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.count,
    this.rows,
  });

  int? count;
  List<Row>? rows;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    count: json["count"],
    rows: List<Row>.from(json["rows"].map((x) => Row.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "rows": List<dynamic>.from(rows!.map((x) => x.toJson())),
  };
}

class Row {
  Row({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? id;
  int? idRes;
  int? idUser;
  int? idReview;
  String? status;
  String? description;
  dynamic shippingFee;
  dynamic tax;
  dynamic subTotal;
  dynamic total;
  dynamic discount;
  dynamic grandTotal;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Row.fromJson(Map<String, dynamic> json) => Row(
    id: json["id"],
    idRes: json["idRes"],
    idUser: json["idUser"],
    idReview: json["idReview"],
    status: json["status"],
    description: json["description"],
    shippingFee: json["shippingFee"],
    tax: json["tax"],
    subTotal: json["subTotal"],
    total: json["total"],
    discount: json["discount"],
    grandTotal: json["grandTotal"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    user: User.fromJson(json["User"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idRes": idRes,
    "idUser": idUser,
    "idReview": idReview,
    "status": status,
    "description": description,
    "shippingFee": shippingFee,
    "tax": tax,
    "subTotal": subTotal,
    "total": total,
    "discount": discount,
    "grandTotal": grandTotal,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "User": user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phoneNumber": phoneNumber,
    "email": email,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

