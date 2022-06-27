// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) => OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) => json.encode(data.toJson());

class OrderDetailModel {
  OrderDetailModel({
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
    this.foods,
  });

  int? id;
  int? idRes;
  int? idUser;
  dynamic idReview;
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
  List<Food>? foods;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
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
    foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
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
    "foods": List<dynamic>.from(foods!.map((x) => x.toJson())),
  };
}

class Food {
  Food({
    this.id,
    this.idRes,
    this.name,
    this.price,
    this.prepareTime,
    this.imageLink,
    this.updatedAt,
  });

  int? id;
  int? idRes;
  String? name;
  dynamic price;
  dynamic prepareTime;
  String? imageLink;
  DateTime? updatedAt;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["id"],
    idRes: json["idRes"],
    name: json["name"],
    price: json["price"],
    prepareTime: json["prepareTime"],
    imageLink: json["imageLink"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idRes": idRes,
    "name": name,
    "price": price,
    "prepareTime": prepareTime,
    "imageLink": imageLink,
    "updatedAt": updatedAt!.toIso8601String(),
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

