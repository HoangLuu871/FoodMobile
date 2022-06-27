import 'dart:convert';

MenuManagerModel menuManagerModelFromJson(String str) => MenuManagerModel.fromJson(json.decode(str));

String menuManagerModelToJson(MenuManagerModel data) => json.encode(data.toJson());

class MenuManagerModel {
  MenuManagerModel({
    this.count,
    this.rows,
  });

  dynamic count;
  List<Row>? rows;

  factory MenuManagerModel.fromJson(Map<String, dynamic> json) => MenuManagerModel(
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
    this.name,
    this.price,
    this.prepareTime,
    this.imageLink,
    this.updatedAt,
  });

  int? id;
  int? idRes;
  String? name;
  int? price;
  int? prepareTime;
  String? imageLink;
  DateTime? updatedAt;

  factory Row.fromJson(Map<String, dynamic> json) => Row(
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
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
