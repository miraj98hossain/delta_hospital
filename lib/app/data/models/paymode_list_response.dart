import 'dart:convert';

class PaymodeListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<Paymode>? items;
  final dynamic obj;
  final dynamic count;

  PaymodeListResponse({
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

  PaymodeListResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<Paymode>? items,
    dynamic obj,
    dynamic count,
  }) =>
      PaymodeListResponse(
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

  factory PaymodeListResponse.fromJson(String str) =>
      PaymodeListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymodeListResponse.fromMap(Map<String, dynamic> json) =>
      PaymodeListResponse(
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
            : List<Paymode>.from(json["items"]!.map((x) => Paymode.fromMap(x))),
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

class Paymode {
  final int? payModeNo;
  final int? isDefaultForOnline;
  final int? onlineAppointmentFlag;
  final String? payModeName;

  Paymode({
    this.payModeNo,
    this.isDefaultForOnline,
    this.onlineAppointmentFlag,
    this.payModeName,
  });

  Paymode copyWith({
    int? payModeNo,
    int? isDefaultForOnline,
    int? onlineAppointmentFlag,
    String? payModeName,
  }) =>
      Paymode(
        payModeNo: payModeNo ?? this.payModeNo,
        isDefaultForOnline: isDefaultForOnline ?? this.isDefaultForOnline,
        onlineAppointmentFlag:
            onlineAppointmentFlag ?? this.onlineAppointmentFlag,
        payModeName: payModeName ?? this.payModeName,
      );

  factory Paymode.fromJson(String str) => Paymode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paymode.fromMap(Map<String, dynamic> json) => Paymode(
        payModeNo: json["payModeNo"],
        isDefaultForOnline: json["isDefaultForOnline"],
        onlineAppointmentFlag: json["onlineAppointmentFlag"],
        payModeName: json["payModeName"],
      );

  Map<String, dynamic> toMap() => {
        "payModeNo": payModeNo,
        "isDefaultForOnline": isDefaultForOnline,
        "onlineAppointmentFlag": onlineAppointmentFlag,
        "payModeName": payModeName,
      };
}
