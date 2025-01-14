import 'dart:convert';

class HisPatientInfoResponse {
  final bool? success;
  final bool? info;
  final bool? warning;
  final String? message;
  final bool? valid;
  final int? errorCode;
  final dynamic id;
  final dynamic model;
  final List<HisPatientInfo>? items;
  final HisPatientInfo? obj;
  final dynamic count;

  HisPatientInfoResponse({
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

  HisPatientInfoResponse copyWith({
    bool? success,
    bool? info,
    bool? warning,
    String? message,
    bool? valid,
    int? errorCode,
    dynamic id,
    dynamic model,
    dynamic items,
    HisPatientInfo? obj,
    dynamic count,
  }) =>
      HisPatientInfoResponse(
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

  factory HisPatientInfoResponse.fromJson(String str) =>
      HisPatientInfoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HisPatientInfoResponse.fromMap(Map<String, dynamic> json) =>
      HisPatientInfoResponse(
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
            : List<HisPatientInfo>.from(
                json["items"]!.map((x) => HisPatientInfo.fromMap(x))),
        obj: json["obj"] == null ? null : HisPatientInfo.fromMap(json["obj"]),
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

class HisPatientInfo {
  final int? ssCreator;
  final String? ssCreatedOn;
  final int? ssCreateSession;
  final int? ssModifier;
  final String? ssModifiedOn;
  final int? ssModifiedSession;
  final int? companyNo;
  final int? id;
  final int? activeStatus;
  final String? hospitalNumber;
  final String? regDate;
  final String? fname;
  final String? gender;
  final String? dob;
  final dynamic nationality;
  final String? bloodGroup;
  final dynamic identityMark;
  final String? salutation;
  final String? lname;
  final String? patientName;
  final String? genderData;
  final String? maritalStatus;
  final int? ageDd;
  final int? ageMm;
  final int? ageYy;
  final String? age;
  final String? phoneMobile;
  final dynamic foreignMobile;
  final dynamic phoneMobile2;
  final dynamic email;
  final String? address;
  final dynamic fatherName;
  final dynamic motherName;
  final dynamic spouseName;
  final dynamic passportNo;
  final int? patTypeNo;
  final int? regPoint;
  final dynamic phoneTnt;
  final dynamic upazilaNo;
  final dynamic upazilaName;
  final dynamic corClientNo;
  final dynamic corClientCardNo;
  final dynamic corClientDesig;
  final dynamic empNo;
  final dynamic relationNo;
  final dynamic nationalId;
  final dynamic religion;
  final dynamic presentAddress;
  final dynamic presentDistrict;
  final dynamic permanertAddress;
  final dynamic permanentDistrict;
  final dynamic personalId;
  final dynamic regType;
  final dynamic patientPhoto;
  final dynamic birthCertificateNo;
  final dynamic specialInstruction;
  final dynamic medCampaignNo;
  final dynamic remarks;
  final dynamic photo;
  final dynamic likeHospitalNumber;
  final dynamic notEqualId;
  final dynamic fromDate;
  final dynamic toDate;
  final dynamic phoneOrHNo;
  final dynamic blackListPatient;
  final dynamic vipPatientFlag;
  final dynamic isPassportNoApproved;
  final dynamic cardBilledStatus;
  final dynamic hnOrPhoneMobile;
  final String? mstatusData;

  HisPatientInfo({
    this.ssCreator,
    this.ssCreatedOn,
    this.ssCreateSession,
    this.ssModifier,
    this.ssModifiedOn,
    this.ssModifiedSession,
    this.companyNo,
    this.id,
    this.activeStatus,
    this.hospitalNumber,
    this.regDate,
    this.fname,
    this.gender,
    this.dob,
    this.nationality,
    this.bloodGroup,
    this.identityMark,
    this.salutation,
    this.lname,
    this.patientName,
    this.genderData,
    this.maritalStatus,
    this.ageDd,
    this.ageMm,
    this.ageYy,
    this.age,
    this.phoneMobile,
    this.foreignMobile,
    this.phoneMobile2,
    this.email,
    this.address,
    this.fatherName,
    this.motherName,
    this.spouseName,
    this.passportNo,
    this.patTypeNo,
    this.regPoint,
    this.phoneTnt,
    this.upazilaNo,
    this.upazilaName,
    this.corClientNo,
    this.corClientCardNo,
    this.corClientDesig,
    this.empNo,
    this.relationNo,
    this.nationalId,
    this.religion,
    this.presentAddress,
    this.presentDistrict,
    this.permanertAddress,
    this.permanentDistrict,
    this.personalId,
    this.regType,
    this.patientPhoto,
    this.birthCertificateNo,
    this.specialInstruction,
    this.medCampaignNo,
    this.remarks,
    this.photo,
    this.likeHospitalNumber,
    this.notEqualId,
    this.fromDate,
    this.toDate,
    this.phoneOrHNo,
    this.blackListPatient,
    this.vipPatientFlag,
    this.isPassportNoApproved,
    this.cardBilledStatus,
    this.hnOrPhoneMobile,
    this.mstatusData,
  });

  HisPatientInfo copyWith({
    int? ssCreator,
    String? ssCreatedOn,
    int? ssCreateSession,
    int? ssModifier,
    String? ssModifiedOn,
    int? ssModifiedSession,
    int? companyNo,
    int? id,
    int? activeStatus,
    String? hospitalNumber,
    String? regDate,
    String? fname,
    String? gender,
    String? dob,
    dynamic nationality,
    String? bloodGroup,
    dynamic identityMark,
    String? salutation,
    String? lname,
    String? patientName,
    String? genderData,
    String? maritalStatus,
    int? ageDd,
    int? ageMm,
    int? ageYy,
    String? age,
    String? phoneMobile,
    dynamic foreignMobile,
    dynamic phoneMobile2,
    dynamic email,
    String? address,
    dynamic fatherName,
    dynamic motherName,
    dynamic spouseName,
    dynamic passportNo,
    int? patTypeNo,
    int? regPoint,
    dynamic phoneTnt,
    dynamic upazilaNo,
    dynamic upazilaName,
    dynamic corClientNo,
    dynamic corClientCardNo,
    dynamic corClientDesig,
    dynamic empNo,
    dynamic relationNo,
    dynamic nationalId,
    dynamic religion,
    dynamic presentAddress,
    dynamic presentDistrict,
    dynamic permanertAddress,
    dynamic permanentDistrict,
    dynamic personalId,
    dynamic regType,
    dynamic patientPhoto,
    dynamic birthCertificateNo,
    dynamic specialInstruction,
    dynamic medCampaignNo,
    dynamic remarks,
    dynamic photo,
    dynamic likeHospitalNumber,
    dynamic notEqualId,
    dynamic fromDate,
    dynamic toDate,
    dynamic phoneOrHNo,
    dynamic blackListPatient,
    dynamic vipPatientFlag,
    dynamic isPassportNoApproved,
    dynamic cardBilledStatus,
    dynamic hnOrPhoneMobile,
    String? mstatusData,
  }) =>
      HisPatientInfo(
        ssCreator: ssCreator ?? this.ssCreator,
        ssCreatedOn: ssCreatedOn ?? this.ssCreatedOn,
        ssCreateSession: ssCreateSession ?? this.ssCreateSession,
        ssModifier: ssModifier ?? this.ssModifier,
        ssModifiedOn: ssModifiedOn ?? this.ssModifiedOn,
        ssModifiedSession: ssModifiedSession ?? this.ssModifiedSession,
        companyNo: companyNo ?? this.companyNo,
        id: id ?? this.id,
        activeStatus: activeStatus ?? this.activeStatus,
        hospitalNumber: hospitalNumber ?? this.hospitalNumber,
        regDate: regDate ?? this.regDate,
        fname: fname ?? this.fname,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        nationality: nationality ?? this.nationality,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        identityMark: identityMark ?? this.identityMark,
        salutation: salutation ?? this.salutation,
        lname: lname ?? this.lname,
        patientName: patientName ?? this.patientName,
        genderData: genderData ?? this.genderData,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        ageDd: ageDd ?? this.ageDd,
        ageMm: ageMm ?? this.ageMm,
        ageYy: ageYy ?? this.ageYy,
        age: age ?? this.age,
        phoneMobile: phoneMobile ?? this.phoneMobile,
        foreignMobile: foreignMobile ?? this.foreignMobile,
        phoneMobile2: phoneMobile2 ?? this.phoneMobile2,
        email: email ?? this.email,
        address: address ?? this.address,
        fatherName: fatherName ?? this.fatherName,
        motherName: motherName ?? this.motherName,
        spouseName: spouseName ?? this.spouseName,
        passportNo: passportNo ?? this.passportNo,
        patTypeNo: patTypeNo ?? this.patTypeNo,
        regPoint: regPoint ?? this.regPoint,
        phoneTnt: phoneTnt ?? this.phoneTnt,
        upazilaNo: upazilaNo ?? this.upazilaNo,
        upazilaName: upazilaName ?? this.upazilaName,
        corClientNo: corClientNo ?? this.corClientNo,
        corClientCardNo: corClientCardNo ?? this.corClientCardNo,
        corClientDesig: corClientDesig ?? this.corClientDesig,
        empNo: empNo ?? this.empNo,
        relationNo: relationNo ?? this.relationNo,
        nationalId: nationalId ?? this.nationalId,
        religion: religion ?? this.religion,
        presentAddress: presentAddress ?? this.presentAddress,
        presentDistrict: presentDistrict ?? this.presentDistrict,
        permanertAddress: permanertAddress ?? this.permanertAddress,
        permanentDistrict: permanentDistrict ?? this.permanentDistrict,
        personalId: personalId ?? this.personalId,
        regType: regType ?? this.regType,
        patientPhoto: patientPhoto ?? this.patientPhoto,
        birthCertificateNo: birthCertificateNo ?? this.birthCertificateNo,
        specialInstruction: specialInstruction ?? this.specialInstruction,
        medCampaignNo: medCampaignNo ?? this.medCampaignNo,
        remarks: remarks ?? this.remarks,
        photo: photo ?? this.photo,
        likeHospitalNumber: likeHospitalNumber ?? this.likeHospitalNumber,
        notEqualId: notEqualId ?? this.notEqualId,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        phoneOrHNo: phoneOrHNo ?? this.phoneOrHNo,
        blackListPatient: blackListPatient ?? this.blackListPatient,
        vipPatientFlag: vipPatientFlag ?? this.vipPatientFlag,
        isPassportNoApproved: isPassportNoApproved ?? this.isPassportNoApproved,
        cardBilledStatus: cardBilledStatus ?? this.cardBilledStatus,
        hnOrPhoneMobile: hnOrPhoneMobile ?? this.hnOrPhoneMobile,
        mstatusData: mstatusData ?? this.mstatusData,
      );

  factory HisPatientInfo.fromJson(String str) =>
      HisPatientInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HisPatientInfo.fromMap(Map<String, dynamic> json) => HisPatientInfo(
        ssCreator: json["ssCreator"],
        ssCreatedOn: json["ssCreatedOn"],
        ssCreateSession: json["ssCreateSession"],
        ssModifier: json["ssModifier"],
        ssModifiedOn: json["ssModifiedOn"],
        ssModifiedSession: json["ssModifiedSession"],
        companyNo: json["companyNo"],
        id: json["id"],
        activeStatus: json["activeStatus"],
        hospitalNumber: json["hospitalNumber"],
        regDate: json["regDate"],
        fname: json["fname"],
        gender: json["gender"],
        dob: json["dob"],
        nationality: json["nationality"],
        bloodGroup: json["bloodGroup"],
        identityMark: json["identityMark"],
        salutation: json["salutation"],
        lname: json["lname"],
        patientName: json["patientName"],
        genderData: json["genderData"],
        maritalStatus: json["maritalStatus"],
        ageDd: json["ageDd"],
        ageMm: json["ageMm"],
        ageYy: json["ageYy"],
        age: json["age"],
        phoneMobile: json["phoneMobile"],
        foreignMobile: json["foreignMobile"],
        phoneMobile2: json["phoneMobile2"],
        email: json["email"],
        address: json["address"],
        fatherName: json["fatherName"],
        motherName: json["motherName"],
        spouseName: json["spouseName"],
        passportNo: json["passportNo"],
        patTypeNo: json["patTypeNo"],
        regPoint: json["regPoint"],
        phoneTnt: json["phoneTnt"],
        upazilaNo: json["upazilaNo"],
        upazilaName: json["upazilaName"],
        corClientNo: json["corClientNo"],
        corClientCardNo: json["corClientCardNo"],
        corClientDesig: json["corClientDesig"],
        empNo: json["empNo"],
        relationNo: json["relationNo"],
        nationalId: json["nationalId"],
        religion: json["religion"],
        presentAddress: json["presentAddress"],
        presentDistrict: json["presentDistrict"],
        permanertAddress: json["permanertAddress"],
        permanentDistrict: json["permanentDistrict"],
        personalId: json["personalId"],
        regType: json["regType"],
        patientPhoto: json["patientPhoto"],
        birthCertificateNo: json["birthCertificateNo"],
        specialInstruction: json["specialInstruction"],
        medCampaignNo: json["medCampaignNo"],
        remarks: json["remarks"],
        photo: json["photo"],
        likeHospitalNumber: json["likeHospitalNumber"],
        notEqualId: json["notEqualId"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        phoneOrHNo: json["phoneOrHNo"],
        blackListPatient: json["blackListPatient"],
        vipPatientFlag: json["vipPatientFlag"],
        isPassportNoApproved: json["isPassportNoApproved"],
        cardBilledStatus: json["cardBilledStatus"],
        hnOrPhoneMobile: json["hnOrPhoneMobile"],
        mstatusData: json["mstatusData"],
      );

  Map<String, dynamic> toMap() => {
        "ssCreator": ssCreator,
        "ssCreatedOn": ssCreatedOn,
        "ssCreateSession": ssCreateSession,
        "ssModifier": ssModifier,
        "ssModifiedOn": ssModifiedOn,
        "ssModifiedSession": ssModifiedSession,
        "companyNo": companyNo,
        "id": id,
        "activeStatus": activeStatus,
        "hospitalNumber": hospitalNumber,
        "regDate": regDate,
        "fname": fname,
        "gender": gender,
        "dob": dob,
        "nationality": nationality,
        "bloodGroup": bloodGroup,
        "identityMark": identityMark,
        "salutation": salutation,
        "lname": lname,
        "patientName": patientName,
        "genderData": genderData,
        "maritalStatus": maritalStatus,
        "ageDd": ageDd,
        "ageMm": ageMm,
        "ageYy": ageYy,
        "age": age,
        "phoneMobile": phoneMobile,
        "foreignMobile": foreignMobile,
        "phoneMobile2": phoneMobile2,
        "email": email,
        "address": address,
        "fatherName": fatherName,
        "motherName": motherName,
        "spouseName": spouseName,
        "passportNo": passportNo,
        "patTypeNo": patTypeNo,
        "regPoint": regPoint,
        "phoneTnt": phoneTnt,
        "upazilaNo": upazilaNo,
        "upazilaName": upazilaName,
        "corClientNo": corClientNo,
        "corClientCardNo": corClientCardNo,
        "corClientDesig": corClientDesig,
        "empNo": empNo,
        "relationNo": relationNo,
        "nationalId": nationalId,
        "religion": religion,
        "presentAddress": presentAddress,
        "presentDistrict": presentDistrict,
        "permanertAddress": permanertAddress,
        "permanentDistrict": permanentDistrict,
        "personalId": personalId,
        "regType": regType,
        "patientPhoto": patientPhoto,
        "birthCertificateNo": birthCertificateNo,
        "specialInstruction": specialInstruction,
        "medCampaignNo": medCampaignNo,
        "remarks": remarks,
        "photo": photo,
        "likeHospitalNumber": likeHospitalNumber,
        "notEqualId": notEqualId,
        "fromDate": fromDate,
        "toDate": toDate,
        "phoneOrHNo": phoneOrHNo,
        "blackListPatient": blackListPatient,
        "vipPatientFlag": vipPatientFlag,
        "isPassportNoApproved": isPassportNoApproved,
        "cardBilledStatus": cardBilledStatus,
        "hnOrPhoneMobile": hnOrPhoneMobile,
        "mstatusData": mstatusData,
      };
}
