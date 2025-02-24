import 'dart:convert';

class DoctorGridListResponse {
  bool? success;
  bool? info;
  bool? warning;
  String? message;
  bool? valid;
  int? errorCode;
  dynamic id;
  dynamic model;
  dynamic items;
  DoctorGridList? obj;

  DoctorGridListResponse({
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
  });

  factory DoctorGridListResponse.fromJson(String str) =>
      DoctorGridListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorGridListResponse.fromMap(Map<String, dynamic> json) =>
      DoctorGridListResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null ? null : DoctorGridList.fromMap(json["obj"]),
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
      };
}

class DoctorGridList {
  String? draw;
  String? recordsFiltered;
  String? recordsTotal;
  List<Doctor>? data;

  DoctorGridList({
    this.draw,
    this.recordsFiltered,
    this.recordsTotal,
    this.data,
  });

  factory DoctorGridList.fromJson(String str) =>
      DoctorGridList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorGridList.fromMap(Map<String, dynamic> json) => DoctorGridList(
        draw: json["draw"],
        recordsFiltered: json["recordsFiltered"],
        recordsTotal: json["recordsTotal"],
        data: json["data"] == null
            ? []
            : List<Doctor>.from(
                json["data"]!.map((x) => Doctor.fromMap(x)),
              ),
      );

