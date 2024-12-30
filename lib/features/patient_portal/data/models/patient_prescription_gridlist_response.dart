import 'dart:convert';

class PatientPrescriptionGridListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final PrescriptionGridList? obj;
  final dynamic count;

  PatientPrescriptionGridListResponse({
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

  PatientPrescriptionGridListResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    PrescriptionGridList? obj,
    dynamic count,
  }) =>
      PatientPrescriptionGridListResponse(
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

  factory PatientPrescriptionGridListResponse.fromJson(String str) =>
      PatientPrescriptionGridListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientPrescriptionGridListResponse.fromMap(
          Map<String, dynamic> json) =>
      PatientPrescriptionGridListResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null
            ? null
            : PrescriptionGridList.fromMap(json["obj"]),
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

class PrescriptionGridList {
  final String? draw;
  final String? recordsFiltered;
  final String? recordsTotal;
  final List<Prescription>? data;

  PrescriptionGridList({
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  PrescriptionGridList copyWith({
    String? draw,
    String? recordsFiltered,
    String? recordsTotal,
    List<Prescription>? data,
  }) =>
      PrescriptionGridList(
        draw: draw ?? this.draw,
        recordsFiltered: recordsFiltered ?? this.recordsFiltered,
        recordsTotal: recordsTotal ?? this.recordsTotal,
        data: data ?? this.data,
      );

  factory PrescriptionGridList.fromJson(String str) =>
      PrescriptionGridList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrescriptionGridList.fromMap(Map<String, dynamic> json) =>
      PrescriptionGridList(
        draw: json["draw"],
        recordsFiltered: json["recordsFiltered"],
        recordsTotal: json["recordsTotal"],
        data: json["data"] == null
            ? []
            : List<Prescription>.from(
                json["data"]!.map((x) => Prescription.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "draw": draw,
        "recordsFiltered": recordsFiltered,
        "recordsTotal": recordsTotal,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Prescription {
  final int? id;
  final String? appointId;
  final int? registrationNo;
  final String? hospitalId;
  final String? patientName;
  final String? phoneMobile;
  final String? dateOfBirth;
  final String? age;
  final int? ageYy;
  final int? ageMm;
  final int? ageDd;
  final String? gender;
  final int? consultTypeNo;
  final String? consultTypeDesc;
  final String? bloodGroup;
  final String? peAddr1;
  final int? doctorNo;
  final String? doctorId;
  final String? doctorName;
  final String? docDegree;
  final String? appointDate;
  final int? shiftdtlNo;
  final String? startTime;
  final String? endTime;
  final int? slotSl;
  final int? consultationNo;
  final String? consultationId;
  final String? consDate;
  final int? consultationFee;
  final int? companyNo;
  final int? consultationIn;
  final int? consultationOut;
  final String? consTime;
  final int? departmentNo;
  final String? departmentName;
  final String? consultationConfirmBy;
  final String? consultationConfirmTime;
  final int? prescriptionNo;
  final String? prescriptionDateTime;
  final int? isPatientIn;
  final int? isPatientOut;
  final String? isFeesPaid;
  final int? patTypeNo;
  final String? appointDateTime;
  final dynamic patientPhoto;
  final int? cancelFlag;
  final bool? consultationNoNotNull;
  final dynamic frmAppDate;
  final dynamic fromDate;
  final dynamic toDate;
  final bool? appointFilter;
  final bool? waitingFilter;
  final bool? doneFilter;
  final dynamic consultTypeNoList;
  final String? mstatus;

  Prescription({
    this.id,
    this.appointId,
    this.registrationNo,
    this.hospitalId,
    this.patientName,
    this.phoneMobile,
    this.dateOfBirth,
    this.age,
    this.ageYy,
    this.ageMm,
    this.ageDd,
    this.gender,
    this.consultTypeNo,
    this.consultTypeDesc,
    this.bloodGroup,
    this.peAddr1,
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.docDegree,
    this.appointDate,
    this.shiftdtlNo,
    this.startTime,
    this.endTime,
    this.slotSl,
    this.consultationNo,
    this.consultationId,
    this.consDate,
    this.consultationFee,
    this.companyNo,
    this.consultationIn,
    this.consultationOut,
    this.consTime,
    this.departmentNo,
    this.departmentName,
    this.consultationConfirmBy,
    this.consultationConfirmTime,
    this.prescriptionNo,
    this.prescriptionDateTime,
    this.isPatientIn,
    this.isPatientOut,
    this.isFeesPaid,
    this.patTypeNo,
    this.appointDateTime,
    this.patientPhoto,
    this.cancelFlag,
    this.consultationNoNotNull,
    this.frmAppDate,
    this.fromDate,
    this.toDate,
    this.appointFilter,
    this.waitingFilter,
    this.doneFilter,
    this.consultTypeNoList,
    this.mstatus,
  });

  Prescription copyWith({
    int? id,
    String? appointId,
    int? registrationNo,
    String? hospitalId,
    String? patientName,
    String? phoneMobile,
    String? dateOfBirth,
    String? age,
    int? ageYy,
    int? ageMm,
    int? ageDd,
    String? gender,
    int? consultTypeNo,
    String? consultTypeDesc,
    String? bloodGroup,
    String? peAddr1,
    int? doctorNo,
    String? doctorId,
    String? doctorName,
    String? docDegree,
    String? appointDate,
    int? shiftdtlNo,
    String? startTime,
    String? endTime,
    int? slotSl,
    int? consultationNo,
    String? consultationId,
    String? consDate,
    int? consultationFee,
    int? companyNo,
    int? consultationIn,
    int? consultationOut,
    String? consTime,
    int? departmentNo,
    String? departmentName,
    String? consultationConfirmBy,
    String? consultationConfirmTime,
    int? prescriptionNo,
    String? prescriptionDateTime,
    int? isPatientIn,
    int? isPatientOut,
    String? isFeesPaid,
    int? patTypeNo,
    String? appointDateTime,
    dynamic patientPhoto,
    int? cancelFlag,
    bool? consultationNoNotNull,
    dynamic frmAppDate,
    dynamic fromDate,
    dynamic toDate,
    bool? appointFilter,
    bool? waitingFilter,
    bool? doneFilter,
    dynamic consultTypeNoList,
    String? mstatus,
  }) =>
      Prescription(
        id: id ?? this.id,
        appointId: appointId ?? this.appointId,
        registrationNo: registrationNo ?? this.registrationNo,
        hospitalId: hospitalId ?? this.hospitalId,
        patientName: patientName ?? this.patientName,
        phoneMobile: phoneMobile ?? this.phoneMobile,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        age: age ?? this.age,
        ageYy: ageYy ?? this.ageYy,
        ageMm: ageMm ?? this.ageMm,
        ageDd: ageDd ?? this.ageDd,
        gender: gender ?? this.gender,
        consultTypeNo: consultTypeNo ?? this.consultTypeNo,
        consultTypeDesc: consultTypeDesc ?? this.consultTypeDesc,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        peAddr1: peAddr1 ?? this.peAddr1,
        doctorNo: doctorNo ?? this.doctorNo,
        doctorId: doctorId ?? this.doctorId,
        doctorName: doctorName ?? this.doctorName,
        docDegree: docDegree ?? this.docDegree,
        appointDate: appointDate ?? this.appointDate,
        shiftdtlNo: shiftdtlNo ?? this.shiftdtlNo,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        slotSl: slotSl ?? this.slotSl,
        consultationNo: consultationNo ?? this.consultationNo,
        consultationId: consultationId ?? this.consultationId,
        consDate: consDate ?? this.consDate,
        consultationFee: consultationFee ?? this.consultationFee,
        companyNo: companyNo ?? this.companyNo,
        consultationIn: consultationIn ?? this.consultationIn,
        consultationOut: consultationOut ?? this.consultationOut,
        consTime: consTime ?? this.consTime,
        departmentNo: departmentNo ?? this.departmentNo,
        departmentName: departmentName ?? this.departmentName,
        consultationConfirmBy:
            consultationConfirmBy ?? this.consultationConfirmBy,
        consultationConfirmTime:
            consultationConfirmTime ?? this.consultationConfirmTime,
        prescriptionNo: prescriptionNo ?? this.prescriptionNo,
        prescriptionDateTime: prescriptionDateTime ?? this.prescriptionDateTime,
        isPatientIn: isPatientIn ?? this.isPatientIn,
        isPatientOut: isPatientOut ?? this.isPatientOut,
        isFeesPaid: isFeesPaid ?? this.isFeesPaid,
        patTypeNo: patTypeNo ?? this.patTypeNo,
        appointDateTime: appointDateTime ?? this.appointDateTime,
        patientPhoto: patientPhoto ?? this.patientPhoto,
        cancelFlag: cancelFlag ?? this.cancelFlag,
        consultationNoNotNull:
            consultationNoNotNull ?? this.consultationNoNotNull,
        frmAppDate: frmAppDate ?? this.frmAppDate,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        appointFilter: appointFilter ?? this.appointFilter,
        waitingFilter: waitingFilter ?? this.waitingFilter,
        doneFilter: doneFilter ?? this.doneFilter,
        consultTypeNoList: consultTypeNoList ?? this.consultTypeNoList,
        mstatus: mstatus ?? this.mstatus,
      );

  factory Prescription.fromJson(String str) =>
      Prescription.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prescription.fromMap(Map<String, dynamic> json) => Prescription(
        id: json["id"],
        appointId: json["appointId"],
        registrationNo: json["registrationNo"],
        hospitalId: json["hospitalId"],
        patientName: json["patientName"],
        phoneMobile: json["phoneMobile"],
        dateOfBirth: json["dateOfBirth"],
        age: json["age"],
        ageYy: json["ageYy"],
        ageMm: json["ageMm"],
        ageDd: json["ageDd"],
        gender: json["gender"],
        consultTypeNo: json["consultTypeNo"],
        consultTypeDesc: json["consultTypeDesc"],
        bloodGroup: json["bloodGroup"],
        peAddr1: json["peAddr1"],
        doctorNo: json["doctorNo"],
        doctorId: json["doctorId"],
        doctorName: json["doctorName"],
        docDegree: json["docDegree"],
        appointDate: json["appointDate"],
        shiftdtlNo: json["shiftdtlNo"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        slotSl: json["slotSl"],
        consultationNo: json["consultationNo"],
        consultationId: json["consultationId"],
        consDate: json["consDate"],
        consultationFee: json["consultationFee"],
        companyNo: json["companyNo"],
        consultationIn: json["consultationIn"],
        consultationOut: json["consultationOut"],
        consTime: json["consTime"],
        departmentNo: json["departmentNo"],
        departmentName: json["departmentName"],
        consultationConfirmBy: json["consultationConfirmBy"],
        consultationConfirmTime: json["consultationConfirmTime"],
        prescriptionNo: json["prescriptionNo"],
        prescriptionDateTime: json["prescriptionDateTime"],
        isPatientIn: json["isPatientIn"],
        isPatientOut: json["isPatientOut"],
        isFeesPaid: json["isFeesPaid"],
        patTypeNo: json["patTypeNo"],
        appointDateTime: json["appointDateTime"],
        patientPhoto: json["patientPhoto"],
        cancelFlag: json["cancelFlag"],
        consultationNoNotNull: json["consultationNoNotNull"],
        frmAppDate: json["frmAppDate"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        appointFilter: json["appointFilter"],
        waitingFilter: json["waitingFilter"],
        doneFilter: json["doneFilter"],
        consultTypeNoList: json["consultTypeNoList"],
        mstatus: json["mstatus"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "appointId": appointId,
        "registrationNo": registrationNo,
        "hospitalId": hospitalId,
        "patientName": patientName,
        "phoneMobile": phoneMobile,
        "dateOfBirth": dateOfBirth,
        "age": age,
        "ageYy": ageYy,
        "ageMm": ageMm,
        "ageDd": ageDd,
        "gender": gender,
        "consultTypeNo": consultTypeNo,
        "consultTypeDesc": consultTypeDesc,
        "bloodGroup": bloodGroup,
        "peAddr1": peAddr1,
        "doctorNo": doctorNo,
        "doctorId": doctorId,
        "doctorName": doctorName,
        "docDegree": docDegree,
        "appointDate": appointDate,
        "shiftdtlNo": shiftdtlNo,
        "startTime": startTime,
        "endTime": endTime,
        "slotSl": slotSl,
        "consultationNo": consultationNo,
        "consultationId": consultationId,
        "consDate": consDate,
        "consultationFee": consultationFee,
        "companyNo": companyNo,
        "consultationIn": consultationIn,
        "consultationOut": consultationOut,
        "consTime": consTime,
        "departmentNo": departmentNo,
        "departmentName": departmentName,
        "consultationConfirmBy": consultationConfirmBy,
        "consultationConfirmTime": consultationConfirmTime,
        "prescriptionNo": prescriptionNo,
        "prescriptionDateTime": prescriptionDateTime,
        "isPatientIn": isPatientIn,
        "isPatientOut": isPatientOut,
        "isFeesPaid": isFeesPaid,
        "patTypeNo": patTypeNo,
        "appointDateTime": appointDateTime,
        "patientPhoto": patientPhoto,
        "cancelFlag": cancelFlag,
        "consultationNoNotNull": consultationNoNotNull,
        "frmAppDate": frmAppDate,
        "fromDate": fromDate,
        "toDate": toDate,
        "appointFilter": appointFilter,
        "waitingFilter": waitingFilter,
        "doneFilter": doneFilter,
        "consultTypeNoList": consultTypeNoList,
        "mstatus": mstatus,
      };
}
