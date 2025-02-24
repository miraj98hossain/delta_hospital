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
  final num? initialCollection;
  final num? dueCollection;
  final num? totalCollection;
  final num? totalRefund;
  final num? actualTotalCollection;
  final num? doctorCollection;
  final num? netCollection;
  final num? totalDailyCollection;
  final num? pathologySales;
  final num? totalExpense;
  final num? radiologySales;
  final num? radioTherapySales;
  final num? pharmacySales;
  final num? otherSales;
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
    this.totalDailyCollection,
    this.pathologySales,
    this.totalExpense,
    this.radiologySales,
    this.radioTherapySales,
    this.pharmacySales,
    this.otherSales,
    this.dataType,
    this.dataTypeName,
  });

  FinancialReport copyWith({
    num? initialCollection,
    num? dueCollection,
    num? totalCollection,
    num? totalRefund,
    num? actualTotalCollection,
    num? doctorCollection,
    num? netCollection,
    num? totalDailyCollection,
    num? pathologySales,
    num? totalExpense,
    num? radiologySales,
    num? radioTherapySales,
    num? pharmacySales,
    num? otherSales,
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
        totalDailyCollection: totalDailyCollection ?? this.totalDailyCollection,
        pathologySales: pathologySales ?? this.pathologySales,
        totalExpense: totalExpense ?? this.totalExpense,
        radiologySales: radiologySales ?? this.radiologySales,
        radioTherapySales: radioTherapySales ?? this.radioTherapySales,
        pharmacySales: pharmacySales ?? this.pharmacySales,
        otherSales: otherSales ?? this.otherSales,
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
        totalDailyCollection: json["totalDailyCollection"]?.toDouble(),
        pathologySales: json["pathologySales"]?.toDouble(),
        totalExpense: json["totalExpense"],
        radiologySales: json["radiologySales"],
        radioTherapySales: json["radioTherapySales"],
        pharmacySales: json["pharmacySales"]?.toDouble(),
        otherSales: json["otherSales"],
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
        "totalDailyCollection": totalDailyCollection,
        "pathologySales": pathologySales,
        "totalExpense": totalExpense,
        "radiologySales": radiologySales,
        "radioTherapySales": radioTherapySales,
        "pharmacySales": pharmacySales,
        "otherSales": otherSales,
        "dataType": dataType,
        "dataTypeName": dataTypeName,
      };
  Map<String, dynamic> toUiMap() => {
        "initialCollection": initialCollection,
        "dueCollection": dueCollection,
        "totalCollection": totalCollection,
        "totalRefund": totalRefund,
        "actualTotalCollection": actualTotalCollection,
        "doctorCollection": doctorCollection,
        "netCollection": netCollection,
        "totalDailyCollection": totalDailyCollection,
        "pathologySales": pathologySales,
        "totalExpense": totalExpense,
        "radiologySales": radiologySales,
        "radioTherapySales": radioTherapySales,
        "pharmacySales": pharmacySales,
        "otherSales": otherSales,
      };
}