  Map<String, dynamic> toMap() => {
        "draw": draw,
        "recordsFiltered": recordsFiltered,
        "recordsTotal": recordsTotal,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Doctor {
  int? doctorNo;
  String? doctorId;
  String? doctorName;
  String? specializationName;
  int? specializationNo;
  String? chamberAddress1;
  dynamic chamberAddress2;
  String? chamber;
  String? doctorPhoto;
  int? activeStat;
  dynamic qualification;
  String? degree1;
  String? degree2;
  String? degree3;
  String? degree4;
  int? buNo;
  String? buName;
  int? intExtFlag;
  String? docDegree;
  String? docDesignation;
  String? doctorSignature;
  String? phoneMobile;
  String? roomId;
  String? doctorLocation;
  String? remarks;
  dynamic referralSaleMergin;
  int? opdConsultationFlag;
  int? opdConsultationFee;
  int? opdConsultationFeeOld;
  dynamic opdConsultationFeeRp;
  int? opdConsultationFeeStaff;
  int? opdConsultationFeeFl;
  dynamic avgDurationMin;
  dynamic avgLoadPerDay;
  dynamic blockLoad;
  dynamic opdConsultationPeriod;
  int? ipdConsultationFlag;
  int? ipdConsultationFee;
  dynamic actIpdConsultationFee;
  int? emrConsultationFlag;
  int? emrConsultationFee;
  dynamic daycareFlag;
  int? daycareConsultationFee;
  int? primaryDoctorFlag;
  int? surgeonFlag;
  int? dutyDoctorFlag;
  dynamic anaestesiologisFlag;
  int? reportingFlag;
  int? referalFlag;
  int? jobtitleNo;
  String? jobTitle;
  int? companyNo;
  String? gender;
  int? onlineDoctorFlag;
  dynamic buList;
  dynamic ogNo;
  String? photo;
  int? isSlotAvailable;
  dynamic specList;

  Doctor({
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.specializationName,
    this.specializationNo,
    this.chamberAddress1,
    this.chamberAddress2,
    this.chamber,
    this.doctorPhoto,
    this.activeStat,
    this.qualification,
    this.degree1,
    this.degree2,
    this.degree3,
    this.degree4,
    this.buNo,
    this.buName,
    this.intExtFlag,
    this.docDegree,
    this.docDesignation,
    this.doctorSignature,
    this.phoneMobile,
    this.roomId,
    this.doctorLocation,
    this.remarks,
    this.referralSaleMergin,
    this.opdConsultationFlag,
    this.opdConsultationFee,
    this.opdConsultationFeeOld,
    this.opdConsultationFeeRp,
    this.opdConsultationFeeStaff,
    this.opdConsultationFeeFl,
    this.avgDurationMin,
    this.avgLoadPerDay,
    this.blockLoad,
    this.opdConsultationPeriod,
    this.ipdConsultationFlag,
    this.ipdConsultationFee,
    this.actIpdConsultationFee,
    this.emrConsultationFlag,
    this.emrConsultationFee,
    this.daycareFlag,
    this.daycareConsultationFee,
    this.primaryDoctorFlag,
    this.surgeonFlag,
    this.dutyDoctorFlag,
    this.anaestesiologisFlag,
    this.reportingFlag,
    this.referalFlag,
    this.jobtitleNo,
    this.jobTitle,
    this.companyNo,
    this.gender,
    this.onlineDoctorFlag,
    this.buList,
    this.ogNo,
    this.photo,
    this.isSlotAvailable,
    this.specList,
  });

  factory Doctor.fromJson(String str) => Doctor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Doctor.fromMap(Map<String, dynamic> json) => Doctor(
        doctorNo: json["doctorNo"],
        doctorId: json["doctorId"],
        doctorName: json["doctorName"],
        specializationName: json["specializationName"],
        specializationNo: json["specializationNo"],
        chamberAddress1: json["chamberAddress1"],
        chamberAddress2: json["chamberAddress2"],
        chamber: json["chamber"],
        doctorPhoto: json["doctorPhoto"],
        activeStat: json["activeStat"],
        qualification: json["qualification"],
        degree1: json["degree1"],
        degree2: json["degree2"],
        degree3: json["degree3"],
        degree4: json["degree4"],
        buNo: json["buNo"],
        buName: json["buName"],
        intExtFlag: json["intExtFlag"],
        docDegree: json["docDegree"],
        docDesignation: json["docDesignation"],
        doctorSignature: json["doctorSignature"],
        phoneMobile: json["phoneMobile"],
        roomId: json["roomId"],
        doctorLocation: json["doctorLocation"],
        remarks: json["remarks"],
        referralSaleMergin: json["referralSaleMergin"],
        opdConsultationFlag: json["opdConsultationFlag"],
        opdConsultationFee: json["opdConsultationFee"],
        opdConsultationFeeOld: json["opdConsultationFeeOld"],
        opdConsultationFeeRp: json["opdConsultationFeeRp"],
        opdConsultationFeeStaff: json["opdConsultationFeeStaff"],
        opdConsultationFeeFl: json["opdConsultationFeeFl"],
        avgDurationMin: json["avgDurationMin"],
        avgLoadPerDay: json["avgLoadPerDay"],
        blockLoad: json["blockLoad"],
        opdConsultationPeriod: json["opdConsultationPeriod"],
        ipdConsultationFlag: json["ipdConsultationFlag"],
        ipdConsultationFee: json["ipdConsultationFee"],
        actIpdConsultationFee: json["actIpdConsultationFee"],
        emrConsultationFlag: json["emrConsultationFlag"],
        emrConsultationFee: json["emrConsultationFee"],
        daycareFlag: json["daycareFlag"],
        daycareConsultationFee: json["daycareConsultationFee"],
        primaryDoctorFlag: json["primaryDoctorFlag"],
        surgeonFlag: json["surgeonFlag"],
        dutyDoctorFlag: json["dutyDoctorFlag"],
        anaestesiologisFlag: json["anaestesiologisFlag"],
        reportingFlag: json["reportingFlag"],
        referalFlag: json["referalFlag"],
        jobtitleNo: json["jobtitleNo"],
        jobTitle: json["jobTitle"],
        companyNo: json["companyNo"],
        gender: json["gender"],
        onlineDoctorFlag: json["onlineDoctorFlag"],
        buList: json["buList"],
        ogNo: json["ogNo"],
        photo: json["photo"],
        isSlotAvailable: json["isSlotAvailable"],
        specList: json["specList"],
      );

  Map<String, dynamic> toMap() => {
        "doctorNo": doctorNo,
        "doctorId": doctorId,
        "doctorName": doctorName,
        "specializationName": specializationName,
        "specializationNo": specializationNo,
        "chamberAddress1": chamberAddress1,
        "chamberAddress2": chamberAddress2,
        "chamber": chamber,
        "doctorPhoto": doctorPhoto,
        "activeStat": activeStat,
        "qualification": qualification,
        "degree1": degree1,
        "degree2": degree2,
        "degree3": degree3,
        "degree4": degree4,
        "buNo": buNo,
        "buName": buName,
        "intExtFlag": intExtFlag,
        "docDegree": docDegree,
        "docDesignation": docDesignation,
        "doctorSignature": doctorSignature,
        "phoneMobile": phoneMobile,
        "roomId": roomId,
        "doctorLocation": doctorLocation,
        "remarks": remarks,
        "referralSaleMergin": referralSaleMergin,
        "opdConsultationFlag": opdConsultationFlag,
        "opdConsultationFee": opdConsultationFee,
        "opdConsultationFeeOld": opdConsultationFeeOld,
        "opdConsultationFeeRp": opdConsultationFeeRp,
        "opdConsultationFeeStaff": opdConsultationFeeStaff,
        "opdConsultationFeeFl": opdConsultationFeeFl,
        "avgDurationMin": avgDurationMin,
        "avgLoadPerDay": avgLoadPerDay,
        "blockLoad": blockLoad,
        "opdConsultationPeriod": opdConsultationPeriod,
        "ipdConsultationFlag": ipdConsultationFlag,
        "ipdConsultationFee": ipdConsultationFee,
        "actIpdConsultationFee": actIpdConsultationFee,
        "emrConsultationFlag": emrConsultationFlag,
        "emrConsultationFee": emrConsultationFee,
        "daycareFlag": daycareFlag,
        "daycareConsultationFee": daycareConsultationFee,
        "primaryDoctorFlag": primaryDoctorFlag,
        "surgeonFlag": surgeonFlag,
        "dutyDoctorFlag": dutyDoctorFlag,
        "anaestesiologisFlag": anaestesiologisFlag,
        "reportingFlag": reportingFlag,
        "referalFlag": referalFlag,
        "jobtitleNo": jobtitleNo,
        "jobTitle": jobTitle,
        "companyNo": companyNo,
        "gender": gender,
        "onlineDoctorFlag": onlineDoctorFlag,
        "buList": buList,
        "ogNo": ogNo,
        "photo": photo,
        "isSlotAvailable": isSlotAvailable,
        "specList": specList,
      };
}
