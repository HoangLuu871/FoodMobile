import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {

  DashboardModel({
    this.id,
    this.address,
    this.orderedAt,
    this.userName,
    this.restaurantName,
    this.status,
    this.grandTotal,
    this.restaurantLat,
    this.restaurantLong,
  });

  int? id;
  String? address;
  DateTime? orderedAt;
  String? userName;
  String? restaurantName;
  String? status;
  dynamic grandTotal;
  dynamic restaurantLat;
  dynamic restaurantLong;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    id: json["id"],
    address: json["address"],
    orderedAt: DateTime.parse(json["orderedAt"]),
    userName: json["userName"],
    restaurantName: json["restaurantName"],
    status: json["status"],
    grandTotal: json["grandTotal"],
    restaurantLat: json["restaurantLat"],
    restaurantLong: json["restaurantLong"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "orderedAt": orderedAt!.toIso8601String(),
    "userName": userName,
    "restaurantName": restaurantName,
    "status": status,
    "grandTotal" : grandTotal,
    "restaurantLat": restaurantLat,
    "restaurantLong": restaurantLong
  };
}
