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
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? idRes;
  String? name;
  dynamic price;
  dynamic prepareTime;
  String? imageLink;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["id"],
    idRes: json["idRes"],
    name: json["name"],
    price: json["price"],
    prepareTime: json["prepareTime"],
    imageLink: json["imageLink"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idRes": idRes,
    "name": name,
    "price": price,
    "prepareTime": prepareTime,
    "imageLink": imageLink,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.username,
    this.password,
    this.phoneNumber,
    this.email,
    this.gender,
    this.birthday,
    this.job,
    this.address,
    this.currentAddress,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? username;
  String? password;
  String? phoneNumber;
  String? email;
  dynamic gender;
  dynamic birthday;
  dynamic job;
  Address? address;
  CurrentAddress? currentAddress;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    gender: json["gender"],
    birthday: json["birthday"],
    job: json["job"],
    address: Address.fromJson(json["address"]),
    currentAddress: CurrentAddress.fromJson(json["currentAddress"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "password": password,
    "phoneNumber": phoneNumber,
    "email": email,
    "gender": gender,
    "birthday": birthday,
    "job": job,
    "address": address!.toJson(),
    "currentAddress": currentAddress!.toJson(),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

class Address {
  Address({
    this.currentAddress,
  });

  CurrentAddress? currentAddress;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    currentAddress: CurrentAddress.fromJson(json["currentAddress"]),
  );

  Map<String, dynamic> toJson() => {
    "currentAddress": currentAddress!.toJson(),
  };
}

class CurrentAddress {
  CurrentAddress({
    this.address,
    this.latitude,
    this.longitude,
  });

  String? address;
  dynamic latitude;
  dynamic longitude;

  factory CurrentAddress.fromJson(Map<String, dynamic> json) => CurrentAddress(
    address: json["address"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
  };
}
