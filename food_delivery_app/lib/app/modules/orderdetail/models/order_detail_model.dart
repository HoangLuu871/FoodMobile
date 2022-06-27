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
    this.status,
    this.shippingFee,
    this.grandTotal,
    this.idShipper,
    this.address,
    this.orderedAt,
    this.user,
    this.foodOrder,
    this.restaurant,
  });

  int? id;
  int? idRes;
  int? idUser;
  String? status;
  dynamic shippingFee;
  dynamic grandTotal;
  int? idShipper;
  CurrentAddressClass? address;
  DateTime? orderedAt;
  User? user;
  List<FoodOrder>? foodOrder;
  Restaurant? restaurant;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
    id: json["id"],
    idRes: json["idRes"],
    idUser: json["idUser"],
    status: json["status"],
    shippingFee: json["shippingFee"],
    grandTotal: json["grandTotal"],
    idShipper: json["idShipper"],
    address: CurrentAddressClass.fromJson(json["address"]),
    orderedAt: DateTime.parse(json["orderedAt"]),
    user: User.fromJson(json["User"]),
    foodOrder: List<FoodOrder>.from(json["food_order"].map((x) => FoodOrder.fromJson(x))),
    restaurant: Restaurant.fromJson(json["Restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idRes": idRes,
    "idUser": idUser,
    "status": status,
    "shippingFee": shippingFee,
    "grandTotal": grandTotal,
    "idShipper": idShipper,
    "address": address!.toJson(),
    "orderedAt": orderedAt!.toIso8601String(),
    "User": user!.toJson(),
    "food_order": List<dynamic>.from(foodOrder!.map((x) => x.toJson())),
    "Restaurant": restaurant!.toJson(),
  };
}

class CurrentAddressClass {
  CurrentAddressClass({
    this.address,
    this.latitude,
    this.longitude,
  });

  String? address;
  dynamic latitude;
  dynamic longitude;

  factory CurrentAddressClass.fromJson(Map<String, dynamic> json) => CurrentAddressClass(
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

class FoodOrder {
  FoodOrder({
    this.name,
    this.price,
    this.prepareTime,
    this.imageLink,
    this.quantity,
  });

  String? name;
  int? price;
  int? prepareTime;
  String? imageLink;
  int? quantity;

  factory FoodOrder.fromJson(Map<String, dynamic> json) => FoodOrder(
    name: json["name"],
    price: json["price"],
    prepareTime: json["prepareTime"],
    imageLink: json["imageLink"],
    quantity: json["quantity"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "prepareTime": prepareTime,
    "imageLink": imageLink,
    "quantity": quantity
  };
}

class Restaurant {
  Restaurant({
    this.name,
    this.address,
    this.latitude,
    this.longtitude,

  });

  String? name;
  String? address;
  dynamic latitude;
  dynamic longtitude;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    name: json["name"],
    address: json["address"],
    latitude: json["latitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "latitude": latitude,
    "longtitude": longtitude,
  };
}

class User {
  User({
    this.name,
    this.phoneNumber,
    this.currentAddress,
  });

  String? name;
  String? phoneNumber;
  CurrentAddressClass? currentAddress;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    currentAddress: CurrentAddressClass.fromJson(json["currentAddress"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phoneNumber": phoneNumber,
    "currentAddress": currentAddress!.toJson(),
  };
}
