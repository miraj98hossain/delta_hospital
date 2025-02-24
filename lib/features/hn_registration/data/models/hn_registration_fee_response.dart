import 'dart:convert';

class HnRegistrationFeeResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final RegistrationFee? obj;
  final dynamic count;

  HnRegistrationFeeResponse({
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

  HnRegistrationFeeResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    RegistrationFee? obj,
    dynamic count,
  }) =>
      HnRegistrationFeeResponse(
        success: success ?? this.success,
        info: info ?? this.info,
        warning: warning ?? this.warning,
        message: message ?? this.message,
        valid: valid ?? this.valid,
        errorCode: errorCode ?? this.errorCode,
        id: id ?? this.id,
        model: model ?? this.model,
        items: items ?? this.items,
        obj: obj ?? this.obj,
        count: count ?? this.count,
      );

  factory HnRegistrationFeeResponse.fromJson(String str) =>
      HnRegistrationFeeResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HnRegistrationFeeResponse.fromMap(Map<String, dynamic> json) =>
      HnRegistrationFeeResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null ? null : RegistrationFee.fromMap(json["obj"]),
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
        "items": items,
        "obj": obj?.toMap(),
        "count": count,
      };
}

class RegistrationFee {
  final int? itemNo;
  final String? itemId;
  final String? itemName;
  final int? buNo;
  final int? salesPrice;

  RegistrationFee({
    this.itemNo,
    this.itemId,
    this.itemName,
    this.buNo,
    this.salesPrice,
  });

  RegistrationFee copyWith({
    int? itemNo,
    String? itemId,
    String? itemName,
    int? buNo,
    int? salesPrice,
  }) =>
      RegistrationFee(
        itemNo: itemNo ?? this.itemNo,
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        buNo: buNo ?? this.buNo,
        salesPrice: salesPrice ?? this.salesPrice,
      );

  factory RegistrationFee.fromJson(String str) =>
      RegistrationFee.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationFee.fromMap(Map<String, dynamic> json) => RegistrationFee(
        itemNo: json["itemNo"],
        itemId: json["itemId"],
        itemName: json["itemName"],
        buNo: json["buNo"],
        salesPrice: json["salesPrice"],
      );

  Map<String, dynamic> toMap() => {
        "itemNo": itemNo,
        "itemId": itemId,
        "itemName": itemName,
        "buNo": buNo,
        "salesPrice": salesPrice,
      };
}
