import 'dart:convert';

class ConsultationFeeResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final dynamic message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final int? obj;
  final dynamic count;

  ConsultationFeeResponse({
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

  ConsultationFeeResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    dynamic message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    int? obj,
    dynamic count,
  }) =>
      ConsultationFeeResponse(
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

  factory ConsultationFeeResponse.fromJson(String str) =>
      ConsultationFeeResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultationFeeResponse.fromMap(Map<String, dynamic> json) =>
      ConsultationFeeResponse(
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
