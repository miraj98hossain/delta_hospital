import 'dart:convert';

class PatientReportGridListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final ReportGridList? obj;
  final dynamic count;

  PatientReportGridListResponse({
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

  PatientReportGridListResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    ReportGridList? obj,
    dynamic count,
  }) =>
      PatientReportGridListResponse(
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

  factory PatientReportGridListResponse.fromJson(String str) =>
      PatientReportGridListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientReportGridListResponse.fromMap(Map<String, dynamic> json) =>
      PatientReportGridListResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null ? null : ReportGridList.fromMap(json["obj"]),
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
        "obj": obj?.toMap(),
        "count": count,
      };
}

class ReportGridList {
  final String? draw;
  final String? recordsFiltered;
  final String? recordsTotal;
  final List<Report>? data;

  ReportGridList({
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  ReportGridList copyWith({
    String? draw,
    String? recordsFiltered,
    String? recordsTotal,
    List<Report>? data,
  }) =>
      ReportGridList(
        draw: draw ?? this.draw,
        recordsFiltered: recordsFiltered ?? this.recordsFiltered,
        recordsTotal: recordsTotal ?? this.recordsTotal,
        data: data ?? this.data,
      );

  factory ReportGridList.fromJson(String str) =>
      ReportGridList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportGridList.fromMap(Map<String, dynamic> json) => ReportGridList(
        draw: json["draw"],
        recordsFiltered: json["recordsFiltered"],
        recordsTotal: json["recordsTotal"],
        data: json["data"] == null
            ? []
            : List<Report>.from(json["data"]!.map((x) => Report.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "draw": draw,
        "recordsFiltered": recordsFiltered,
        "recordsTotal": recordsTotal,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Report {
  final int? invoiceDtlNo;
  final int? regNo;
  final String? hospitalNumber;
  final String? patientName;
  final String? genderData;
  final String? age;
  final dynamic admissionNo;
  final dynamic admissionId;
  final int? invoiceNo;
  final String? invoiceId;
  final String? invoiceDate;
  final int? refDocNo;
  final String? invoiceDateTime;
  final String? reportDeliveryDate;
  final String? reportDeliveryDateTime;
  final String? itemWiseDeliveryDate;
  final String? itemWiseDeliveryDateTime;
  final int? deliveryStatusNo;
  final int? itemTypeNo;
  final String? itemTypeName;
  final int? buNo;
  final String? buName;
  final int? itemNo;
  final String? itemName;
  final String? repItemName;
  final int? stampNo;
  final String? stampId;
  final int? isReady;
  final dynamic status;
  final String? billStatus;
  final dynamic b2BLabNo;
  final dynamic billUnitNo;
  final String? reportName;
  final String? webStatus;
  final int? testTempNo;
  final String? tempName;
  final String? formUrl;
  final String? reportUrl;
  final dynamic nationalId;
  final dynamic passportNo;
  final int? nonLabStatus;
  final String? labId;
  final int? specialItemFlag;
  final int? companyNo;
  final int? isFileUpload;
  final dynamic attachmentName;
  final dynamic attachmentPath;
  final dynamic fromDate;
  final dynamic toDate;

  Report({
    this.invoiceDtlNo,
    this.regNo,
    this.hospitalNumber,
    this.patientName,
    this.genderData,
    this.age,
    this.admissionNo,
    this.admissionId,
    this.invoiceNo,
    this.invoiceId,
    this.invoiceDate,
    this.refDocNo,
    this.invoiceDateTime,
    this.reportDeliveryDate,
    this.reportDeliveryDateTime,
    this.itemWiseDeliveryDate,
    this.itemWiseDeliveryDateTime,
    this.deliveryStatusNo,
    this.itemTypeNo,
    this.itemTypeName,
    this.buNo,
    this.buName,
    this.itemNo,
    this.itemName,
    this.repItemName,
    this.stampNo,
    this.stampId,
    this.isReady,
    this.status,
    this.billStatus,
    this.b2BLabNo,
    this.billUnitNo,
    this.reportName,
    this.webStatus,
    this.testTempNo,
    this.tempName,
    this.formUrl,
    this.reportUrl,
    this.nationalId,
    this.passportNo,
    this.nonLabStatus,
    this.labId,
    this.specialItemFlag,
    this.companyNo,
    this.isFileUpload,
    this.attachmentName,
    this.attachmentPath,
    this.fromDate,
    this.toDate,
  });

  Report copyWith({
    int? invoiceDtlNo,
    int? regNo,
    String? hospitalNumber,
    String? patientName,
    String? genderData,
    String? age,
    dynamic admissionNo,
    dynamic admissionId,
    int? invoiceNo,
    String? invoiceId,
    String? invoiceDate,
    int? refDocNo,
    String? invoiceDateTime,
    String? reportDeliveryDate,
    String? reportDeliveryDateTime,
    String? itemWiseDeliveryDate,
    String? itemWiseDeliveryDateTime,
    int? deliveryStatusNo,
    int? itemTypeNo,
    String? itemTypeName,
    int? buNo,
    String? buName,
    int? itemNo,
    String? itemName,
    String? repItemName,
    int? stampNo,
    String? stampId,
    int? isReady,
    dynamic status,
    String? billStatus,
    dynamic b2BLabNo,
    dynamic billUnitNo,
    String? reportName,
    String? webStatus,
    int? testTempNo,
    String? tempName,
    String? formUrl,
    String? reportUrl,
    dynamic nationalId,
    dynamic passportNo,
    int? nonLabStatus,
    String? labId,
    int? specialItemFlag,
    int? companyNo,
    int? isFileUpload,
    dynamic attachmentName,
    dynamic attachmentPath,
    dynamic fromDate,
    dynamic toDate,
  }) =>
      Report(
        invoiceDtlNo: invoiceDtlNo ?? this.invoiceDtlNo,
        regNo: regNo ?? this.regNo,
        hospitalNumber: hospitalNumber ?? this.hospitalNumber,
        patientName: patientName ?? this.patientName,
        genderData: genderData ?? this.genderData,
        age: age ?? this.age,
        admissionNo: admissionNo ?? this.admissionNo,
        admissionId: admissionId ?? this.admissionId,
        invoiceNo: invoiceNo ?? this.invoiceNo,
        invoiceId: invoiceId ?? this.invoiceId,
        invoiceDate: invoiceDate ?? this.invoiceDate,
        refDocNo: refDocNo ?? this.refDocNo,
        invoiceDateTime: invoiceDateTime ?? this.invoiceDateTime,
        reportDeliveryDate: reportDeliveryDate ?? this.reportDeliveryDate,
        reportDeliveryDateTime:
            reportDeliveryDateTime ?? this.reportDeliveryDateTime,
        itemWiseDeliveryDate: itemWiseDeliveryDate ?? this.itemWiseDeliveryDate,
        itemWiseDeliveryDateTime:
            itemWiseDeliveryDateTime ?? this.itemWiseDeliveryDateTime,
        deliveryStatusNo: deliveryStatusNo ?? this.deliveryStatusNo,
        itemTypeNo: itemTypeNo ?? this.itemTypeNo,
        itemTypeName: itemTypeName ?? this.itemTypeName,
        buNo: buNo ?? this.buNo,
        buName: buName ?? this.buName,
        itemNo: itemNo ?? this.itemNo,
        itemName: itemName ?? this.itemName,
        repItemName: repItemName ?? this.repItemName,
        stampNo: stampNo ?? this.stampNo,
        stampId: stampId ?? this.stampId,
        isReady: isReady ?? this.isReady,
        status: status ?? this.status,
        billStatus: billStatus ?? this.billStatus,
        b2BLabNo: b2BLabNo ?? this.b2BLabNo,
        billUnitNo: billUnitNo ?? this.billUnitNo,
        reportName: reportName ?? this.reportName,
        webStatus: webStatus ?? this.webStatus,
        testTempNo: testTempNo ?? this.testTempNo,
        tempName: tempName ?? this.tempName,
        formUrl: formUrl ?? this.formUrl,
        reportUrl: reportUrl ?? this.reportUrl,
        nationalId: nationalId ?? this.nationalId,
        passportNo: passportNo ?? this.passportNo,
        nonLabStatus: nonLabStatus ?? this.nonLabStatus,
        labId: labId ?? this.labId,
        specialItemFlag: specialItemFlag ?? this.specialItemFlag,
        companyNo: companyNo ?? this.companyNo,
        isFileUpload: isFileUpload ?? this.isFileUpload,
        attachmentName: attachmentName ?? this.attachmentName,
        attachmentPath: attachmentPath ?? this.attachmentPath,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
      );

  factory Report.fromJson(String str) => Report.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Report.fromMap(Map<String, dynamic> json) => Report(
        invoiceDtlNo: json["invoiceDtlNo"],
        regNo: json["regNo"],
        hospitalNumber: json["hospitalNumber"],
        patientName: json["patientName"],
        genderData: json["genderData"],
        age: json["age"],
        admissionNo: json["admissionNo"],
        admissionId: json["admissionId"],
        invoiceNo: json["invoiceNo"],
        invoiceId: json["invoiceId"],
        invoiceDate: json["invoiceDate"],
        refDocNo: json["refDocNo"],
        invoiceDateTime: json["invoiceDateTime"],
        reportDeliveryDate: json["reportDeliveryDate"],
        reportDeliveryDateTime: json["reportDeliveryDateTime"],
        itemWiseDeliveryDate: json["itemWiseDeliveryDate"],
        itemWiseDeliveryDateTime: json["itemWiseDeliveryDateTime"],
        deliveryStatusNo: json["deliveryStatusNo"],
        itemTypeNo: json["itemTypeNo"],
        itemTypeName: json["itemTypeName"],
        buNo: json["buNo"],
        buName: json["buName"],
        itemNo: json["itemNo"],
        itemName: json["itemName"],
        repItemName: json["repItemName"],
        stampNo: json["stampNo"],
        stampId: json["stampId"],
        isReady: json["isReady"],
        status: json["status"],
        billStatus: json["billStatus"],
        b2BLabNo: json["b2bLabNo"],
        billUnitNo: json["billUnitNo"],
        reportName: json["reportName"],
        webStatus: json["webStatus"],
        testTempNo: json["testTempNo"],
        tempName: json["tempName"],
        formUrl: json["formUrl"],
        reportUrl: json["reportUrl"],
        nationalId: json["nationalId"],
        passportNo: json["passportNo"],
        nonLabStatus: json["nonLabStatus"],
        labId: json["labId"],
        specialItemFlag: json["specialItemFlag"],
        companyNo: json["companyNo"],
        isFileUpload: json["isFileUpload"],
        attachmentName: json["attachmentName"],
        attachmentPath: json["attachmentPath"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
      );

  Map<String, dynamic> toMap() => {
        "invoiceDtlNo": invoiceDtlNo,
        "regNo": regNo,
        "hospitalNumber": hospitalNumber,
        "patientName": patientName,
        "genderData": genderData,
        "age": age,
        "admissionNo": admissionNo,
        "admissionId": admissionId,
        "invoiceNo": invoiceNo,
        "invoiceId": invoiceId,
        "invoiceDate": invoiceDate,
        "refDocNo": refDocNo,
        "invoiceDateTime": invoiceDateTime,
        "reportDeliveryDate": reportDeliveryDate,
        "reportDeliveryDateTime": reportDeliveryDateTime,
        "itemWiseDeliveryDate": itemWiseDeliveryDate,
        "itemWiseDeliveryDateTime": itemWiseDeliveryDateTime,
        "deliveryStatusNo": deliveryStatusNo,
        "itemTypeNo": itemTypeNo,
        "itemTypeName": itemTypeName,
        "buNo": buNo,
        "buName": buName,
        "itemNo": itemNo,
        "itemName": itemName,
        "repItemName": repItemName,
        "stampNo": stampNo,
        "stampId": stampId,
        "isReady": isReady,
        "status": status,
        "billStatus": billStatus,
        "b2bLabNo": b2BLabNo,
        "billUnitNo": billUnitNo,
        "reportName": reportName,
        "webStatus": webStatus,
        "testTempNo": testTempNo,
        "tempName": tempName,
        "formUrl": formUrl,
        "reportUrl": reportUrl,
        "nationalId": nationalId,
        "passportNo": passportNo,
        "nonLabStatus": nonLabStatus,
        "labId": labId,
        "specialItemFlag": specialItemFlag,
        "companyNo": companyNo,
        "isFileUpload": isFileUpload,
        "attachmentName": attachmentName,
        "attachmentPath": attachmentPath,
        "fromDate": fromDate,
        "toDate": toDate,
      };
}
