import 'dart:convert';

class PatientTypeResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<PatientType>? items;
  final dynamic obj;
  final dynamic count;

  PatientTypeResponse({
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

  PatientTypeResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<PatientType>? items,
    dynamic obj,
    dynamic count,
  }) =>
      PatientTypeResponse(
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

  factory PatientTypeResponse.fromJson(String str) =>
      PatientTypeResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientTypeResponse.fromMap(Map<String, dynamic> json) =>
      PatientTypeResponse(
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
            : List<PatientType>.from(
                json["items"]!.map((x) => PatientType.fromMap(x))),
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

class PatientType {
  final String? patientTypeNo;
  final String? patientTypeName;

  PatientType({
    this.patientTypeNo,
    this.patientTypeName,
  });

  PatientType copyWith({
    String? patientTypeNo,
    String? patientTypeName,
  }) =>
      PatientType(
        patientTypeNo: patientTypeNo ?? this.patientTypeNo,
        patientTypeName: patientTypeName ?? this.patientTypeName,
      );

  factory PatientType.fromJson(String str) =>
      PatientType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientType.fromMap(Map<String, dynamic> json) => PatientType(
        patientTypeNo: json["patientTypeNo"],
        patientTypeName: json["patientTypeName"],
      );

  Map<String, dynamic> toMap() => {
        "patientTypeNo": patientTypeNo,
        "patientTypeName": patientTypeName,
      };

  @override
  String toString() {
    return patientTypeName ?? "";
  }
}
