import 'dart:convert';

class DoctorAdmittedPatientListResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final dynamic message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<AdmittedPatient>? items;
  final dynamic obj;
  final dynamic count;

  DoctorAdmittedPatientListResponse({
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

  DoctorAdmittedPatientListResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    dynamic message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    List<AdmittedPatient>? items,
    dynamic obj,
    dynamic count,
  }) =>
      DoctorAdmittedPatientListResponse(
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

  factory DoctorAdmittedPatientListResponse.fromJson(String str) =>
      DoctorAdmittedPatientListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorAdmittedPatientListResponse.fromMap(
          Map<String, dynamic> json) =>
      DoctorAdmittedPatientListResponse(
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
            : List<AdmittedPatient>.from(
                json["items"]!.map((x) => AdmittedPatient.fromMap(x))),
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

class AdmittedPatient {
  final int? admissionNo;
  final String? admissionId;
  final int? regNo;
  final String? hospitalNumber;
  final String? patientName;
  final String? age;
  final String? genderData;
  final String? phoneMobile;
  final String? bedName;
  final String? admissionDateTime;
  final String? mstatusData;

  AdmittedPatient({
    this.admissionNo,
    this.admissionId,
    this.regNo,
    this.hospitalNumber,
    this.patientName,
    this.age,
    this.genderData,
    this.phoneMobile,
    this.bedName,
    this.admissionDateTime,
    this.mstatusData,
  });

  AdmittedPatient copyWith({
    int? admissionNo,
    String? admissionId,
    int? regNo,
    String? hospitalNumber,
    String? patientName,
    String? age,
    String? genderData,
    String? phoneMobile,
    String? bedName,
    String? admissionDateTime,
    String? mstatusData,
  }) =>
      AdmittedPatient(
        admissionNo: admissionNo ?? this.admissionNo,
        admissionId: admissionId ?? this.admissionId,
        regNo: regNo ?? this.regNo,
        hospitalNumber: hospitalNumber ?? this.hospitalNumber,
        patientName: patientName ?? this.patientName,
        age: age ?? this.age,
        genderData: genderData ?? this.genderData,
        phoneMobile: phoneMobile ?? this.phoneMobile,
        bedName: bedName ?? this.bedName,
        admissionDateTime: admissionDateTime ?? this.admissionDateTime,
        mstatusData: mstatusData ?? this.mstatusData,
      );

  factory AdmittedPatient.fromJson(String str) =>
      AdmittedPatient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdmittedPatient.fromMap(Map<String, dynamic> json) => AdmittedPatient(
        admissionNo: json["admissionNo"],
        admissionId: json["admissionId"],
        regNo: json["regNo"],
        hospitalNumber: json["hospitalNumber"],
        patientName: json["patientName"],
        age: json["age"],
        genderData: json["genderData"],
        phoneMobile: json["phoneMobile"],
        bedName: json["bedName"],
        admissionDateTime: json["admissionDateTime"],
        mstatusData: json["mstatusData"],
      );

  Map<String, dynamic> toMap() => {
        "admissionNo": admissionNo,
        "admissionId": admissionId,
        "regNo": regNo,
        "hospitalNumber": hospitalNumber,
        "patientName": patientName,
        "age": age,
        "genderData": genderData,
        "phoneMobile": phoneMobile,
        "bedName": bedName,
        "admissionDateTime": admissionDateTime,
        "mstatusData": mstatusData,
      };
}
