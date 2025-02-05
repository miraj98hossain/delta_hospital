import 'dart:convert';

class FetchPatientPdfResponse {
  bool? success;
  bool? info;
  bool? warning;
  String? message;
  bool? valid;
  int? errorCode;
  dynamic id;
  dynamic model;
  dynamic items;
  String? obj;
  dynamic count;

  FetchPatientPdfResponse({
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

  factory FetchPatientPdfResponse.fromJson(String str) =>
      FetchPatientPdfResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FetchPatientPdfResponse.fromMap(Map<String, dynamic> json) =>
      FetchPatientPdfResponse(
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
