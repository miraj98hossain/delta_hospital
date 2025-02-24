import 'dart:convert';

class HisLogoutResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final dynamic obj;
  final dynamic count;

  HisLogoutResponse({
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

  HisLogoutResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    dynamic obj,
    dynamic count,
  }) =>
      HisLogoutResponse(
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

  factory HisLogoutResponse.fromJson(String str) =>
      HisLogoutResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HisLogoutResponse.fromMap(Map<String, dynamic> json) =>
      HisLogoutResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
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
        "model": model,
        "items": items,
        "obj": obj,
        "count": count,
      };
}
