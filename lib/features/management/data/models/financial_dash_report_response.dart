import 'dart:convert';

class FinancialDashReportResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<FinancialReport>? items;
  final dynamic obj;
  final dynamic count;

  FinancialDashReportResponse({
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

  FinancialDashReportResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<FinancialReport>? items,
    dynamic obj,
    dynamic count,
  }) =>
      FinancialDashReportResponse(
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

  factory FinancialDashReportResponse.fromJson(String str) =>
      FinancialDashReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FinancialDashReportResponse.fromMap(Map<String, dynamic> json) =>
      FinancialDashReportResponse(
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
            : List<FinancialReport>.from(
                json["items"]!.map((x) => FinancialReport.fromMap(x))),
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

class FinancialReport {
  final String? initialCollection;
  final String? dueCollection;
  final String? totalCollection;
  final String? totalRefund;
  final String? actualTotalCollection;
  final String? doctorCollection;
  final String? netCollection;
  final int? dataType;
  final String? dataTypeName;

  FinancialReport({
    this.initialCollection,
    this.dueCollection,
    this.totalCollection,
    this.totalRefund,
    this.actualTotalCollection,
    this.doctorCollection,
    this.netCollection,
    this.dataType,
    this.dataTypeName,
  });

  FinancialReport copyWith({
    String? initialCollection,
    String? dueCollection,
    String? totalCollection,
    String? totalRefund,
    String? actualTotalCollection,
    String? doctorCollection,
    String? netCollection,
    int? dataType,
    String? dataTypeName,
  }) =>
      FinancialReport(
        initialCollection: initialCollection ?? this.initialCollection,
        dueCollection: dueCollection ?? this.dueCollection,
        totalCollection: totalCollection ?? this.totalCollection,
        totalRefund: totalRefund ?? this.totalRefund,
        actualTotalCollection:
            actualTotalCollection ?? this.actualTotalCollection,
        doctorCollection: doctorCollection ?? this.doctorCollection,
        netCollection: netCollection ?? this.netCollection,
        dataType: dataType ?? this.dataType,
        dataTypeName: dataTypeName ?? this.dataTypeName,
      );

  factory FinancialReport.fromJson(String str) =>
      FinancialReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FinancialReport.fromMap(Map<String, dynamic> json) => FinancialReport(
        initialCollection: json["initialCollection"],
        dueCollection: json["dueCollection"],
        totalCollection: json["totalCollection"],
        totalRefund: json["totalRefund"],
        actualTotalCollection: json["actualTotalCollection"],
        doctorCollection: json["doctorCollection"],
        netCollection: json["netCollection"],
        dataType: json["dataType"],
        dataTypeName: json["dataTypeName"],
      );

  Map<String, dynamic> toMap() => {
        "initialCollection": initialCollection,
        "dueCollection": dueCollection,
        "totalCollection": totalCollection,
        "totalRefund": totalRefund,
        "actualTotalCollection": actualTotalCollection,
        "doctorCollection": doctorCollection,
        "netCollection": netCollection,
        "dataType": dataType,
        "dataTypeName": dataTypeName,
      };
}
