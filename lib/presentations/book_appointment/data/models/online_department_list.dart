import 'dart:convert';

class OnlineDepartmentListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final int? id;
  final dynamic model;
  final List<Department>? items;
  final Obj? obj;
  final dynamic count;

  OnlineDepartmentListResponse({
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

  factory OnlineDepartmentListResponse.fromJson(String str) =>
      OnlineDepartmentListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OnlineDepartmentListResponse.fromMap(Map<String, dynamic> json) =>
      OnlineDepartmentListResponse(
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
            : List<Department>.from(
                json["items"]!.map((x) => Department.fromMap(x))),
        obj: json["obj"] == null ? null : Obj.fromMap(json["obj"]),
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
        "obj": obj?.toMap(),
        "count": count,
      };
}

class Department {
  final int? id;
  final String? buName;

  Department({
    this.id,
    this.buName,
  });

  factory Department.fromJson(String str) =>
      Department.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Department.fromMap(Map<String, dynamic> json) => Department(
        id: json["id"],
        buName: json["buName"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "buName": buName,
      };
  @override
  String toString() {
    return buName ?? "";
  }
}

class Obj {
  final dynamic action;
  final dynamic message;

  Obj({
    this.action,
    this.message,
  });

  factory Obj.fromJson(String str) => Obj.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Obj.fromMap(Map<String, dynamic> json) => Obj(
        action: json["action"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "action": action,
        "message": message,
      };
}
