import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
  DetailsModel({
    required this.tables,
  });

  List<Tables> tables;

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
    tables: json["tables"],
  );

  Map<String, dynamic> toJson() => {
    "tables": List<dynamic>.from(tables.map((x) => x.toJson())),
  };
}

class Tables {
  Tables({
    required this.id,
    required this.name,
    required this.location,
    required this.code,
    required this.maxWaiter,
    required this.isActive,
    required this.isOutside,
    required this.createdAt,
    required this.updatedAt,
    required this.orders,
  });

  int id;
  String name;
  String location;
  String code;
  int maxWaiter;
  int isActive;
  int isOutside;
  DateTime createdAt;
  DateTime updatedAt;
  List<Order> orders;

  factory Tables.fromJson(Map<String, dynamic> json) => Tables(
    id: json["id"],
    name: json["name"],
    location: json["location"],
    code: json["code"],
    maxWaiter: json["max_waiter"],
    isActive: json["is_active"],
    isOutside: json["is_outside"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "location": location,
    "code": code,
    "max_waiter": maxWaiter,
    "is_active": isActive,
    "is_outside": isOutside,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    required this.qty,
    required this.totalItem,
    required this.id,
    required this.tblId,
    this.item,
  });

  String qty;
  int totalItem;
  int id;
  int tblId;
  dynamic item;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    qty: json["qty"],
    totalItem: json["total_item"],
    id: json["id"],
    tblId: json["tbl_id"],
    item: json["item"],
  );

  Map<String, dynamic> toJson() => {
    "qty": qty,
    "total_item": totalItem,
    "id": id,
    "tbl_id": tblId,
    "item": item,
  };
}
