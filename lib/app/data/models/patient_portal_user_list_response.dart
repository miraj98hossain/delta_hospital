import 'dart:convert';

class PatientPortalListResponse {
    final bool? success;
    final bool? info;
    final bool? warning;
    final String? message;
    final bool? valid;
    final int? errorCode;
    final dynamic id;
    final dynamic model;
    final List<PatientPortalUser>? items;
    final dynamic obj;
    final dynamic count;

    PatientPortalListResponse({
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

    PatientPortalListResponse copyWith({
        bool? success,
        bool? info,
        bool? warning,
        String? message,
        bool? valid,
        int? errorCode,
        dynamic id,
        dynamic model,
        List<PatientPortalUser>? items,
        dynamic obj,
        dynamic count,
    }) => 
        PatientPortalListResponse(
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

    factory PatientPortalListResponse.fromJson(String str) => PatientPortalListResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PatientPortalListResponse.fromMap(Map<String, dynamic> json) => PatientPortalListResponse(
        success: json["success"],
        info: json["info"],
        warning: json["warning"],
        message: json["message"],
        valid: json["valid"],
        errorCode: json["errorCode"],
        id: json["id"],
        model: json["model"],
        items: json["items"] == null ? [] : List<PatientPortalUser>.from(json["items"]!.map((x) => PatientPortalUser.fromMap(x))),
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
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
        "obj": obj,
        "count": count,
    };
}

class PatientPortalUser {
    final int? documentId;
    final String? deviceId;
    final String? userId;
    final String? userPhoneNo;
    final String? mrn;
    final String? firstName;
    final String? lastName;
    final dynamic userImage;
    final String? dateOfBirth;
    final int? ageYear;
    final int? ageMonth;
    final int? ageDay;
    final String? gender;
    final String? email;
    final String? fullAddress;
    final String? password;
    final String? relationship;
    final String? refId;
    final String? type;
    final String? isPaid;
    final int? activeStatus;
    final String? ssCreatedOn;
    final String? ssModifiedOn;

    PatientPortalUser({
        this.documentId,
        this.deviceId,
        this.userId,
        this.userPhoneNo,
        this.mrn,
        this.firstName,
        this.lastName,
        this.userImage,
        this.dateOfBirth,
        this.ageYear,
        this.ageMonth,
        this.ageDay,
        this.gender,
        this.email,
        this.fullAddress,
        this.password,
        this.relationship,
        this.refId,
        this.type,
        this.isPaid,
        this.activeStatus,
        this.ssCreatedOn,
        this.ssModifiedOn,
    });

    PatientPortalUser copyWith({
        int? documentId,
        String? deviceId,
        String? userId,
        String? userPhoneNo,
        String? mrn,
        String? firstName,
        String? lastName,
        dynamic userImage,
        String? dateOfBirth,
        int? ageYear,
        int? ageMonth,
        int? ageDay,
        String? gender,
        String? email,
        String? fullAddress,
        String? password,
        String? relationship,
        String? refId,
        String? type,
        String? isPaid,
        int? activeStatus,
        String? ssCreatedOn,
        String? ssModifiedOn,
    }) => 
        PatientPortalUser(
            documentId: documentId ?? this.documentId,
            deviceId: deviceId ?? this.deviceId,
            userId: userId ?? this.userId,
            userPhoneNo: userPhoneNo ?? this.userPhoneNo,
            mrn: mrn ?? this.mrn,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            userImage: userImage ?? this.userImage,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            ageYear: ageYear ?? this.ageYear,
            ageMonth: ageMonth ?? this.ageMonth,
            ageDay: ageDay ?? this.ageDay,
            gender: gender ?? this.gender,
            email: email ?? this.email,
            fullAddress: fullAddress ?? this.fullAddress,
            password: password ?? this.password,
            relationship: relationship ?? this.relationship,
            refId: refId ?? this.refId,
            type: type ?? this.type,
            isPaid: isPaid ?? this.isPaid,
            activeStatus: activeStatus ?? this.activeStatus,
            ssCreatedOn: ssCreatedOn ?? this.ssCreatedOn,
            ssModifiedOn: ssModifiedOn ?? this.ssModifiedOn,
        );

    factory PatientPortalUser.fromJson(String str) => PatientPortalUser.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PatientPortalUser.fromMap(Map<String, dynamic> json) => PatientPortalUser(
        documentId: json["documentId"],
        deviceId: json["deviceId"],
        userId: json["userId"],
        userPhoneNo: json["userPhoneNo"],
        mrn: json["mrn"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        userImage: json["userImage"],
        dateOfBirth: json["dateOfBirth"],
        ageYear: json["ageYear"],
        ageMonth: json["ageMonth"],
        ageDay: json["ageDay"],
        gender: json["gender"],
        email: json["email"],
        fullAddress: json["fullAddress"],
        password: json["password"],
        relationship: json["relationship"],
        refId: json["refId"],
        type: json["type"],
        isPaid: json["isPaid"],
        activeStatus: json["activeStatus"],
        ssCreatedOn: json["ssCreatedOn"],
        ssModifiedOn: json["ssModifiedOn"],
    );

    Map<String, dynamic> toMap() => {
        "documentId": documentId,
        "deviceId": deviceId,
        "userId": userId,
        "userPhoneNo": userPhoneNo,
        "mrn": mrn,
        "firstName": firstName,
        "lastName": lastName,
        "userImage": userImage,
        "dateOfBirth": dateOfBirth,
        "ageYear": ageYear,
        "ageMonth": ageMonth,
        "ageDay": ageDay,
        "gender": gender,
        "email": email,
        "fullAddress": fullAddress,
        "password": password,
        "relationship": relationship,
        "refId": refId,
        "type": type,
        "isPaid": isPaid,
        "activeStatus": activeStatus,
        "ssCreatedOn": ssCreatedOn,
        "ssModifiedOn": ssModifiedOn,
    };
}
