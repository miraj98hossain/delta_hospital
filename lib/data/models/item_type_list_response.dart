import 'dart:convert';

class ItemTypeListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<ItemType>? items;
  final dynamic obj;
  final dynamic count;

  ItemTypeListResponse({
    this.success,
    this.info,
    this.warning,
    this.message,
    this.valid,
    this.errorCode,
    this.id,
    this.model,
    this.items,
    this.obj,
    this.count,
  });

  factory ItemTypeListResponse.fromJson(String str) =>
      ItemTypeListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemTypeListResponse.fromMap(Map<String, dynamic> json) =>
      ItemTypeListResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"] == null
            ? []
            : List<ItemType>.from(
                json["items"]!.map((x) => ItemType.fromMap(x))),
        obj: json["obj"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "info": info,
        "warning": warning,
        "message": message,
        "valid": valid,
        "errorCode": errorCode,
        "id": id,
        "model": model,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "obj": obj,
        "count": count,
      };
}

class ItemType {
  final int? id;
  final int? parentItemTypeNo;
  final String? itemTypeName;
  final int? companyNo;

  ItemType({
    this.id,
    this.parentItemTypeNo,
    this.itemTypeName,
    this.companyNo,
  });

  factory ItemType.fromJson(String str) => ItemType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemType.fromMap(Map<String, dynamic> json) => ItemType(
        id: json["id"],
        parentItemTypeNo: json["parentItemTypeNo"],
        itemTypeName: json["itemTypeName"],
        companyNo: json["companyNo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "parentItemTypeNo": parentItemTypeNo,
        "itemTypeName": itemTypeName,
        "companyNo": companyNo,
      };
  @override
  String toString() {
    return itemTypeName ?? "";
  }
}
