import 'dart:convert';

class DoctorShiftListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<Shift>? items;
  final dynamic obj;
  final dynamic count;

  DoctorShiftListResponse({
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

  DoctorShiftListResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<Shift>? items,
    dynamic obj,
    dynamic count,
  }) =>
      DoctorShiftListResponse(
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

  factory DoctorShiftListResponse.fromJson(String str) =>
      DoctorShiftListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorShiftListResponse.fromMap(Map<String, dynamic> json) =>
      DoctorShiftListResponse(
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
            : List<Shift>.from(json["items"]!.map((x) => Shift.fromMap(x))),
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

class Shift {
  final String? shiftTime;
  final int? shiftOutsec;
  final int? shiftInsec;
  final String? shiftDetail;
  final int? shiftNo;

  Shift({
    this.shiftTime,
    this.shiftOutsec,
    this.shiftInsec,
    this.shiftDetail,
    this.shiftNo,
  });

  Shift copyWith({
    String? shiftTime,
    int? shiftOutsec,
    int? shiftInsec,
    String? shiftDetail,
    int? shiftNo,
  }) =>
      Shift(
        shiftTime: shiftTime ?? this.shiftTime,
        shiftOutsec: shiftOutsec ?? this.shiftOutsec,
        shiftInsec: shiftInsec ?? this.shiftInsec,
        shiftDetail: shiftDetail ?? this.shiftDetail,
        shiftNo: shiftNo ?? this.shiftNo,
      );

  factory Shift.fromJson(String str) => Shift.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Shift.fromMap(Map<String, dynamic> json) => Shift(
        shiftTime: json["shiftTime"],
        shiftOutsec: json["shiftOutsec"],
        shiftInsec: json["shiftInsec"],
        shiftDetail: json["shiftDetail"],
        shiftNo: json["shiftNo"],
      );

  Map<String, dynamic> toMap() => {
        "shiftTime": shiftTime,
        "shiftOutsec": shiftOutsec,
        "shiftInsec": shiftInsec,
        "shiftDetail": shiftDetail,
        "shiftNo": shiftNo,
      };
}
