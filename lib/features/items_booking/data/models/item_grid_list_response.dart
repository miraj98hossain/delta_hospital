import 'dart:convert';

class ItemGridListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final Model? model;
  final List<ItemInfo>? items;
  final ItemGridList? obj;
  final dynamic count;

  ItemGridListResponse({
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

  factory ItemGridListResponse.fromJson(String str) =>
      ItemGridListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemGridListResponse.fromMap(Map<String, dynamic> json) =>
      ItemGridListResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"] == null ? null : Model.fromMap(json["model"]),
        items: json["items"] == null
            ? []
            : List<ItemInfo>.from(
                json["items"]!.map((x) => ItemInfo.fromMap(x))),
        obj: json["obj"] == null ? null : ItemGridList.fromMap(json["obj"]),
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
        "model": model?.toMap(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "obj": obj?.toMap(),
        "count": count,
      };
}

class ItemInfo {
  final int? itemNo;
  final String? itemId;
  final String? itemName;
  final int? itemTypeNo;
  final String? itemTypeName;
  final int? buNo;
  final String? buName;
  final num? salesPrice;
  final num? purchasePrice;
  final String? priceMasking;
  final int? showPriceMasking;
  final dynamic searchParam;

  ItemInfo({
    this.itemNo,
    this.itemId,
    this.itemName,
    this.itemTypeNo,
    this.itemTypeName,
    this.buNo,
    this.buName,
    this.salesPrice,
    this.purchasePrice,
    this.priceMasking,
    this.showPriceMasking,
    this.searchParam,
  });

  factory ItemInfo.fromJson(String str) => ItemInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemInfo.fromMap(Map<String, dynamic> json) => ItemInfo(
        itemNo: json["itemNo"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        itemTypeNo: json["itemTypeNo"],
        itemTypeName: json["itemTypeName"],
        buNo: json["buNo"],
        buName: json["buName"],
        salesPrice: json["salesPrice"],
        purchasePrice: json["purchasePrice"],
        priceMasking: json["priceMasking"],
        showPriceMasking: json["showPriceMasking"],
        searchParam: json["searchParam"],
      );

  Map<String, dynamic> toMap() => {
        "itemNo": itemNo,
        "itemId": itemId,
        "itemName": itemName,
        "itemTypeNo": itemTypeNo,
        "itemTypeName": itemTypeName,
        "buNo": buNo,
        "buName": buName,
        "salesPrice": salesPrice,
        "purchasePrice": purchasePrice,
        "priceMasking": priceMasking,
        "showPriceMasking": showPriceMasking,
        "searchParam": searchParam,
      };
}

class Model {
  final String? msg;
  final int? notifyFlag;

  Model({
    this.msg,
    this.notifyFlag,
  });

  factory Model.fromJson(String str) => Model.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Model.fromMap(Map<String, dynamic> json) => Model(
        msg: json["msg"],
        notifyFlag: json["notifyFlag"],
      );

  Map<String, dynamic> toMap() => {
        "msg": msg,
        "notifyFlag": notifyFlag,
      };
}

class ItemGridList {
  final String? draw;
  final String? recordsFiltered;
  final String? recordsTotal;
  final List<ItemInfo>? data;

  ItemGridList({
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  factory ItemGridList.fromJson(String str) =>
      ItemGridList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemGridList.fromMap(Map<String, dynamic> json) => ItemGridList(
        draw: json["draw"],
        recordsFiltered: json["recordsFiltered"],
        recordsTotal: json["recordsTotal"],
        data: json["data"] == null
            ? []
            : List<ItemInfo>.from(
                json["data"]!.map((x) => ItemInfo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "draw": draw,
        "recordsFiltered": recordsFiltered,
        "recordsTotal": recordsTotal,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}
