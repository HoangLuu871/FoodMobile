import 'dart:convert';

ResManagerModel resManagerModelFromJson(String str) => ResManagerModel.fromJson(json.decode(str));

String resManagerModelToJson(ResManagerModel data) => json.encode(data.toJson());

class ResManagerModel {
  ResManagerModel({
    this.id,
    this.idUser,
    this.name,
    this.address,
    this.avgRating,
    this.totalReviews,
    this.totalFavourites,
    this.totalViews,
    this.priceRange,
    this.openTime,
    this.closeTime,
    this.coverImageLink,
    this.createdAt,
    this.updatedAt,
    this.distance,
    this.shippingTime,
    this.totalOrders,
  });

  int? id;
  int? idUser;
  String? name;
  String? address;
  String? avgRating;
  String? totalReviews;
  dynamic totalFavourites;
  dynamic totalViews;
  String? priceRange;
  String? openTime;
  String? closeTime;
  String? coverImageLink;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? distance;
  dynamic shippingTime;
  String? totalOrders;

  factory ResManagerModel.fromJson(Map<String, dynamic> json) => ResManagerModel(
    id: json["id"],
    idUser: json["idUser"],
    name: json["name"],
    address: json["address"],
    avgRating: json["avgRating"],
    totalReviews: json["totalReviews"],
    totalFavourites: json["totalFavourites"],
    totalViews: json["totalViews"],
    priceRange: json["priceRange"],
    openTime: json["openTime"],
    closeTime: json["closeTime"],
    coverImageLink: json["coverImageLink"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    distance: json["Distance"],
    shippingTime: json["shippingTime"],
    totalOrders: json["totalOrders"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idUser": idUser,
    "name": name,
    "address": address,
    "avgRating": avgRating,
    "totalReviews": totalReviews,
    "totalFavourites": totalFavourites,
    "totalViews": totalViews,
    "priceRange": priceRange,
    "openTime": openTime,
    "closeTime": closeTime,
    "coverImageLink": coverImageLink,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "Distance": distance,
    "shippingTime": shippingTime,
    "totalOrders": totalOrders,
  };
}