import 'dart:convert';

class HnRegistrationResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final HnInfo? model;
  final dynamic items;
  final dynamic obj;
  final dynamic count;

  HnRegistrationResponse({
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

  HnRegistrationResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    HnInfo? model,
    dynamic items,
    dynamic obj,
    dynamic count,
  }) =>
      HnRegistrationResponse(
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

  factory HnRegistrationResponse.fromJson(String str) =>
      HnRegistrationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HnRegistrationResponse.fromMap(Map<String, dynamic> json) =>
      HnRegistrationResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"] == null ? null : HnInfo.fromMap(json["model"]),
        items: json["items"],
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
        "model": model?.toMap(),
        "items": items,
        "obj": obj,
        "count": count,
      };
}

class HnInfo {
  final int? regNo;
  final int? action;
  final String? invoiceId;
  final String? hospitalNo;
  final String? message;
  final int? invoiceNo;

  HnInfo({
    this.regNo,
    this.action,
    this.invoiceId,
    this.hospitalNo,
    this.message,
    this.invoiceNo,
  });

  HnInfo copyWith({
    int? regNo,
    int? action,
    String? invoiceId,
    String? hospitalNo,
    String? message,
    int? invoiceNo,
  }) =>
      HnInfo(
        regNo: regNo ?? this.regNo,
        action: action ?? this.action,
        invoiceId: invoiceId ?? this.invoiceId,
        hospitalNo: hospitalNo ?? this.hospitalNo,
        message: message ?? this.message,
        invoiceNo: invoiceNo ?? this.invoiceNo,
      );

  factory HnInfo.fromJson(String str) => HnInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HnInfo.fromMap(Map<String, dynamic> json) => HnInfo(
        regNo: json["regNo"],
        action: json["action"],
        invoiceId: json["invoiceId"],
        hospitalNo: json["hospitalNo"],
        message: json["message"],
        invoiceNo: json["invoiceNo"],
      );

  Map<String, dynamic> toMap() => {
        "regNo": regNo,
        "action": action,
        "invoiceId": invoiceId,
        "hospitalNo": hospitalNo,
        "message": message,
        "invoiceNo": invoiceNo,
      };
}
