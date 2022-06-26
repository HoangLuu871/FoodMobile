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
    this.qualityScore,
    this.serviceScore,
    this.spaceScore,
    this.priceScore,
    this.locationScore,
    this.openTime,
    this.closeTime,
    this.category,
    this.fit,
    this.capacity,
    this.cuisines,
    this.suitable,
    this.fuitable,
    this.coverImageLink,
    this.groupName,
    this.createdAt,
    this.updatedAt,
    this.categories,
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
  String? qualityScore;
  String? serviceScore;
  String? spaceScore;
  String? priceScore;
  String? locationScore;
  String? openTime;
  String? closeTime;
  List<String>? category;
  List<String>? fit;
  String? capacity;
  List<String>? cuisines;
  List<String>? suitable;
  List<dynamic>? fuitable;
  String? coverImageLink;
  String? groupName;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Category>? categories;
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
    qualityScore: json["qualityScore"],
    serviceScore: json["serviceScore"],
    spaceScore: json["spaceScore"],
    priceScore: json["priceScore"],
    locationScore: json["locationScore"],
    openTime: json["openTime"],
    closeTime: json["closeTime"],
    category: List<String>.from(json["category"].map((x) => x)),
    fit: List<String>.from(json["fit"].map((x) => x)),
    capacity: json["capacity"],
    cuisines: List<String>.from(json["cuisines"].map((x) => x)),
    suitable: List<String>.from(json["suitable"].map((x) => x)),
    fuitable: List<dynamic>.from(json["fuitable"].map((x) => x)),
    coverImageLink: json["coverImageLink"],
    groupName: json["groupName"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    categories: List<Category>.from(json["Categories"].map((x) => Category.fromJson(x))),
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
    "qualityScore": qualityScore,
    "serviceScore": serviceScore,
    "spaceScore": spaceScore,
    "priceScore": priceScore,
    "locationScore": locationScore,
    "openTime": openTime,
    "closeTime": closeTime,
    "category": List<dynamic>.from(category!.map((x) => x)),
    "fit": List<dynamic>.from(fit!.map((x) => x)),
    "capacity": capacity,
    "cuisines": List<dynamic>.from(cuisines!.map((x) => x)),
    "suitable": List<dynamic>.from(suitable!.map((x) => x)),
    "fuitable": List<dynamic>.from(fuitable!.map((x) => x)),
    "coverImageLink": coverImageLink,
    "groupName": groupName,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "Categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "Distance": distance,
    "shippingTime": shippingTime,
    "totalOrders": totalOrders,
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.imageLink,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic imageLink;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    imageLink: json["imageLink"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageLink": imageLink,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
