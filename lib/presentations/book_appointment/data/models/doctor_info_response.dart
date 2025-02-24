import 'dart:convert';

class DoctorInfoResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final dynamic items;
  final DoctorInfo? obj;
  final dynamic count;

  DoctorInfoResponse({
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

  DoctorInfoResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    DoctorInfo? obj,
    dynamic count,
  }) =>
      DoctorInfoResponse(
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

  factory DoctorInfoResponse.fromJson(String str) =>
      DoctorInfoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorInfoResponse.fromMap(Map<String, dynamic> json) =>
      DoctorInfoResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"],
        obj: json["obj"] == null ? null : DoctorInfo.fromMap(json["obj"]),
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

class DoctorInfo {
  final int? id;
  final int? doctorNo;
  final String? doctorId;
  final String? doctorName;
  final int? jobtitleNo;
  final String? jobtitle;
  final dynamic docDegree;
  final dynamic specializationNo;
  final dynamic specializationName;
  final String? gender;
  final int? activeStat;
  final int? intExtFlag;
  final int? opdConsultationFee;
  final dynamic chamber;
  final dynamic doctorPhoto;
  final int? companyNo;
  final dynamic doctorPortfolio;
  final String? companyName;
  final String? onlineSlot;
  final dynamic appointmentMessage;
  final dynamic photo;
  final dynamic isSlotAvailable;
  final dynamic specList;

  DoctorInfo({
    this.id,
    this.doctorNo,
    this.doctorId,
    this.doctorName,
    this.jobtitleNo,
    this.jobtitle,
    this.docDegree,
    this.specializationNo,
    this.specializationName,
    this.gender,
    this.activeStat,
    this.intExtFlag,
    this.opdConsultationFee,
    this.chamber,
    this.doctorPhoto,
    this.companyNo,
    this.doctorPortfolio,
    this.companyName,
    this.onlineSlot,
    this.appointmentMessage,
    this.photo,
    this.isSlotAvailable,
    this.specList,
  });

  DoctorInfo copyWith({
    int? id,
    int? doctorNo,
    String? doctorId,
    String? doctorName,
    int? jobtitleNo,
    String? jobtitle,
    dynamic docDegree,
    dynamic specializationNo,
    dynamic specializationName,
    String? gender,
    int? activeStat,
    int? intExtFlag,
    int? opdConsultationFee,
    dynamic chamber,
    dynamic doctorPhoto,
    int? companyNo,
    dynamic doctorPortfolio,
    String? companyName,
    String? onlineSlot,
    dynamic appointmentMessage,
    dynamic photo,
    dynamic isSlotAvailable,
    dynamic specList,
  }) =>
      DoctorInfo(
        id: id ?? this.id,
        doctorNo: doctorNo ?? this.doctorNo,
        doctorId: doctorId ?? this.doctorId,
        doctorName: doctorName ?? this.doctorName,
        jobtitleNo: jobtitleNo ?? this.jobtitleNo,
        jobtitle: jobtitle ?? this.jobtitle,
        docDegree: docDegree ?? this.docDegree,
        specializationNo: specializationNo ?? this.specializationNo,
        specializationName: specializationName ?? this.specializationName,
        gender: gender ?? this.gender,
        activeStat: activeStat ?? this.activeStat,
        intExtFlag: intExtFlag ?? this.intExtFlag,
        opdConsultationFee: opdConsultationFee ?? this.opdConsultationFee,
        chamber: chamber ?? this.chamber,
        doctorPhoto: doctorPhoto ?? this.doctorPhoto,
        companyNo: companyNo ?? this.companyNo,
        doctorPortfolio: doctorPortfolio ?? this.doctorPortfolio,
        companyName: companyName ?? this.companyName,
        onlineSlot: onlineSlot ?? this.onlineSlot,
        appointmentMessage: appointmentMessage ?? this.appointmentMessage,
        photo: photo ?? this.photo,
        isSlotAvailable: isSlotAvailable ?? this.isSlotAvailable,
        specList: specList ?? this.specList,
      );

  factory DoctorInfo.fromJson(String str) =>
      DoctorInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorInfo.fromMap(Map<String, dynamic> json) => DoctorInfo(
        id: json["id"],
        doctorNo: json["doctorNo"],
        doctorId: json["doctorId"],
        doctorName: json["doctorName"],
        jobtitleNo: json["jobtitleNo"],
        jobtitle: json["jobtitle"],
        docDegree: json["docDegree"],
        specializationNo: json["specializationNo"],
        specializationName: json["specializationName"],
        gender: json["gender"],
        activeStat: json["activeStat"],
        intExtFlag: json["intExtFlag"],
        opdConsultationFee: json["opdConsultationFee"],
        chamber: json["chamber"],
        doctorPhoto: json["doctorPhoto"],
        companyNo: json["companyNo"],
        doctorPortfolio: json["doctorPortfolio"],
        companyName: json["companyName"],
        onlineSlot: json["onlineSlot"],
        appointmentMessage: json["appointmentMessage"],
        photo: json["photo"],
        isSlotAvailable: json["isSlotAvailable"],
        specList: json["specList"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "doctorNo": doctorNo,
        "doctorId": doctorId,
        "doctorName": doctorName,
        "jobtitleNo": jobtitleNo,
        "jobtitle": jobtitle,
        "docDegree": docDegree,
        "specializationNo": specializationNo,
        "specializationName": specializationName,
        "gender": gender,
        "activeStat": activeStat,
        "intExtFlag": intExtFlag,
        "opdConsultationFee": opdConsultationFee,
        "chamber": chamber,
        "doctorPhoto": doctorPhoto,
        "companyNo": companyNo,
        "doctorPortfolio": doctorPortfolio,
        "companyName": companyName,
        "onlineSlot": onlineSlot,
        "appointmentMessage": appointmentMessage,
        "photo": photo,
        "isSlotAvailable": isSlotAvailable,
        "specList": specList,
      };
}
