import 'dart:convert';

class OpdIpdPatientReportResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<PatientReport>? items;
  final dynamic obj;
  final dynamic count;

  OpdIpdPatientReportResponse({
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

  OpdIpdPatientReportResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<PatientReport>? items,
    dynamic obj,
    dynamic count,
  }) =>
      OpdIpdPatientReportResponse(
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

  factory OpdIpdPatientReportResponse.fromJson(String str) =>
      OpdIpdPatientReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OpdIpdPatientReportResponse.fromMap(Map<String, dynamic> json) =>
      OpdIpdPatientReportResponse(
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
            : List<PatientReport>.from(
                json["items"]!.map((x) => PatientReport.fromMap(x))),
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

class PatientReport {
  final String? totalPatient;
  final String? malePatient;
  final String? femalePatient;
  final String? otherPatient;
  final int? dataType;
  final String? dataTypeName;

  PatientReport({
    this.totalPatient,
    this.malePatient,
    this.femalePatient,
    this.otherPatient,
    this.dataType,
    this.dataTypeName,
  });

  PatientReport copyWith({
    String? totalPatient,
    String? malePatient,
    String? femalePatient,
    String? otherPatient,
    int? dataType,
    String? dataTypeName,
  }) =>
      PatientReport(
        totalPatient: totalPatient ?? this.totalPatient,
        malePatient: malePatient ?? this.malePatient,
        femalePatient: femalePatient ?? this.femalePatient,
        otherPatient: otherPatient ?? this.otherPatient,
        dataType: dataType ?? this.dataType,
        dataTypeName: dataTypeName ?? this.dataTypeName,
      );

  factory PatientReport.fromJson(String str) =>
      PatientReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientReport.fromMap(Map<String, dynamic> json) => PatientReport(
        totalPatient: json["totalPatient"],
        malePatient: json["malePatient"],
        femalePatient: json["femalePatient"],
        otherPatient: json["otherPatient"],
        dataType: json["dataType"],
        dataTypeName: json["dataTypeName"],
      );

  Map<String, dynamic> toMap() => {
        "totalPatient": totalPatient,
        "malePatient": malePatient,
        "femalePatient": femalePatient,
        "otherPatient": otherPatient,
        "dataType": dataType,
        "dataTypeName": dataTypeName,
      };
}
